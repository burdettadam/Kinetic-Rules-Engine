#!/usr/bin/perl -w 
#
# This file is part of the Kinetic Rules Engine (KRE)
# Copyright (C) 2007-2011 Kynetx, Inc. 
#
# KRE is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of
# the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
# PURPOSE.  See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public
# License along with this program; if not, write to the Free
# Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
# MA 02111-1307 USA
#


use lib qw(/web/lib/perl);
use strict;
use warnings;

use Test::More;
use Test::LongString;

use Apache::Session::Memcached;
use DateTime;
use APR::URI;
use APR::Pool ();
use Cache::Memcached;


# most Kyentx modules require this
use Log::Log4perl qw(get_logger :levels);
Log::Log4perl->easy_init($INFO);
#Log::Log4perl->easy_init($DEBUG);

use Kynetx::Test qw/:all/;
use Kynetx::Request qw/:all/;
use Kynetx::Rids qw/:all/;
use Kynetx::Environments qw/:all/;
use Kynetx::Session qw/:all/;
use Kynetx::Configure qw/:all/;
use Kynetx::Persistence::Ruleset qw/:all/;


use Kynetx::FakeReq qw/:all/;


use Data::Dumper;
$Data::Dumper::Indent = 1;






my $r = Kynetx::Test::configure();

my $rid = 'cs_test';

# test choose_action and args

my $my_req_info = Kynetx::Test::gen_req_info($rid);

my $rule_name = 'foo';

my $rule_env = Kynetx::Test::gen_rule_env();

my $session = Kynetx::Test::gen_session($r, $rid);

my $test_count = 0;


my($rid_info_list);

$rid_info_list = Kynetx::Rids::parse_rid_list($my_req_info, ['cs_test.prod','cs_fuzz.dev']);

is_deeply($rid_info_list, 
[
  {
    'rid' => 'cs_test',
    'kinetic_app_version' => 'prod'
  },
  {
    'rid' => 'cs_fuzz',
    'kinetic_app_version' => 'dev'
  }
], "parsing works");

$test_count++;

diag "print_rids ", print_rids($rid_info_list);
diag "rid_info_string ", rid_info_string($rid_info_list);

my $rid_info;

is_deeply(mk_rid_info($my_req_info,"cs_test.prod"),
	  {"rid" => "cs_test",
	   "kinetic_app_version" => "prod"
	  },
	  "correctly parse rid with version"
);
$test_count++;

is_deeply(mk_rid_info($my_req_info,"cs_test.dev"),
	  {"rid" => "cs_test",
	   "kinetic_app_version" => "dev"
	  },
	  "correctly parse rid with version"
);
$test_count++;

is_deeply(mk_rid_info($my_req_info,"cs_test"),
	  {"rid" => "cs_test",
	   "kinetic_app_version" => "prod"
	  },
	  "correctly parse rid without version"
);
$test_count++;


done_testing($test_count);



1;


