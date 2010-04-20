use inc::Module::Install;
name 'Polocky-View';
all_from 'lib/Polocky/View.pm';

# requires '';

tests 't/*.t';

test_requires 'Test::More';
auto_include;
WriteAll;
