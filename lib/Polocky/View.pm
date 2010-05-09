package Polocky::View;
use Polocky::Class;
use Module::Pluggable::Object;

our $VERSION = '0.03';

has 'engine_holder' => (
        is => 'rw',
        lazy_build => 1,
        );


has except_engine => ( is => 'rw');

sub _build_engine_holder {
    my $self = shift;
    my $finder = Module::Pluggable::Object->new( search_path => [ref $self], instantiate => 'new' , except => $self->except_engine );
    my @plugins = $finder->plugins();
    my $holder = {};
    for(@plugins){
        $holder->{$_->name} = $_;
    }
    return $holder;
}

sub engine {
    my $self = shift;
    my $name = shift;
    return $self->engine_holder->{$name};
}

sub render {
    my $self = shift;
    my $type = shift;
    my $args = shift || {};
    my $engine = $self->engine( $type );
    return $engine->render( $args );
}

sub get_extention {
    my $self = shift;
    my $type = shift;
    my $engine = $self->engine( $type )->template_extension;
}


__POLOCKY__;


=head1 NAME

Polocky::View - View Engine for Polocky

=head1 SYNOPSIS

 ./bin/your-helper View View


 my $view = TestApp::View->new();
 my $content 
    = $view->render('JSON',{ vars => { name => 'Polockyです' } });

 my $content 
    = $view->render('TT',{ vars => { name => 'Polockyです' } });


 package TestApp::View;
 use Polocky::Class;
 extends qw/Polocky::View/;
 __POLOCKY__;

 package TestApp::View::TT;
 use Polocky::Class;
 extends qw/Polocky::View::TT/;
 __POLOCKY__;

 package TestApp::View::JSON;
 use Polocky::Class;
 extends qw/Polocky::View::JSON/;
 __POLOCKY__;

=head1 DESCRIPTION

 view engine.

=head1 AUTHOR

polocky

=cut
