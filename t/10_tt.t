use strict;
use Test::More;
use lib 't/lib';
use TestApp::View;

my $view = TestApp::View->new({ });
my $content 
    = $view->render('TT',{
        file => 'tt.tt', 
        vars => { name => 'Polocky' } 
    });
is( $content , "name:Polocky\n" , 'tt' );

done_testing();
