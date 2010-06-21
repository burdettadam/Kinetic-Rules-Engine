package Kynetx::Predicates::Facebook;

# file: Kynetx/Predicates/Google.pm
# file: Kynetx/Predicates/Referers.pm
#
# Copyright 2007-2009, Kynetx Inc.  All rights reserved.
#
# This Software is an unpublished, proprietary work of Kynetx Inc.
# Your access to it does not grant you any rights, including, but not
# limited to, the right to install, execute, copy, transcribe, reverse
# engineer, or transmit it by any means.  Use of this Software is
# governed by the terms of a Software License Agreement transmitted
# separately.
#
# Any reproduction, redistribution, or reverse engineering of the
# Software not in accordance with the License Agreement is expressly
# prohibited by law, and may result in severe civil and criminal
# penalties. Violators will be prosecuted to the maximum extent
# possible.
#
# Without limiting the foregoing, copying or reproduction of the
# Software to any other server or location for further reproduction or
# redistribution is expressly prohibited, unless such reproduction or
# redistribution is expressly permitted by the License Agreement
# accompanying this Software.
#
# The Software is warranted, if at all, only according to the terms of
# the License Agreement. Except as warranted in the License Agreement,
# Kynetx Inc. hereby disclaims all warranties and conditions
# with regard to the software, including all warranties and conditions
# of merchantability, whether express, implied or statutory, fitness
# for a particular purpose, title and non-infringement.
#

use strict;
use warnings;
use lib qw(/web/lib/perl);

use Log::Log4perl qw(get_logger :levels);
use Data::Dumper;

use Kynetx::OAuth;
use Kynetx::Util qw(
  merror
  mis_error
);
use Kynetx::Configure;
use Kynetx::Memcached qw(mset_cache);
use Kynetx::Session qw(
  process_session
  session_cleanup
);
use Kynetx::Predicates::Google::OAuthHelper qw(
  get_consumer_tokens
  make_callback_url
  get_token
  blast_tokens
  parse_callback
  get_access_tokens
  set_auth_tokens
  get_protected_resource
  post_protected_resource
  trim_tokens
);

use Kynetx::Repository;
use LWP::UserAgent;
use URI::Escape ('uri_escape');
use DateTime;
use DateTime::Format::RFC3339;
use DateTime::Format::ISO8601;
use Encode;
use HTTP::Request::Common;

use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

our $VERSION = 1.00;
our @ISA     = qw(Exporter);

# put exported names inside the "qw"
our %EXPORT_TAGS = (
    all => [
        qw(
          process_oauth_callback
          get_arg_hash
          get_params
          eval_facebook
          get_predicates
          authorize
          NAMESPACE
          )
    ]
);
our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

use constant FB_AUTH_URL   => "https://graph.facebook.com/oauth/authorize";
use constant FB_ACCESS_URL => "https://graph.facebook.com/oauth/access_token";
use constant NAMESPACE     => "facebook";
my $fconfig    = Kynetx::Configure::get_config('FACEBOOK')->{'facebook'};
my %predicates = ();

my $actions = {
    'authorize' => {
        js => <<EOF,
function(uniq, cb, config) {
  \$K.kGrowl.defaults.header = "Authorize Facebook Access";
  if(typeof config === 'object') {
    \$K.extend(\$K.kGrowl.defaults,config);
  }
  \$K.kGrowl(KOBJ_facebook_notice);
  cb();
}
EOF
        before => \&authorize
    },
    'post' => {
        js => <<EOF,
function(uniq,cb,config) {
    /* Post to facebook */
    cb();
}
EOF
        before => \&post_to_facebook
    }

};

sub get_actions {
    return $actions;
}

sub get_predicates {
    return \%predicates;
}

my $funcs = {};

sub post_to_facebook {
    my ( $req_info, $rule_env, $session, $config, $mods, $args ) = @_;
    my $rid     = $req_info->{'rid'};
    my $logger  = get_logger();
    my $version = $req_info->{'rule_version'} || 'prod';
    my $url    = build( 'post', $args );
    my $content = build_post_content($args);
    my $resp = post_protected_resource( $req_info, $session, NAMESPACE,'', $url,$content );
    return $resp;
};

