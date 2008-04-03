package Kynetx::RuleManager;
# file: Kynetx/RuleManager.pm

use strict;
use warnings;

use Log::Log4perl qw(get_logger :levels);

use HTML::Template;
use Apache2::Request;
use JSON::XS;

use Kynetx::Parser qw(:all);
use Kynetx::PrettyPrinter qw(:all);
use Kynetx::Json qw/:all/;


use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

our $VERSION     = 1.00;
our @ISA         = qw(Exporter);

# put exported names inside the "qw"
our %EXPORT_TAGS = (all => [ 
qw(
) ]);
our @EXPORT_OK   =(@{ $EXPORT_TAGS{'all'} }) ;


# FIXME: get this from config
use constant DEFAULT_TEMPLATE_DIR => '/web/lib/perl/etc/tmpl';

sub handler {
    my $r = shift;


    # at some point we need a better dispatch function
    if($r->path_info =~ m!/validate/! ) {
	validate_rule($r);
    }

    return Apache2::Const::OK; 
}

1;

sub validate_rule {
    my ($r) = @_;

    my $logger = get_logger();


    my ($site) = $r->path_info =~ m#/(\d+)#;

    Log::Log4perl::MDC->put('site', $site);
    Log::Log4perl::MDC->put('rule', '[global]');  # no rule for now...

    my $req = Apache2::Request->new($r);

    my $template = DEFAULT_TEMPLATE_DIR . "/validate_rule.tmpl";
    my $test_template = HTML::Template->new(filename => $template);

    # fill in the parameters
    $test_template->param(ACTION_URL => $r->uri());

    my $rule = $req->param('rule');
    if($rule) {

	$logger->debug("[validate] validating rule");

	$test_template->param(RULE => $rule);

	my $tree = parse_ruleset($rule);
	
	if(defined $tree->{'error'}) {
	    warn $tree->{'error'};
	    $test_template->param(ERROR => $tree->{'error'});
	} else {
	    my $json = krlToJson($rule);
	    $test_template->param(JSON => $json);
	} 

    } 
    # print the page
    $r->content_type('text/html');
    print $test_template->output;

}

