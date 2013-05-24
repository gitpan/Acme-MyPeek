use strict;
use warnings;
use 5.008;

use Module::Build;

Module::Build->new(
  module_name        => 'Acme::MyPeek',
  license            => 'perl',
  configure_requires => { 'Module::Build' => 0 },
  requires           => {  },
  dist_abstract      => 'Peek into the internal number representation',
)->create_build_script;