sub build_post_content {
    my ($args) = @_;
    my $logger = get_logger();
    my $writes = $fconfig->{'writes'};
    my $by_connection;
    foreach my $key (keys %$writes) {
        if ($writes->{$key}->{'parm'}) {
            my $parms = $writes->{$key}->{'parm'};
            map { $by_connection->{$key}->{$_} = 1} @$parms;
        }
    }
    my @temp;
    if (ref $args->[0] eq 'HASH') {
        my $type = $args->[0]->{'connection'};
        foreach my $key (keys %{$args->[0]}) {
            if ($by_connection->{$type}->{$key}) {
                push(@temp,$key."=".$args->[0]->{$key});
            }
        }
    }
    return join("&",@temp);
}

sub authorize {
    my ( $req_info, $rule_env, $session, $config, $mods, $args ) = @_;
    my $rid     = $req_info->{'rid'};
    my $logger  = get_logger();
    my $version = $req_info->{'rule_version'} || 'prod';
    my $scope   = get_scope($args);
    if ( mis_error($scope) ) {
        $logger->warn( "Authorize failure: ", $scope->{'DEBUG'} );
    }

    my $app_info = get_fb_app_info( $req_info, $session );
    $logger->debug( "Facebook application info for $rid: ",
                    sub { Dumper($app_info) } );

    unless ( $app_info ) {
        $logger->warn(
            "Facebook app (",
            sub {
                get_consumer_tokens( $req_info, $session, NAMESPACE )
                  ->{'consumer_key'};
            },
            ") not found!"
        );

        return;
    }

    my $app_name = $app_info->{'name'};
    my $app_link = $app_info->{'link'};

    my $auth_url = get_fb_auth_url( $req_info, $session, NAMESPACE, $scope );

    $logger->trace( "Authorization URL: ", $auth_url );

    my ( $divId, $msg ) =
      facebook_msg( $req_info, $auth_url, $app_name, $app_link );

    my $js =
      Kynetx::JavaScript::gen_js_var( $divId,
                                      Kynetx::JavaScript::mk_js_str($msg) );
    return $js;
}

sub authorized {
    my ( $req_info, $rule_env, $session, $rule_name, $function, $args ) = @_;
    my $rid    = $req_info->{'rid'};
    my $logger = get_logger();
    $logger->trace( "Args: ",           sub { Dumper($args) } );
    $logger->debug( "Session tokens: ", sub { Dumper($session) } );
    my $access_token = get_token( $rid, $session, 'access_token', NAMESPACE );
    if ($access_token) {
        $logger->debug( "Found Access Token for: ", NAMESPACE );
        my $resp = test_response( $req_info, $session );
        if ( defined $resp && $resp->is_success() ) {
            $logger->info( "Rule $rid authorized for ", NAMESPACE );
            return 1;
        } else {
            $logger->warn( "Auth failed for ", NAMESPACE, ":$rid" );
            blast_tokens( $rid, $session, NAMESPACE );
        }
    } else {
        $logger->debug( "No access token found for ", NAMESPACE );
    }
    blast_tokens( $rid, $session, NAMESPACE, '' );
    return 0;
}
$funcs->{'authorized'} = \&authorized;

sub metadata {
    my ( $req_info, $rule_env, $session, $rule_name, $function, $args ) = @_;
    my $logger = get_logger();
    my $rid    = $req_info->{'rid'};
    my $url    = build( $function, $args,$session,$rid );
    my $cachetime = get_cachetime($args);
    my $resp = get_protected_resource( $req_info, $session, NAMESPACE, $url,$cachetime );
    return eval_response($resp,$rid,$url,$cachetime);

}
$funcs->{'metadata'} = \&metadata;

