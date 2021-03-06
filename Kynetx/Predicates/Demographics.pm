package Kynetx::Predicates::Demographics;
# file: Kynetx/Predicates/Demographics.pm
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
use strict;
#use warnings;

use Log::Log4perl qw(get_logger :levels);

use AnyDBM_File;
use Fcntl; # needed for O_ thingies

use Kynetx::Util qw(:all);
use Kynetx::Memcached qw(:all);
use Kynetx::Predicates::Location qw(get_geoip);


use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

our $VERSION     = 1.00;
our @ISA         = qw(Exporter);

# put exported names inside the "qw"
our %EXPORT_TAGS = (all => [ 
qw(
get_demographics
) ]);
our @EXPORT_OK   =(@{ $EXPORT_TAGS{'all'} }) ;


use constant DEFAULT_DB_DIR => '/web/lib/perl/etc/db/';
use constant POPULATION_THRESHHOLD => .70;

my %predicates = (

    'median_income_above' => sub {
	my ($req_info, $rule_env, $args) = @_;

	my $income = get_demographics($req_info, 'median_income');

	my $desired = $args->[0] || 0;
	$desired =~ s/^'(.*)'$/$1/;  # for now, we have to remove quotes

	my $logger = get_logger();
        $logger->debug("Income: ". $income . " ?> " . $desired);

	return int($income) > $desired;
	    
    },

    'median_income_between' => sub {
	my ($req_info, $rule_env, $args) = @_;

	my $income = get_demographics($req_info, 'median_income');

	my $low = $args->[0] || 0;
	$low =~ s/^'(.*)'$/$1/;  # for now, we have to remove quotes

	my $high = $args->[1] || 1000000;
	$high =~ s/^'(.*)'$/$1/;  # for now, we have to remove quotes

	my $logger = get_logger();
        $logger->debug("Income: ". $income . " between " . $low ." & ". $high);

	return int($income) > $low && int($income) < $high;
	    
    },

    'rural' => sub {
	my ($req_info, $rule_env, $args) = @_;

	my $rural_pop = get_demographics($req_info, 'rural_pop');
	my $total_pop = get_demographics($req_info, 'total_pop');


	$total_pop = int($total_pop) || 1; # no div by zero!
	my $rural_percent = int($rural_pop)/int($total_pop);

	my $logger = get_logger();
        $logger->debug("Rural percent ". $rural_percent);

	return $rural_percent > POPULATION_THRESHHOLD;
	    
    },

    'urban' => sub {
	my ($req_info, $rule_env, $args) = @_;

	my $urban_pop = get_demographics($req_info, 'urban_pop') || 0;
	my $total_pop = get_demographics($req_info, 'total_pop') || 1; # no div by zero!

	$total_pop = int($total_pop); 

	my $urban_percent = int($urban_pop)/$total_pop;

	my $logger = get_logger();
        $logger->debug("Urban percent ". $urban_percent);

	return $urban_percent > POPULATION_THRESHHOLD;
	    
    },



 );


# need predicates already defined for this
$predicates{'median_income_below'} = sub {
    return ! $predicates{'median_income_above'}(@_)

};


sub get_predicates {
    return \%predicates;
}

# condition subfunctions
# first argument is a record of data about the request

sub get_demographics {
    # $field is on of the valid GeoIP record field names
    my ($req_info, $field) = @_;

    my $logger = get_logger();

    my @field_names = qw(
                         median_income
			 total_pop
			 urban_pop
			 rural_pop
                        );

    if(not defined $req_info->{'demographics'}->{$field}) {


	my $zip = get_geoip($req_info, 'postal_code');


	# FIXME: urls are hardcoded in this function
	# FIXME: expirations are hardcoded here
	# FIXME: this code is duplicated in Weather.pm

	# if we don't get a 5 digit zip, then look up the location code
	if ($zip !~ m/^\d\d\d\d\d$/) {

	    my $city = get_geoip($req_info, 'city');
	    my $region = get_geoip($req_info, 'region');
	    my $country_name = get_geoip($req_info, 'country_name');
	    my $country_code = get_geoip($req_info, 'country_code');
	    $logger->debug("[Demographics] $city, $region, $zip, $country_name");
	    
	    my $url = "http://xoap.weather.com/weather/search/search?where=";
	    if ($country_code eq 'US') {
		$url .= "$city%20$region";
	    } else {
		# demographics only works for the US
		return 0;
	    }
	    my $locxml = new XML::XPath->new(
		xml => 
		get_remote_data($url, 60 * 60 * 24 * 29) # expire after 29 days
		);
	    # grab the first location ID
	    $zip = $locxml->find('//loc[1]/@id');
	    
	}	
	$logger->debug("[demographics] Using code $zip for ZIP");


	# FIXME: hard coded URL
    
	
	my %demo;
	my $db_name = DEFAULT_DB_DIR .'demographics.dbx';

	tie(%demo, 'AnyDBM_File', $db_name, O_RDONLY)
	    or die("can't open \%demo ($db_name): $!");
	

	my($total_pop,$urban_pop,$rural_pop,$median_income) = 
	    split(/:/,$demo{$zip} || "0:0:0:0");

	$logger->debug("Demograhic results: ", $demo{$zip});
	

	$logger->debug("Demographic data for ($field): ", 
		       $zip, "->", $median_income);


	$req_info->{'demographics'}->{'total_pop'} = $total_pop;
	$req_info->{'demographics'}->{'urban_pop'} = $urban_pop;
	$req_info->{'demographics'}->{'rural_pop'} = $rural_pop;
	$req_info->{'demographics'}->{'median_income'} = $median_income;
	
	untie(%demo);

    }

    return $req_info->{'demographics'}->{$field};

}





1;
