use strict;
use Test::More;
use lib 't/lib';
use TestApp::View;

my $view = TestApp::View->new();
{
    my $content 
        = $view->render('JSON',{
                vars => { name => 'Polockyです' } 
                });

    is( $content , '{"name":"Polocky\u3067\u3059"}' , 'json' );
}
{
    my $content 
        = $view->render('JSON',{
                vars => { name => 'Polocky' } ,
                callback => 'xxx',
                });

    is( $content , 'xxx({"name":"Polocky"})' , 'json' );
}

done_testing();