sub picture {
    my ( $req_info, $rule_env, $session, $rule_name, $function, $args ) = @_;
    my $logger = get_logger();
    my $rid    = $req_info->{'rid'};
    my $url    = build( $function, $args,$session,$rid );
    my $cachetime = get_cachetime($args);
    my $resp = get_protected_resource( $req_info, $session, NAMESPACE, $url,$cachetime );
    return eval_response($resp,$rid,$url,$cachetime);

}
$funcs->{'picture'} = \&picture;

sub search {
    my ( $req_info, $rule_env, $session, $rule_name, $function, $args ) = @_;
    my $logger = get_logger();
    my $rid    = $req_info->{'rid'};
    my $url    = build( $function, $args,$session,$rid );
    my $cachetime = get_cachetime($args);
    $logger->debug( "Search URL: ", $url );
    my $resp = get_protected_resource( $req_info, $session, NAMESPACE, $url,$cachetime );
    return eval_response($resp,$rid,$url,$cachetime);

}
$funcs->{'search'} = \&search;

sub get {
    my ( $req_info, $rule_env, $session, $rule_name, $function, $args ) = @_;
    my $logger = get_logger();
    my $rid    = $req_info->{'rid'};
    my $url    = build( $function, $args,$session,$rid );
    $logger->debug( "GET URL: ", $url );
    my $cachetime = get_cachetime($args);
    my $resp = get_protected_resource( $req_info, $session, NAMESPACE, $url,$cachetime );
    return eval_response($resp,$rid,$url,$cachetime);
}
$funcs->{'get'} = \&get;

sub ids {
    my ( $req_info, $rule_env, $session, $rule_name, $function, $args ) = @_;
    my $logger = get_logger();
    my $rid    = $req_info->{'rid'};
    my $url    = build( $function, $args,$session,$rid );
    $logger->debug( "GET URL: ", $url );
    my $cachetime = get_cachetime($args);
    my $resp = get_protected_resource( $req_info, $session, NAMESPACE, $url,$cachetime );
    return eval_response($resp,$rid,$url,$cachetime);
}
$funcs->{'ids'} = \&ids;

sub mediator {
    my ( $req_info, $rule_env, $session, $rule_name, $function, $args ) = @_;
    my $logger = get_logger();
    return config_info($function,$args);
}
$funcs->{'fields'} = \&mediator;
$funcs->{'feed'} = \&mediator;
$funcs->{'connections'} = \&mediator;
$funcs->{'writes'} = \&mediator;

sub config_info {
    my ($function,$args) = @_;
    my $default = 'objects';
    my $target;
    if ($function eq 'fields') {
        $target = 'properties';
    } elsif ($function eq 'feed') {
        $target = 'feed';
    } elsif ($function eq 'connections') {
        $target = 'connections';
    } elsif ($function eq 'writes') {
        $default = $function;
        $target = 'parm';
    }
    my $num_args = scalar @$args;
    if ($num_args == 1) {
        my $f = $args->[0];
        if (ref $f eq '') {
            my $obj = $fconfig->{$default}->{$f};
            if ($obj) {
                return $obj->{$target};
            } else {
                return merror("Facebook object ($f) not found");
            }
        }
    }
    return merror("Invalid $function request");

}

