package Polocky::Setup::Helper::View;
use strict;
use warnings;
use base 'Polocky::Setup::Helper';
sub generate_path_option_names { qw/ target / }
sub is_append_files { 1 } # append type helper

1;

__DATA__

--- 
file: lib/____var-module_path-var____/View.pm
template: |
  package [% module %]::View;
  use Polocky::Class;
  extends 'Polocky::View';
  
  __POLOCKY__;
---
file: lib/____var-module_path-var____/View/TT.pm
template: |
  package [% module %]::View::TT;
  use Polocky::Class;
  extends 'Polocky::View::TT';
  
  __POLOCKY__;
---
file: lib/____var-module_path-var____/View/JSON.pm
template: |
  package [% module %]::View::JSON;
  use Polocky::Class;
  extends 'Polocky::View::JSON';
  
  __POLOCKY__;
