#!/usr/bin/perl -w 

use lib qw(/web/lib/perl);
use strict;

use Test::More;
use Test::LongString;

use APR::URI;
use APR::Pool ();


# most Kyentx modules require this
use Log::Log4perl qw(get_logger :levels);
Log::Log4perl->easy_init($INFO);
#Log::Log4perl->easy_init($DEBUG);
use Data::Dumper;

use Kynetx::Test qw/:all/;
use Kynetx::Operators qw/:all/;
use Kynetx::Parser qw/:all/;
use Kynetx::JavaScript qw/:all/;
use Kynetx::Environments qw/:all/;



$Data::Dumper::Indent = 1;



my $req_info;
$req_info->{'referer'} = 'http://www.byu.edu'; # Utah (BYU)
$req_info->{'pool'} = APR::Pool->new;

my $rule_name = 'foo';

my $rule_env = empty_rule_env();

$rule_env = extend_rule_env(
    ['a','b','c','d'],
    [10, 11, [4,5,6], []],
    $rule_env);



$rule_env = extend_rule_env('store', {
	"store"=> {
		"book"=> [ 
			{
				"category"=> "reference",
				"author"=> "Nigel Rees",
				"title"=> "Sayings of the Century",
				"price"=> 8.95,
				"ratings"=> [
					1,
					3,
					2,
					10
				]
			},
			{ 
				"category"=> "fiction",
				"author"=> "Evelyn Waugh",
				"title"=> "Sword of Honour",
				"price"=> 12.99,
				"ratings" => [
						"good",
						"bad",
						"lovely"
					]
			},
			{
				"category"=> "fiction",
				"author"=> "Herman Melville",
				"title"=> "Moby Dick",
				"isbn"=> "0-553-21311-3",
				"price"=> 8.99
			},
			{
				"category"=> "fiction",
				"author"=> "J. R. R. Tolkien",
				"title"=> "The Lord of the Rings",
				"isbn"=> "0-395-19395-8",
				"price"=> 22.99
			}
		],
		"bicycle"=> {
			"color"=> "red",
			"price"=> 19.95
		}
	}
}, $rule_env);


#diag Dumper($rule_env);

my (@e, @x, @d);

my $i = 0;

sub test_operator {
    my ($e, $x, $d) = @_;

    my ($v, $r);

    $v = Kynetx::Parser::parse_expr($e);
    diag Dumper($v) if $d;

    $r = eval_js_expr($v, $rule_env, $rule_name,$req_info);
    diag Dumper($r) if $d;
    is_deeply($r, $x, "Trying $e");
}

$e[$i] = q/store.pick("$.store.book[*].author")/;
$x[$i] = {
   'val' => [
     'Nigel Rees',
     'Evelyn Waugh',
     'Herman Melville',
     'J. R. R. Tolkien'
   ],
   'type' => 'array'
};
$i++;

$e[$i] = q/store.pick("$..author")/;
$x[$i] = {
   'val' => [
     'Nigel Rees',
     'Evelyn Waugh',
     'Herman Melville',
     'J. R. R. Tolkien'
   ],
   'type' => 'array'
};
$i++;

$e[$i] = q/store.pick("$..book[?(@.price<10)]")/;
$x[$i] = {
'val' => [
     {
       'ratings' => [
         1,
         3,
         2,
         10
       ],
       'price' => '8.95',
       'title' => 'Sayings of the Century',
       'author' => 'Nigel Rees',
       'category' => 'reference'
     },
     {
       'price' => '8.99',
       'isbn' => '0-553-21311-3',
       'title' => 'Moby Dick',
       'author' => 'Herman Melville',
       'category' => 'fiction'
     }
   ],
   'type' => 'array'
};
$i++;


$e[$i] = q/store.pick("$..book[?(@.price == 8.99)]")/;
$x[$i] = {
 'val' => 
     {
       'price' => '8.99',
       'isbn' => '0-553-21311-3',
       'title' => 'Moby Dick',
       'author' => 'Herman Melville',
       'category' => 'fiction'
     },
   'type' => 'hash'
};
$d[$i]  = 0;
$i++;


$e[$i] = q/store.pick("$..book[?(@.price == 8.99)]")/;
$x[$i] = {
 'val' => 
     {
       'price' => '8.99',
       'isbn' => '0-553-21311-3',
       'title' => 'Moby Dick',
       'author' => 'Herman Melville',
       'category' => 'fiction'
     },
   'type' => 'hash'
};
$d[$i]  = 0;
$i++;


