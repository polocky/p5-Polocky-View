package Polocky::View::Base;
use Polocky::Class;
use Polocky::Utils;

has 'name' =>  ( is => 'rw', lazy_build => 1);
has 'engine' => ( is => 'rw', lazy_build => 1);
has 'root' => ( is => 'rw', lazy_build => 1 );
has 'template_extension' => ( is => 'rw', default => '.templ');

sub _build_root {
    my $self = shift;
    return [
        Polocky::Utils::structure->template_dir( Polocky::Utils::app_sub_name ),
        Polocky::Utils::structure->template_dir( 'share' )->subdir( Polocky::Utils::app_sub_name ),
        Polocky::Utils::structure->template_dir( 'share' )->subdir( 'common' ),
    ]
}

sub _build_engine {
        Polocky::Exception::AbstractMethod->throw(
                message => 'Sub class must overried this method' );
}

sub _build_name {
        my $self = shift;
        my @a = split('::', ref $self );
        return $a[-1];
}

1;
