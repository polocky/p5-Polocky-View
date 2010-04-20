package Polocky::View::TT;
use Polocky::Class;
extends qw(Polocky::View::Base);
use Template;

has 'encoding' => ( is => 'rw', default => 'utf8' );
has 'filters' => ( is => 'rw', lazy_build => 1);
has pre_process => ( is => 'rw', default => 'common.inc' );
has '+template_extension' => (  default => '.tt');

sub render {
    my $self = shift;
    my $args = shift;
    my $vars = $args->{vars} || {};
    my $out = '';
    if ( my $file = $args->{file} ) {
        $self->engine->process( $file , $vars ,\$out ) || die "\n" . $self->engine->error ;
    }
    return $out;
}

sub fix_config {
    my $self = shift;
    my $config = shift || {};
    return $config;
}

sub _build_engine {
    my $self = shift;
    my $config = {
        ENCODING => $self->encoding,
        FILTERS => $self->filters,
        INCLUDE_PATH => ref $self->root eq 'ARRAY' ? $self->root : [ $self->root ],
        PRE_PROCESS => $self->pre_process
    };
    $self->fix_config( $config );
    my $tt = Template->new(%$config);
    return $tt;
}

sub _build_filters {+{}}

__POLOCKY__ ;