sub build {
    my ( $function, $args, $session, $rid ) = @_;
    my $logger = get_logger();
    my $url    = $fconfig->{'urls'}->{'base'};
    if ( $function eq 'metadata' ) {
        my $fbid = get_id($args,$session,$rid);
        return "$url/$fbid?metadata=1";
    } elsif ($function eq 'post') {
        my $fbid    = get_id($args,$session,$rid);
        my $c       = get_connection($args);
        $url .= "/$fbid/$c";
        return $url;
    } elsif ( $function eq 'get' ) {
        my $fbid    = get_id($args,$session,$rid);
        my $p       = get_paging($args);
        my $c       = get_connection($args);
        my $f       = get_field_list($args);
        my @qparams = ();
        if ($p) {
            push( @qparams, $p );
        }
        if ($f) {
            push (@qparams,$f);
        }
        $url .= "/$fbid";
        if (defined $c) {
            if (mis_error($c)) {
                $logger->debug($c->{'DEBUG'});
                $logger->trace($c->{'TRACE'});
            } else {
                $url .= "/$c";
            }
        }
        my $q = join( '&', @qparams );
        if ($q) {
            $url .= '?' . $q;
        }

        return $url;
    } elsif ( $function eq 'picture' ) {
        my $fbid = get_id($args,$session,$rid);
        $url .= "/$fbid/picture";
        my $ptype = get_type( $args, $function );
        if ($ptype) {
            $url .= "?$ptype";
        }
        return $url;
    } elsif ( $function eq 'search' ) {
        my $type = get_type( $args, $function );
        my $fbid = get_id($args,$session,$rid);
        my $q    = get_query_string($args);
        my $p    = get_paging($args);

        # special case for searching users news feed
        if ( $type eq "type=home" ) {
            if ($q) {
                $url .= "/$fbid/home?$q";
            }
        } else {
            $url .= "/search?$q&$type";
        }
        if ($p) {
            $url .= "&$p";
        }
        return $url;
    } elsif ($function eq 'ids') {
        my $ids = get_ids($args);
        if ($ids) {
            $url .= "/?$ids";
            return $url;
        }
    }
}

sub get_ids {
    my ($args) = @_;
    my $logger=get_logger();
    if ( ref $args->[0] eq 'HASH' ) {
        my $f_arg = $args->[0]->{'ids'};
        if ($f_arg) {
            if (ref $f_arg eq '') {
                return "ids=$f_arg";
            } elsif (ref $f_arg eq "ARRAY") {
                my $str = join(",",@$f_arg);
                return "ids=$str";
            } else {
                $logger->warn("param ids expects a string or an array");
            }
        }
    }
}

sub get_field_list {
    my ($args) = @_;
    my $logger=get_logger();
    if ( ref $args->[0] eq 'HASH' ) {
        my $f_arg = $args->[0]->{'fields'};
        if ($f_arg) {
            if (ref $f_arg eq '') {
                return "fields=$f_arg";
            } elsif (ref $f_arg eq "ARRAY") {
                my $str = join(",",@$f_arg);
                return "fields=$str";
            } else {
                $logger->warn("param fields expects a string or an array");
            }
        }
    }
}

sub get_cachetime {
    my ($args) = @_;
    my $logger = get_logger();
    if (defined $args->[1] && ref $args->[1] eq '' && $args->[1] > 0) {
        return $args->[1];
    } else {
        return undef;
    }
}

sub get_connection {
    my ($args) = @_;
    my $logger = get_logger();
    if ( ref $args->[0] eq 'HASH' ) {
        my $connection = $args->[0]->{'connection'};
        my $type = $args->[0]->{'type'};
        if ($type && $connection) {
            my $obj = $fconfig->{'objects'}->{$type};
            if ($obj) {
                my $temp = $obj->{'connections'};
                my $type_hash;
                map { $type_hash->{$_} = 1 } @$temp;
                if ($type_hash->{$connection}) {
                    return $connection;
                } else {
                    $logger->debug("get connection, ", $connection, $type," ", sub{Dumper($type_hash)});
                    return merror("$connection invalid for object $type");
                }
            } else {
                $logger->warn("Invalid Facebook object ($type)");
            }
            return $connection;
        } elsif ($connection) {
            return $connection
        }
        return ;

    }
    return undef;
}

sub get_paging {
    my ($args)    = @_;
    my $logger    = get_logger();
    my $page_opts = $fconfig->{'paging'};
    my @parry;
    my $lpart = $args->[0];
    if ( ref $lpart eq 'HASH' ) {
        foreach my $element (@$page_opts) {
            if ( $lpart->{$element} ) {
                my $val = $element . "=" . $lpart->{$element};
                push( @parry, $val );
            }
        }
    }
    if (@parry) {
        return join( "&", @parry );
    } else {
        return undef;
    }

}

