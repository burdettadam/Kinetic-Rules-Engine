#!/usr/bin/perl -w 

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
use lib qw(/web/lib/perl);
use strict;

use Test::More;
use Test::LongString;
use Test::WWW::Mechanize;

use LWP::UserAgent;

use Apache2::Const;


# most Kyentx modules require this
use Log::Log4perl qw(get_logger :levels);
Log::Log4perl->easy_init($INFO);
#Log::Log4perl->easy_init($DEBUG);

use Kynetx::FakeReq qw/:all/;
use Kynetx::Test qw/:all/;
use Kynetx::RuleManager qw/:all/;

my $numtests = 73;
my $nonskippable = 15;
plan tests => $numtests;

my $my_req_info;

my $r = new Kynetx::FakeReq();


my $dn = "http://127.0.0.1/manage";

my $ruleset = "cs_test";

my $test_ruleset = <<RULESET;
ruleset 10 {
  rule test_choose is inactive {
    select using "/identity-policy/" setting ()

    pre {
    }

    if daytime() then 
    choose {
        first_rule_name =>
           replace("kobj_test", "/kynetx/newsletter_invite_1.inc")
	   with tags = ["gift certificate", "yellow"] and
	        delay = 30;

	second_rule_name =>
           replace("kobj_test", "/kynetx/newsletter_invite_2.inc")
	   with tags = ["discount", "blue"] and
	        draggable = true;

    }


    callbacks {
      success {
        click id="rssfeed";
        click class="newsletter"
      } 

      failure {
        click id="close_rss"
      }

    }

  }

}
RULESET

my $test_ruleset_bad = <<RULESET;
ruleset 10 {
    rule {}
    ;;;
}
RULESET


my $test_json_ruleset = <<JSON;
{"global":[],"dispatch":[],"ruleset_name":"10","rules":[{"cond":{"predicate":"daytime","args":[],"type":"simple"},"blocktype":"choose","actions":[{"action":{"source":null,"name":"replace","args":[{"val":"kobj_test","type":"str"},{"val":"/kynetx/newsletter_invite_1.inc","type":"str"}],"modifiers":[{"value":{"val":[{"val":"gift certificate","type":"str"},{"val":"yellow","type":"str"}],"type":"array"},"name":"tags"},{"value":{"val":30,"type":"num"},"name":"delay"}]},"label":"first_rule_name"},{"action":{"source":null,"name":"replace","args":[{"val":"kobj_test","type":"str"},{"val":"/kynetx/newsletter_invite_2.inc","type":"str"}],"modifiers":[{"value":{"val":[{"val":"discount","type":"str"},{"val":"blue","type":"str"}],"type":"array"},"name":"tags"},{"value":{"val":"true","type":"bool"},"name":"draggable"}]},"label":"second_rule_name"}],"post":null,"pre":[],"name":"test_choose","emit":null,"state":"inactive","callbacks":{"success":[{"attribute":"id", "trigger" : null, "value":"rssfeed","type":"click"},{"attribute":"class", "trigger" : null, "value":"newsletter","type":"click"}],"failure":[{"attribute":"id", "trigger" : null, "value":"close_rss","type":"click"}]},"pagetype":{"pattern":"/identity-policy/","vars":[],"foreach":[]}}],"meta":{}}
JSON

my $test_json_rule = <<JSON;
{"cond":{"predicate":"daytime","args":[],"type":"simple"},"blocktype":"choose","actions":[{"action":{"source":null,"name":"replace","args":[{"val":"kobj_test","type":"str"},{"val":"/kynetx/newsletter_invite_1.inc","type":"str"}],"modifiers":[{"value":{"val":[{"val":"gift certificate","type":"str"},{"val":"yellow","type":"str"}],"type":"array"},"name":"tags"},{"value":{"val":30,"type":"num"},"name":"delay"}]},"label":"first_rule_name"},{"action":{"source":null,"name":"replace","args":[{"val":"kobj_test","type":"str"},{"val":"/kynetx/newsletter_invite_2.inc","type":"str"}],"modifiers":[{"value":{"val":[{"val":"discount","type":"str"},{"val":"blue","type":"str"}],"type":"array"},"name":"tags"},{"value":{"val":"true","type":"bool"},"name":"draggable"}]},"label":"second_rule_name"}],"post":null,"pre":[],"name":"test_choose","emit":null,"state":"inactive","callbacks":{"success":[{"attribute":"id","trigger" : null, "value":"rssfeed","type":"click"},{"attribute":"class", "trigger" : null, "value":"newsletter","type":"click"}],"failure":[{"attribute":"id", "trigger" : null, "value":"close_rss","type":"click"}]},"pagetype":{"pattern":"/identity-policy/","vars":[],"foreach":[]}}
JSON

