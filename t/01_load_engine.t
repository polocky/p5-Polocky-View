use Test::Most;
use lib 't/lib';
use TestApp::View;

my $view = TestApp::View->new();
{
    my $engine = $view->engine('TT');
    is( ref $engine , 'TestApp::View::TT' ,'create engine OK');
}
{
    my $engine = $view->engine('JSON');
    is( ref $engine , 'TestApp::View::JSON' ,'create engine OK');
}

done_testing();