sub get_query_string {
    my ($args) = @_;
    my $logger = get_logger();
    my $q_part = $args->[0];
    if ( ref $q_part eq 'HASH' ) {
        my $qstring = $q_part->{'q'};
        if ($qstring) {
            return "q=$qstring";
        }
    }
    return '';

}

sub get_type {
    my ( $args, $ttype ) = @_;
    my $logger = get_logger();
    my $types  = $fconfig->{$ttype}->{'type'};
    if ( defined $types ) {
        my $type_part = $args->[0];

        #$logger->debug("Find type in: ", sub {Dumper($type_part)});
        my $type_hash;
        map { $type_hash->{$_} = 1 } @$types;

        #$logger->debug("type hash: ", sub {Dumper($type_hash)});
        if ( ref $type_part eq 'HASH' ) {
            my $type = $type_part->{'type'};

            #$logger->debug("Is HASH: ", $type);
            if ( $type_hash->{$type} ) {
                return 'type=' . $type;
            }

        } elsif ( $type_part && (ref $type_part eq '' )) {
            if ( $type_hash->{$type_part} ) {
                return 'type=' . $type_part;
            }
        }
    } elsif ( $ttype eq 'object ' ) {
    } else {
        $logger->warn("No config found for $ttype->type");
        return '';
    }
}

sub get_id {
    my ($args,$session,$rid)  = @_;
    my $logger  = get_logger();
    my $id_part = $args->[0];
    $logger->trace( "Get id: ", sub { Dumper($id_part) } );
    if ( defined $id_part ) {
        if ( ref $id_part eq '' ) {
            # Funny characters
            $id_part =~ m/(\w+)/;
            return $1;
        } elsif ( ref $id_part eq "HASH" ) {
            my $fbid = $id_part->{'id'};
            if ( defined $fbid ) {
                return $fbid;
            }
        }
    } else {
            my $token = get_token( $rid, $session, 'access_token', NAMESPACE);
            $token =~ m/\d+\|\w+-(\d+)|.+/;
            my $fbid = $1;
            $logger->debug("Found id: " , $fbid);
            if ($fbid) {
                return $fbid;
            }
    }
    return "me";
}

sub eval_facebook {
    my ( $req_info, $rule_env, $session, $rule_name, $function, $args ) = @_;
    my $logger = get_logger();
    $logger->debug( "eval_facebook evaluation with function -> ", $function );
    my $f = $funcs->{$function};
    if ( defined $f ) {
        my $result =
          $f->( $req_info, $rule_env, $session, $rule_name, $function, $args );
        if ( mis_error($result) ) {
            $logger->warn("Facebook request failed");
            $logger->debug( "fail: ", $result->{'DEBUG'} || '' );
            $logger->trace( "fail detail: ", $result->{'TRACE'} || '' );
            return [];
        } else {
            return $result;
        }
    } else {
        $logger->debug("Function $function not defined");
    }

}

sub eval_response {
    my ($resp,$rid,$url,$cache) = @_;
    my $logger = get_logger();
    my $fb_prefix = $fconfig->{'urls'}->{'base'};
    my $dont_cache = $fb_prefix . '/me';
    if ($url =~ m/^$dont_cache.*/) {
        $cache = 0;
    }
    if ( $resp->is_success ) {
        if ($cache) {
            my $key = $rid.":".$url;
            my $content = $resp->content;
            $logger->debug("cache call: ",$key," ",$content," ",$cache);
            mset_cache($key,$content,$cache);
        }
        my $ast = eval { Kynetx::Json::jsonToAst( $resp->content ) };
        if ($@) {
            $logger->warn( "Invalid JSON format: ", sub { Dumper($@) } );
            return $resp->content;
        }
        if ( is_empty_response($ast) ) {
            $logger->info("Facebook returned empty string");
        }
        return $ast;
    } elsif ( $resp->is_redirect ) {
        ### for pictures, FB returns a redirect location
        if ( $resp->code() == 302 ) {
            if ($cache) {
                my $key = $rid.":".$url;
                my $content = $resp->header('location');
                $logger->debug("cache redirect: ",$key," ",$content," ",$cache);
                mset_cache($key,$content,$cache);
            }
        return $resp->header('location');
        } else {
            $logger->warn( "Request redirect: (",
                           $resp->status_line, ") ",
                           $resp->header('location') );
        }
    } else {
        my $not_success = facebook_error_message($resp);
        return
          merror( $not_success,
                "Facebook responded with error: (" . $resp->status_line . ")" );
    }

}

