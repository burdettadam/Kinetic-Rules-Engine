package Kynetx::Operators::Query;
# file: Kynetx/Operators/Query.pm
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

use HTML::Query qw(Query);
use Log::Log4perl qw(get_logger :levels);
use Data::Dumper;
use Data::Diver qw(Dive);
use Storable qw(dclone);

use Kynetx::Expressions;

use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

our $VERSION     = 1.00;
our @ISA         = qw(Exporter);

# put exported names inside the "qw"
our %EXPORT_TAGS = (all => [
qw(
    query
) ]);
our @EXPORT_OK   =(@{ $EXPORT_TAGS{'all'} }) ;

sub query {
    my ($expr, $rule_env, $rule_name, $req_info, $session) = @_;
    my $logger = get_logger();


#    $logger->debug("Query: ", sub {Dumper($expr)});
    my $obj = $expr->{'obj'};
    if ($obj->{'type'} eq "persistent") {
      $logger->debug("Persistent query");
      return optimized_hash_query($expr, $rule_env, $rule_name, $req_info, $session);
    } else {

      $obj =
          Kynetx::Expressions::eval_expr($expr->{'obj'}, $rule_env, $rule_name,$req_info, $session);
      my $rands = Kynetx::Expressions::eval_rands($expr->{'args'}, $rule_env, $rule_name,$req_info, $session);
      $logger->debug("obj: ", sub {Dumper($obj)});
      $logger->debug("rands: ", sub {Dumper($rands)});
      my $selector = make_selector($rands->[0],$rule_env, $rule_name,$req_info, $session);
      my $format = "as_HTML";
      if ($rands->[1]->{'val'}){
        $format = "as_text";
      }
      my $source = make_source($obj);
      my $q = HTML::Query->new($source );
      my @elements = $q->query($selector)->$format;
      return Kynetx::Expressions::typed_value(\@elements);
  }
}

sub optimized_hash_query {
  my ($expr, $rule_env, $rule_name, $req_info, $session) = @_;
  my $logger = get_logger();
  my $domain = $expr->{'obj'}->{'domain'};
  my $inModule = Kynetx::Environments::lookup_rule_env('_inModule', $rule_env) || 0;
  my $moduleRid = Kynetx::Environments::lookup_rule_env('_moduleRID', $rule_env);
  my $rid = Kynetx::Rids::get_rid($req_info->{'rid'});
  if ($inModule) {
    $logger->debug("Evaling persistent in module: $moduleRid");
  }
  if (defined $moduleRid) {
    $rid = $moduleRid;
  }

  my $p_rands = Kynetx::Expressions::eval_rands($expr->{'args'}, $rule_env, $rule_name,$req_info, $session);
  my $path_to_key = $p_rands->[0];
  my $conditions = $p_rands->[1];
  my $expand = $p_rands->[2];
  if (defined $path_to_key && defined $conditions) {
    if ($path_to_key->{'type'} eq "array" &&
      $conditions->{'type'} eq "hash") {
        my @keypath;
        foreach my $pathelement (@{$path_to_key->{'val'}}) {
          my $obj =
              Kynetx::Expressions::eval_expr($pathelement, $rule_env, $rule_name,$req_info, $session);
          my $clean = $obj->{'val'};
          push(@keypath,$clean);
        }

        my $c_obj =
            Kynetx::Expressions::eval_expr($conditions, $rule_env, $rule_name,$req_info, $session);
        my $c_den = Kynetx::Expressions::den_to_exp($c_obj);
        my $ken = Kynetx::Persistence::KEN::get_ken($session,$rid);
        my $results = do_queries($domain,$rid,$ken,\@keypath,$expr->{'obj'}->{'name'},$c_den);
        if ($expand) {
              $logger->debug("Get the full object");
              my $p_object = Kynetx::Persistence::get_persistent_var($domain,
                 $rid,
                 $session,
                 $expr->{'obj'}->{'name'}) || 0;
            my @list = ();
	      $logger->debug("Now loop through it to get the objects");
            foreach my $path (@{$results}) {
                my $val = Dive($p_object,@{$path});

#	    	my $path = Kynetx::Util::normalize_path($req_info, $rule_env, $rule_name, $session, $expr->{'hash_key'});
#	    	my $var = $expr->{'var_expr'};
#	    	$logger->debug("Value in persistent $var with path: ", sub {Dumper($path)});
#	    	$v = Kynetx::Persistence::get_persistent_hash_element($domain,$rid,$session,$var,$path);


                push(@list,$val);
            }
	      $logger->debug("Done");
            return \@list;
        } else {
            return Kynetx::Expressions::mk_den_value($results);
        }
        
      }
  }
  $logger->warn("Bad format in query expression");
  return undef;

}

