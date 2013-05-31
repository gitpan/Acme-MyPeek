use strict;
use warnings;

use Test::More tests => 8;

use_ok('Acme::MyPeek');

my $hi = hi();
my $hd = hd();

diag("hi = <$hi>");
diag("hd = <$hd>");

is(  $hi,     sprintf('%u', $hi),     'hi() '    .'== sprintf(hi()'.    ')');
isnt($hi + 1, sprintf('%u', $hi + 1), 'hi() + 1 '.'!= sprintf(hi()'.' + 1)');
ok($hi > 100,                         'hi() > 100');
ok($hd > 100,                         'hd() > 100');
is(dt(5),     'IV',                   'dt(5)');
is(dt(1.23),  'NV',                   'dt(1.23)');
is(dt("abc"), 'PV',                   'dt("abc")');