sub facebook_error_message {
    my ($response) = @_;
    my $ast = eval { Kynetx::Json::jsonToAst( $response->content ) };
    if ($@) {
        return merror(
                      "Failure parsing Facebook error: " . $response->content );
    }
    if ( $ast->{'error'} ) {
        return merror(
               $ast->{'error'}->{'type'} . ":" . $ast->{'error'}->{'message'} );
    }
}

sub process_oauth_callback {
    my ( $r, $method, $rid ) = @_;
    my $logger = get_logger();
    $logger->debug("OAuth Callback: ", NAMESPACE);
    my $session = process_session($r);
    set_auth_tokens( $r, $method, $rid, $session, NAMESPACE );
    $logger->trace( "P_O_C tokens: ", sub { Dumper($session) } );
    my $callback_hash = parse_callback( $r, $method, $rid, NAMESPACE );
    $logger->trace( "Callback hash: ", sub { Dumper($callback_hash) } );
    my $req_info = $callback_hash->{'req_info'};

    if ( $rid ne $callback_hash->{'rid'} ) {
        $logger->warn( "Callback rid mis-match, expected: ",
                       $rid, " got: ", $callback_hash->{'rid'} );
    }
    my $caller = $callback_hash->{'caller'};
    $logger->debug("Caller: ", sub {Dumper($caller)});
    get_access_tokens( $req_info, $session, NAMESPACE, get_endpoints(),
                       $callback_hash );
    my $resp = test_response( $req_info, $session );
    if ( defined $resp && $resp->is_success() ) {
        $logger->info( "Rule $rid authorized for ", NAMESPACE );
        trim_tokens( $rid, $session, NAMESPACE );
    } else {
        $logger->warn( "Auth failed for ", NAMESPACE, ":$rid" );

        #blast_tokens( $rid, $session, NAMESPACE );
    }
    #Kynetx::Util::page_dump( $r, $req_info, $session, $caller, $resp );
    $r->headers_out->set( Location => $caller );
    session_cleanup($session);
}

sub test_response {
    my ( $req_info, $session ) = @_;
    my $logger   = get_logger();
    my $test_url = get_endpoints()->{'test_url'};
    my $resp =
      get_protected_resource( $req_info, $session, NAMESPACE, $test_url );
    $logger->trace( "Test request: ", sub { Dumper($resp) } );
    return $resp;
}

sub fake_callback {
    my $fake_string =
'http://64.55.47.131:8082/ruleset/fb_callback/a144x22/frooFruHappytime/Bar';

    return $fake_string;
}

sub get_scope {
    my ($args) = @_;
    my $logger = get_logger();
    $logger->trace( "Get scope for request ", sub { Dumper($args) } );
    unless ( defined $fconfig->{'scope'} ) {
        return merror("Facebook config file not initialized properly");
    }
    my $key = $args->[0];
    my @sarray;
    if ( ref $key eq 'ARRAY' ) {
        my $scope_r;
        my $scope_hash = $fconfig->{'scope'};
        foreach my $element (@$key) {
            $scope_r = "$element ->";
            if ( defined $scope_hash->{$element} ) {
                push( @sarray, $element );
                $scope_r .= " Y";
            } else {
                $scope_r .= " N";
            }
            $logger->debug($scope_r);
        }
        return join( ",", @sarray );
    } elsif ( ref $key eq '' && defined $fconfig->{'scope'}->{$key} ) {
        return $key;
    } else {
        return merror("No scope defined for: $key");
    }

}