$e[$i] = q/store.pick("$..book[?(@.price != 8.99)]")/;
$x[$i] = {
 'val' => [
     {
       'ratings' => [
         1,
         3,
         2,
         10
       ],
       'price' => '8.95',
       'title' => 'Sayings of the Century',
       'author' => 'Nigel Rees',
       'category' => 'reference'
     },
     {
       'ratings' => [
         'good',
         'bad',
         'lovely'
       ],
       'price' => '12.99',
       'title' => 'Sword of Honour',
       'author' => 'Evelyn Waugh',
       'category' => 'fiction'
     },
     {
       'price' => '22.99',
       'isbn' => '0-395-19395-8',
       'title' => 'The Lord of the Rings',
       'author' => 'J. R. R. Tolkien',
       'category' => 'fiction'
     }
   ],
   'type' => 'array'
};
$d[$i]  = 0;
$i++;

$e[$i] = q/store.pick("$..book[?(@.title eq 'Moby Dick')]")/;
$x[$i] = {
'val' => 
     {
       'price' => '8.99',
       'isbn' => '0-553-21311-3',
       'title' => 'Moby Dick',
       'author' => 'Herman Melville',
       'category' => 'fiction'
     },
   'type' => 'hash'
};
$d[$i]  = 0;
$i++;

$e[$i] = q/store.pick("$..book[?(@.title ne 'Moby Dick')]")/;
$x[$i] = {
'val' => [
     {
       'ratings' => [
         1,
         3,
         2,
         10
       ],
       'price' => '8.95',
       'title' => 'Sayings of the Century',
       'author' => 'Nigel Rees',
       'category' => 'reference'
     },
     {
       'ratings' => [
         'good',
         'bad',
         'lovely'
       ],
       'price' => '12.99',
       'title' => 'Sword of Honour',
       'author' => 'Evelyn Waugh',
       'category' => 'fiction'
     },
     {
       'price' => '22.99',
       'isbn' => '0-395-19395-8',
       'title' => 'The Lord of the Rings',
       'author' => 'J. R. R. Tolkien',
       'category' => 'fiction'
     }
   ],
   'type' => 'array'
};
$d[$i]  = 0;
$i++;

$e[$i] = q/store.pick("$.store..price")/;
$x[$i] = {
'val' => [
     '19.95',
     '8.95',
     '12.99',
     '8.99',
     '22.99'
   ],
   'type' => 'array'
};
$d[$i]  = 0;
$i++;

$e[$i] = q/store.pick("$..book[0,1]")/;
$x[$i] = {
'val' => [
     {
       'ratings' => [
         1,
         3,
         2,
         10
       ],
       'price' => '8.95',
       'title' => 'Sayings of the Century',
       'author' => 'Nigel Rees',
       'category' => 'reference'
     },
     {
       'ratings' => [
         'good',
         'bad',
         'lovely'
       ],
       'price' => '12.99',
       'title' => 'Sword of Honour',
       'author' => 'Evelyn Waugh',
       'category' => 'fiction'
     }
   ],
   'type' => 'array'
};
$d[$i]  = 0;
$i++;

$e[$i] = q/store.pick("$..book[0].price") + a/;
$x[$i] = {'val' => '18.95',
	  'type' => 'num'};
$d[$i]  = 0;
$i++;

$e[$i] = q/b + store.pick("$..book[1].price")/;
$x[$i] = {'val' => '23.99',
	  'type' => 'num'};
$d[$i]  = 0;
$i++;

$e[$i] = q/c.length()/;
$x[$i] = {
   'val' => 3,
   'type' => 'num'
};
$d[$i]  = 0;
$i++;


$e[$i] = q/d.length()/;
$x[$i] = {
   'val' => 0,
   'type' => 'num'
};
$d[$i]  = 0;
$i++;

$e[$i] = q/(store.pick("$..book[0,1]")).length()/;
$x[$i] = {
   'val' => 2,
   'type' => 'num'
};
$d[$i]  = 0;
$i++;


# now run the tests....
my $l = scalar @e;
plan tests => $l;

my $j;
for ($j = 0; $j < $i; $j++) {
    test_operator($e[$j], $x[$j], $d[$j]);
}


#
# testing length
#





1;


