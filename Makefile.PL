use inc::Module::Install;
name 'Polocky-View';
all_from 'lib/Polocky/View.pm';

requires (
    'Template' => 0,
    'JSON::Syck' => 0,
    'Encode' => 0,
    'Encode::JavaScript::UCS' => 0,
);

tests 't/*.t';

test_requires(
'Test::Most' => 0,
'Test::LoadAllModules' => 0,
);

auto_include;
WriteAll;