sub do_queries {
  my ($domain,$rid,$ken,$keypath,$keyname,$c_den) = @_;
  my $logger = get_logger();
  my $count;
  my $index =0 ;
  if (defined $keypath) {
    $index = scalar @{$keypath};
  }
  $logger->debug("Start queries");
  my $query_type = $c_den->{'requires'};
  my $tick = 1;
  foreach my $condition (@{$c_den->{'conditions'}}) {
    my ($collection,$base) = _base_key($domain,$rid,$ken,$keypath,$keyname);
    add_conditions_key($base,$condition);
    my $key = {'$and' => $base};
    $logger->debug("Query $tick using: ",sub {Dumper($key)});
    my $query = Kynetx::MongoDB::get_list($collection,$key);
    $logger->debug("Query $tick complete, found ",scalar @{$query}, " objects");
    foreach my $result (@{$query}) {
      my @path = @{$result->{'hashkey'}}[0 .. $index];      
      $count->{_signature(\@path)}++;     
    } 
    $logger->debug("Index ", $tick++, " complete");
  }
  
  my $target;
  if ($query_type eq '$or') {
    $target = 1;
  } else {
    $target = scalar @{$c_den->{'conditions'}};
  }
  
  my @result;
  $logger->debug("Need $target matches");
  foreach my $match (keys %{$count}) {
    if ($count->{$match} >= $target) {
      push(@result, _path($match))
    }
  }
  $logger->debug("Search results assembled");
  return \@result;
}

sub _signature {
  my ($path) = @_;  
  my $key = join("-|-",@{$path});
  return $key;
}

sub _path {
  my ($sig) = @_;
  my @path = split(/-\|-/,$sig);
  return \@path;
}

sub add_conditions_key {
  my ($base,$cond) = @_;
  my $logger = get_logger();
  my @c;    
  my $skey = $cond->{'search_key'};
  my $operator = $cond->{'operator'};
  my $value = $cond->{'value'};
  push(@{$base},{'hashkey' => {'$all' => $skey}});
  push(@{$base},{'value' => {$operator => $value}});
}


sub _parse_results {
  my ($results,$keypath,$conditions) = @_;
  my $logger = get_logger();
  my $matches;
  my $target = 1;
  my $type = $conditions->{'requires'};
  my $index = 0;
  if (defined $keypath && ref $keypath eq "ARRAY") {
    $index = scalar @{$keypath};
  }
  $logger->debug("Keypath: ", sub {Dumper($keypath)});
  foreach my $val (@{$results}) {
    my $path = $val->{'hashkey'};    
    my @key = @{$path}[0 .. $index];    
    my $key = join('_,_',@key);
    $matches->{$key}++;
  }  
  $logger->debug("Matches: ", sub {Dumper($matches)});
  if ($type eq '$and') {
    $target = unique_conditions($conditions);
  }
  my @results;
  foreach my $match (keys %{$matches}) {
    $logger->debug("Num: $matches->{$match} target: $target");
    if ($matches->{$match} >= $target) {
      my @key = split(/_,_/,$match);
      $logger->debug("Key: ", sub {Dumper(@key)});
      push(@results,\@key);
    }
  }
  return \@results;
}

sub unique_conditions {
  my ($conditions) = @_;
  my $count;
  foreach my $cond (@{$conditions->{'conditions'}}) {
    $count->{condition_signature($cond)}++;
  }
  return scalar keys %{$count};
}

sub _base_key {
  my ($domain,$rid,$ken,$base_path,$varname) = @_;
  my $logger = get_logger();
  $rid = Kynetx::Rids::get_rid($rid);
  my $root;
  my @r_conditions;
  my $collection;
  $logger->debug("Domain: $domain");
  if ($domain eq "ent") {
    $collection = +Kynetx::Persistence::Entity::COLLECTION;
  }
  if ($domain eq "ent") {
    $root = {
        "ken" => $ken,
        "rid" => $rid,
        "key" => $varname};
    $collection = +Kynetx::Persistence::Entity::COLLECTION;
  } else {
    $root = {
        "rid" => $rid,
        "key" => $varname};
        $collection = +Kynetx::Persistence::Application::COLLECTION;
  }
  push(@r_conditions, $root);
  if (ref $base_path eq "ARRAY" && (scalar @{$base_path} >0)){
    push(@r_conditions,{'hashkey' => {'$all' => $base_path}});
  }
  return ($collection,\@r_conditions);
}


sub _search_key {
  my ($conditions) = @_;
  return $conditions->{'search_key'};
}

sub make_source {
    my ($obj) = @_;
    my $logger = get_logger();
    my @sources;
    if ($obj->{'type'} eq 'str') {
        push(@sources,"text" => $obj->{'val'});
    } elsif ($obj->{'type'} eq 'array') {
        foreach my $element (@{$obj->{'val'}}) {
            push(@sources,"text" => \$element);
        }
    }
    return \@sources;
}

sub make_selector {
    my ($rand,$rule_env, $rule_name,$req_info, $session) = @_;
    my @selector;
    my $logger = get_logger();
    if ($rand->{'type'} eq 'str') {
        push (@selector, $rand->{'val'});
    } elsif ($rand->{'type'} eq 'array') {
        foreach my $element (@{$rand->{'val'}}) {
            my $obj =
                Kynetx::Expressions::eval_expr($element, $rule_env, $rule_name,$req_info, $session);
            my $clean = $obj->{'val'};
            push(@selector,$clean);
        }

    }
    return join(",",@selector);
}

1;
