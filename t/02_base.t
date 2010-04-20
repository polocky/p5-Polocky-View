use Test::More;
use lib 't/lib';
use TestApp::View::JSON;
use TestApp::View::TT;

is( TestApp::View::TT->new->name ,'TT' );
is( TestApp::View::JSON->new->name ,'JSON' );

done_testing();