my $test_rule = <<RULE;
rule test_choose is inactive {
    select using "/identity-policy/" setting ()

    pre {
    }

    if daytime() then 
    choose {
        first_rule_name =>
           replace("kobj_test", "/kynetx/newsletter_invite_1.inc")
	   with tags = ["gift certificate", "yellow"] and
	        delay = 30;

	second_rule_name =>
           replace("kobj_test", "/kynetx/newsletter_invite_2.inc")
	   with tags = ["discount", "blue"] and
	        draggable = true;

    }


    callbacks {
      success {
        click id="rssfeed";
        click class="newsletter"
      } 

      failure {
        click id="close_rss"
      }

    }

}
RULE




my $test_rule_bad = <<RULE;
rule test_choose is stupid {
  do not select anything here.  
}
RULE


my $test_rule_body = <<RULEBODY;
    select using "/identity-policy/" setting ()

    pre {
    }

    if daytime() then 
    choose {
        first_rule_name =>
           replace("kobj_test", "/kynetx/newsletter_invite_1.inc")
	   with tags = ["gift certificate", "yellow"] and
	        delay = 30;

	second_rule_name =>
           replace("kobj_test", "/kynetx/newsletter_invite_2.inc")
	   with tags = ["discount", "blue"] and
	        draggable = true;

    }


    callbacks {
      success {
        click id="rssfeed";
        click class="newsletter"
      } 

      failure {
        click id="close_rss"
      }

    }
RULEBODY


my $test_global = <<GLOBAL;
global {

     dataset public_timeline <-  "http://twitter.com/statuses/public_timeline.json";

     dataset cached_timeline <- "http://twitter.com/statuses/public_timeline.json" cachable;

     emit <<
var foobar = 4;
     >>;

}
GLOBAL


my $test_global_bad = <<GLOBAL;
global {


     dataset cached_timeline <- "http://twitter.com/statuses/public_timeline.json" cachable

     emit <<
var foobar = 4;
     >>;

}
GLOBAL


my $test_json_global = <<JSON;
[{"source":"http://twitter.com/statuses/public_timeline.json","name":"public_timeline","type":"dataset","cachable":0},{"source":"http://twitter.com/statuses/public_timeline.json","name":"cached_timeline","type":"dataset","cachable":1},{"emit":"var foobar = 4;       "}]
JSON

my $test_dispatch = <<DISPATCH;
dispatch {

      domain "www.google.com"
      domain "search.yahoo.com"

      domain "www.google.com" -> "966337974"
      domain "google.com" -> "966337974"
      domain "www.circuitcity.com" -> "966337982"


}
DISPATCH

my $test_dispatch_bad = <<DISPATCH;
dispatch {

This should never work!

}
DISPATCH

my $test_json_dispatch = <<JSON;
[{"domain":"www.google.com","ruleset_id":null},{"domain":"search.yahoo.com","ruleset_id":null},{"domain":"www.google.com","ruleset_id":"966337974"},{"domain":"google.com","ruleset_id":"966337974"},{"domain":"www.circuitcity.com","ruleset_id":"966337982"}]
JSON

my $test_meta = <<META;
meta {
   description <<
Ruleset for testing something or other.
>>
   logging on
}
META

my $test_meta_bad = <<META;
meta {
 
 foobar is not a good entry for the meta stuff...
 
}
META

my $test_json_meta = <<JSON;
{"logging":"on","description":"Ruleset for testing something or other.  "}
JSON

my $json;

# check the API calls
$my_req_info->{'krl'} = $test_ruleset;

$json = Kynetx::RuleManager::parse_api($my_req_info, "parse", "ruleset");

is_string_nows($json, 
	       $test_json_ruleset,
	       "Parsing a ruleset");

$my_req_info->{'krl'} = $test_ruleset_bad;
#diag $my_req_info->{'krl'};

$json = Kynetx::RuleManager::parse_api($my_req_info, "parse", "ruleset");
#diag $json;

contains_string($json, 
	       'Invalid meta block',
	       "Parsing ruleset with syntax error");



# test rule api
$my_req_info->{'krl'} = $test_rule;

$json = Kynetx::RuleManager::parse_api($my_req_info, "parse", "rule");

is_string_nows($json, 
	       $test_json_rule,
	       "Parsing a rule");


$my_req_info->{'krl'} = $test_rule_bad;
#diag $my_req_info->{'krl'};

$json = Kynetx::RuleManager::parse_api($my_req_info, "parse", "rule");
#diag $json;

