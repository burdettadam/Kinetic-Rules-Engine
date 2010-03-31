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
use Cache::Memcached;

use Apache2::Const;
use APR::URI;
use APR::Pool;

use Kynetx::Test qw/:all/;
use Kynetx::Parser qw/:all/;
use Kynetx::KOBJ;
use Kynetx::Repository;
use Kynetx::Memcached qw/:all/;
use Kynetx::FakeReq qw/:all/;


use Log::Log4perl qw(get_logger :levels);
Log::Log4perl->easy_init($INFO);
#Log::Log4perl->easy_init($DEBUG);

my $numtests = 18;
plan tests => $numtests;


my $r = Kynetx::Test::configure();

my $rid = 'cs_test';

# test choose_action and args

my $my_req_info = Kynetx::Test::gen_req_info($rid);


#my $my_req_info;
#$my_req_info->{'referer'} = 'http://www.byu.edu'; # Utah (BYU)

# configure KNS
Kynetx::Configure::configure();

#Kynetx::Memcached->init();


# dispatch
my $svn_conn = "http://krl.kobj.net/rules/client/|cs|fizzbazz";

is_string_nows(
    Kynetx::KOBJ::dispatch($my_req_info,"cs_test;cs_test_1"), 
    '{"cs_test_1":["www.windley.com","www.kynetx.com"],"cs_test":["www.google.com","www.yahoo.com","www.live.com"]}',
    "Testing dispatch function with two RIDs");


my $dn = "http://127.0.0.1/js";

my $ruleset = $rid;



my $mech = Test::WWW::Mechanize->new();

SKIP: {
    my $ua = LWP::UserAgent->new;

    my $check_url = "$dn/version/$ruleset";
    diag "Checking $check_url";
    my $response = $ua->get($check_url);
    skip "No server available", $numtests if (! $response->is_success);

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

    # kobj.js
    my $url_version_3 = "$dn/$ruleset/kobj.js";
    #diag "Testing console with $url_version_3";

    $mech->get_ok($url_version_3);
    is($mech->content_type(), 'text/javascript');

    $mech->content_like(qr/var KOBJ= KOBJ || {\s*version:\s*'\d+\.\d+'\s*}/s);


    # dispatch
    my $url_version_4 = "$dn/dispatch/cs_test;cs_test_1/";
    diag "Testing dispatch with $url_version_4";

    $mech->get_ok($url_version_4);
    is($mech->content_type(), 'text/plain');

    $mech->content_like(qr/www\.windley\.com.*www\.yahoo\.com/s);

    # datasets
    my $url_version_5 = "$dn/datasets/cs_test;cs_test_1/";
    diag "Testing datasets with $url_version_5";

    $mech->get_ok($url_version_5);
    is($mech->content_type(), 'text/javascript');

    $mech->content_contains("KOBJ['data']['cached_timeline'] =");
    $mech->content_lacks("KOBJ['data']['public_timeline'] =");


}


1;


