package TestApp::View::TT;
use Polocky::Class;
extends qw/Polocky::View::TT/;
has pre_process => ( is => 'rw', default => '' );

sub _build_root {
    my $self = shift;
    return 't/template';
}
__POLOCKY__;