contains_string($json, 
	       'Invalid rule state',
	       "Parsing rule with syntax error");




$my_req_info->{'krl'} = $test_global;

$json = Kynetx::RuleManager::parse_api($my_req_info, "parse", "global");
#diag $json;

is_string_nows($json, 
	       $test_json_global,
	       "Parsing global decls");


$my_req_info->{'krl'} = $test_global_bad;

$json = Kynetx::RuleManager::parse_api($my_req_info, "parse", "global");

contains_string($json, 
	       'Invalid global decls',
	       "Parsing global decls with syntax error");


$my_req_info->{'krl'} = $test_dispatch;

$json = Kynetx::RuleManager::parse_api($my_req_info, "parse", "dispatch");

is_string_nows($json, 
	       $test_json_dispatch,
	       "Parsing dispatch decls");


$my_req_info->{'krl'} = $test_dispatch_bad;
#diag $my_req_info->{'krl'};

$json = Kynetx::RuleManager::parse_api($my_req_info, "parse", "dispatch");
#diag $json;

contains_string($json, 
	       'Invalid dispatch',
	       "Parsing dispatch decls with syntax error");



$my_req_info->{'krl'} = $test_meta;

$json = Kynetx::RuleManager::parse_api($my_req_info, "parse", "meta");
#diag $json;

is_string_nows($json, 
	       $test_json_meta,
	       "Parsing meta decls");


$my_req_info->{'krl'} = $test_meta_bad;
#diag $my_req_info->{'krl'};

$json = Kynetx::RuleManager::parse_api($my_req_info, "parse", "meta");
diag $json;

contains_string($json, 
	       'Invalid meta block',
	       "Parsing meta decls with syntax error");




# check the unparse API calls
my $krl;
$my_req_info->{'ast'} = $test_json_ruleset;

$krl = Kynetx::RuleManager::unparse_api($my_req_info, "unparse", "ruleset");

is_string_nows($krl, 
	       $test_ruleset,
	       "Unparsing a ruleset");

$my_req_info->{'ast'} = $test_json_rule;

$krl = Kynetx::RuleManager::unparse_api($my_req_info, "unparse", "rule");

is_string_nows($krl, 
	       $test_rule_body,
	       "Unparsing a rule");

$my_req_info->{'ast'} = $test_json_global;

$krl = Kynetx::RuleManager::unparse_api($my_req_info, "unparse", "global");

is_string_nows($krl, 
	       $test_global,
	       "Unparsing a global");


$my_req_info->{'ast'} = $test_json_dispatch;

$krl = Kynetx::RuleManager::unparse_api($my_req_info, "unparse", "dispatch");

is_string_nows($krl, 
	       $test_dispatch,
	       "Unparsing a dispatch");


$my_req_info->{'ast'} = $test_json_meta;

$krl = Kynetx::RuleManager::unparse_api($my_req_info, "unparse", "meta");

is_string_nows($krl, 
	       $test_meta,
	       "Unparsing a meta");




# check the server now

my $mech = Test::WWW::Mechanize->new();

my $skippable = $numtests - $nonskippable;