sub get_endpoints {
    unless ( defined $fconfig->{'urls'} ) {
        return merror("Facebook config file not initialized properly");
    }
    return $fconfig->{'urls'};
}

sub facebook_msg {
    my ( $req_info, $auth_url, $app_name, $app_link ) = @_;
    my $rid          = $req_info->{'rid'};
    my $ruleset_name = $req_info->{"$rid:ruleset_name"};
    my $name         = $req_info->{"$rid:name"};
    my $author       = $req_info->{"$rid:author"};
    my $description  = $req_info->{"$rid:description"};
    my $divId        = "KOBJ_facebook_notice";

    my $msg = <<EOF;
<div id="$divId">
<p>The application</p>
<p><a href="$app_link" target="_blank" title="Open the application's Facebook page" style="color: white;font-weight:bold">$name ($rid)</a></p>
<p> from $author is requesting that you authorize Facebook to share your personal information with it.  </p>
<blockquote><b>Description:</b>$description</blockquote>
<p>
The application will not have access to your login credentials at Facebook.  If you click "Take me to Facebook" below, you will taken to Facebook and asked to authorize this application.  You can cancel at that point or now by clicking "No Thanks" below.  Note: if you cancel, this application may not work properly. After you have authorized this application, you will be redirected back to this page.
</p>
<div style="color: #000; background-color: #FFF; -moz-border-radius: 5px; -webkit-border-radius: 5px; padding: 10px;margin:10px;text-align:center;font-size:18px;"cursor": "pointer"">
<a href="$auth_url">Take me to Facebook</a></div>

<div style="color: #FFF; background-color: #F33; -moz-border-radius: 5px; -webkit-border-radius: 5px; padding: 10px;margin:10px;text-align:center;font-size:18px;"cursor": "pointer"" onclick="javascript:KOBJ.close_notification('#$divId')">No Thanks!</div>
</div>
EOF

    return ( $divId, $msg );

}

sub get_fb_app_info {
    my ( $req_info, $session ) = @_;
    my $consumer_keys = get_consumer_tokens( $req_info, $session, NAMESPACE );
    my $app_id        = $consumer_keys->{'consumer_key'};
    my $base          = $fconfig->{'urls'}->{'base'};
    my $app_url       = "$base/$app_id";
    return get_facebook_resource($app_url);
}

sub get_fb_auth_url {
    my ( $req_info, $session, $namespace, $scope ) = @_;
    my $consumer_keys = get_consumer_tokens( $req_info, $session, NAMESPACE );
    my $callback = uri_escape( make_callback_url( $req_info, NAMESPACE ) );
    my $auth_url = get_endpoints()->{'authorization_url'};
    $auth_url .= '?client_id=' . $consumer_keys->{'consumer_key'};
    $auth_url .= '&redirect_uri=' . $callback;
    $auth_url .= '&scope=' . $scope;

    #$auth_url .= '&secret_type=hmac-sha256';
    $auth_url .= '&type=web_server';
    return $auth_url;
}

sub get_facebook_resource {
    my ($url) = @_;
    my $logger = get_logger();
    my $hreq = HTTP::Request->new( GET => $url );
    my $ua   = LWP::UserAgent->new;
    my $resp = $ua->simple_request($hreq);
    if ( $resp->is_success ) {
        my $json = eval { Kynetx::Json::jsonToAst( $resp->content ) };
        if ($@) {
            $logger->debug(
                     "[Facebook] Invalid JSON format => parse result as string",
                     sub { Dumper(@_) } );
        } else {
            return $json;
        }
    }

}

sub nonce {
    my @a = ( 'A' .. 'Z', 'a' .. 'z', 0 .. 9 );
    my $nonce = '';
    for ( 0 .. 31 ) {
        $nonce .= $a[ rand( scalar(@a) ) ];
    }

    return $nonce;
}

