use strict;
use warnings;

use Test::More tests => 8;

use_ok('Acme::MyPeek', qw(High_Int High_Dbl DataType));

my $hi = High_Int();
my $hd = High_Dbl();

diag("hi = $hi");
diag("hd = $hd");

is(  $hi,     sprintf('%d', $hi),     'High_Int == sprintf(High_Int)');
isnt($hi + 1, sprintf('%d', $hi + 1), 'High_Int + 1 != sprintf(High_Int + 1)');
ok($hi > 100,                         'High_Int > 100');
ok($hd > 100,                         'High_Dbl > 100');
is(DataType(5),     'IV',             'DataType(5)');
is(DataType(1.23),  'NV',             'DataType(1.23)');
is(DataType('abc'), 'PV',             'DataType(abc)');