SKIP: {
    my $ua = LWP::UserAgent->new;

    my $check_url = "$dn/version/$ruleset";
    diag "Checking $check_url";
    my $response = $ua->get($check_url);
    skip "No server available", $skippable if (! $response->is_success);

    # test version function
    my $url_version_1 = "$dn/version/$ruleset";
    #diag "Testing console with $url_version_1";

    $mech->get_ok($url_version_1);
    is($mech->content_type(), 'text/html');

    $mech->title_is('KNS Version');

    $mech->content_like('/number\s+\d+/');

    my $url_version_2 = "$dn/version/$ruleset?flavor=json";
    #diag "Testing console with $url_version_2";

    $mech->get_ok($url_version_2);
    is($mech->content_type(), 'text/plain');

    $mech->content_like('/{"build_num"\s*:\s*"\d+/');

    # validate
    my $url_version_3 = "$dn/validate/$ruleset";
    #diag "Testing validate with $url_version_3";

    $mech->get_ok($url_version_3);
    $mech->field('rule',$test_ruleset);
    $mech->field('flavor', 'html');
    $mech->submit_form_ok();

    is($mech->content_type(), 'text/html');
    $mech->title_is('Validate KRL');
    $mech->content_contains('"ruleset_name":"10"');

    $mech->back();
    $mech->field('rule',$test_ruleset);
    $mech->field('flavor', 'json');
    $mech->submit_form_ok();

    is($mech->content_type(), 'text/plain');
    $mech->content_contains('"ruleset_name":"10"');

    # jsontokrl
    my $url_version_4 = "$dn/jsontokrl/$ruleset";
#    diag "Testing validate with $url_version_4";

    $mech->get_ok($url_version_4);
    $mech->field('json',$test_json_ruleset);
    $mech->field('type', 'ruleset');
    $mech->submit_form_ok();

    is($mech->content_type(), 'text/html');
    $mech->content_contains('ruleset 10 {');

    $mech->back();
    $mech->field('json',$test_json_rule);
    $mech->field('type', 'bodyonly');
    $mech->submit_form_ok();

    is($mech->content_type(), 'text/html');
    $mech->content_contains('select using "/identity-policy/" setting ()');


    # parse/ruleset
    my $url_version_5 = "$dn/parse/ruleset";
    diag "Testing $url_version_5";

    $mech->post_ok($url_version_5, ['krl'=> $test_ruleset]);

    is($mech->content_type(), 'text/plain');
    is_string_nows($mech->response()->content,$test_json_ruleset);


    # parse/rule
    my $url_version_6 = "$dn/parse/rule";
    diag "Testing $url_version_6";

    $mech->post_ok($url_version_6, ['krl'=> $test_rule]);

    is($mech->content_type(), 'text/plain');
    is_string_nows($mech->response()->content,$test_json_rule);


    # parse/global
    my $url_version_7 = "$dn/parse/global";
    diag "Testing $url_version_7";

    $mech->post_ok($url_version_7, ['krl'=> $test_global]);

    is($mech->content_type(), 'text/plain');
    is_string_nows($mech->response()->content,$test_json_global);


    # parse/global (bad)
    my $url_version_7a = "$dn/parse/global";
    diag "Testing $url_version_7a";

    $mech->post_ok($url_version_7a, ['krl'=> $test_global_bad]);

    is($mech->content_type(), 'text/plain');
    is_string_nows($mech->response()->content,'{"error":"Line 6:Invalid global decls: Was expecting /;/ but found \" emit<<\" instead\n"}');


    # parse/dispatch
    my $url_version_71 = "$dn/parse/dispatch";
    diag "Testing $url_version_71";

    $mech->post_ok($url_version_71, ['krl'=> $test_dispatch]);

    is($mech->content_type(), 'text/plain');
    is_string_nows($mech->response()->content,$test_json_dispatch);


    # parse/dispatch
    my $url_version_71a = "$dn/parse/dispatch";
    diag "Testing $url_version_71a";

    $mech->post_ok($url_version_71a, ['krl'=> $test_dispatch_bad]);

    is($mech->content_type(), 'text/plain');
    contains_string($mech->response()->content,
		    '{"error":"Line 3:Invalid dispatch: Was expecting');


    # parse/meta
    my $url_version_72 = "$dn/parse/meta";
    diag "Testing $url_version_72";

    $mech->post_ok($url_version_72, ['krl'=> $test_meta]);

    is($mech->content_type(), 'text/plain');
    is_string_nows($mech->response()->content,$test_json_meta);


    # parse/ruleset
    my $url_version_8 = "$dn/unparse/ruleset";
    diag "Testing $url_version_8";

    $mech->post_ok($url_version_8, ['ast'=> $test_json_ruleset]);

    is($mech->content_type(), 'text/plain');
    is_string_nows($mech->response()->content,$test_ruleset);


    # unparse/rule
    my $url_version_9 = "$dn/unparse/rule";
    diag "Testing $url_version_9";

    $mech->post_ok($url_version_9, ['ast'=> $test_json_rule]);

    is($mech->content_type(), 'text/plain');
    is_string_nows($mech->response()->content,$test_rule_body);


    # unparse/global
    my $url_version_10 = "$dn/unparse/global";
    diag "Testing $url_version_10";

    $mech->post_ok($url_version_10, ['ast'=> $test_json_global]);

    is($mech->content_type(), 'text/plain');
    is_string_nows($mech->response()->content,$test_global);


    # unparse/dispatch
    my $url_version_11 = "$dn/unparse/dispatch";
    diag "Testing $url_version_11";

    $mech->post_ok($url_version_11, ['ast'=> $test_json_dispatch]);

    is($mech->content_type(), 'text/plain');
    is_string_nows($mech->response()->content,$test_dispatch);


    # unparse/meta
    my $url_version_12 = "$dn/unparse/meta";
    diag "Testing $url_version_12";

    $mech->post_ok($url_version_12, ['ast'=> $test_json_meta]);

    is($mech->content_type(), 'text/plain');
    is_string_nows($mech->response()->content,$test_meta);




}


1;