sub get_params {
    my ( $args, $google_params, $defaults ) = @_;
    my $logger        = get_logger();
    my $passed_params = get_arg_hash($args);
    $logger->trace( "default params: ", sub { Dumper($defaults) } );
    $logger->trace( "passed params: ",  sub { Dumper($passed_params) } );
    foreach my $key ( keys %$defaults ) {
        if ( defined $passed_params->{$key} ) {
            my $val = undef;
            if ( ref $defaults->{$key} eq 'ARRAY' ) {
                $val =
                  validate_array( $passed_params->{$key}, $defaults->{$key} );
            } elsif ( $defaults->{$key} =~ m/<(\w+)>/ ) {
                my $match = $1 || "";
              case: for ($match) {
                    /qstring/ && do {
                        $val = validate_qstring( $passed_params->{$key} );
                    };
                    /_string/ && do {
                        $val = validate_nospace( $passed_params->{$key} );
                    };
                    /timestamp/ && do {
                        $val = validate_timestamp( $passed_params->{$key} );
                    };
                    /bool/ && do {
                        $val = validate_boolean( $passed_params->{$key} );
                    };
                    /int/ && do {
                        $val = validate_int( $passed_params->{$key} );
                    };
                    /ord/ && do {
                        $val = validate_ord( $passed_params->{$key} );
                    };
                    /card/ && do {
                        $val = validate_card( $passed_params->{$key} );
                    };

                }
            }
            $logger->trace( "returned: ", $val );
            if ( defined $val ) {
                $google_params->{$key} = $val;
            }
        } else {
            my $dvalue = default_value($key);
            if ($dvalue) {
                $google_params->{$key} = $dvalue;
            }
        }
    }
    return $google_params;

}

sub is_empty_response {
    my ($response) = @_;
    my $logger = get_logger();
    if ( ref $response eq 'HASH' and defined $response->{'data'} ) {
        my $data = $response->{'data'};
        if ( ref $data eq 'ARRAY' and @$data ) {
            return 0;
        } else {
            $logger->debug( "Is empty: ", sub { Dumper($response) } );
            return 1;
        }
    }
    return 0;
}

sub validate_array {
    my ( $val, $arry ) = @_;
    my $logger = get_logger();
    my %found;
    map { $found{$_} = 1 } @$arry;
    if ( $found{$val} ) {
        return $val;
    } else {
        return undef;
    }
}

sub validate_qstring {
    my ($arg) = @_;
    my $logger = get_logger();
    if ( defined $arg ) {
        return uri_escape($arg);
    } else {
        return undef;
    }
}

sub validate_nospace {
    my ($arg) = @_;
    my $logger = get_logger();
    if ( defined $arg ) {
        $arg =~ s/\s/_/g;
        return uri_escape($arg);
    } else {
        return undef;
    }

}

sub validate_boolean {
    my ($arg) = @_;
    if ( defined $arg ) {
        if ( lc($arg) eq 'true' ) {
            return 'true';
        } else {
            return 'false';
        }
    } else {
        return undef;
    }
}

sub validate_timestamp {
    my ($arg)  = @_;
    my $logger = get_logger();
    my $f      = DateTime::Format::RFC3339->new();
    my $dt     = DateTime::Format::ISO8601->parse_datetime($arg);
    if ( defined $arg ) {
        return $f->format_datetime($dt);
    } else {
        return undef;
    }
}

sub validate_int {
    my ($arg) = @_;
    my $logger = get_logger();
    if ( $arg =~ m/^\d+/ ) {
        return $arg;
    } else {
        return undef;
    }

}

sub validate_ord {
    my ($arg) = @_;
    my $logger = get_logger();
    if ( defined validate_int($arg) && $arg >= 1 ) {
        return $arg;
    } else {
        return undef;
    }
}

sub validate_card {
    my ($arg) = @_;
    my $logger = get_logger();
    if ( defined validate_int($arg) && $arg >= 0 ) {
        return $arg;
    } else {
        return undef;
    }
}

sub get_arg_hash {
    my ($args) = @_;
    if ( ref $args eq 'ARRAY' ) {
        foreach my $element (@$args) {
            if ( ref $element eq 'HASH' ) {
                return $element;
            }
        }
    }
}

1;