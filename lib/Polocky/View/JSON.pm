package Polocky::View::JSON;
use Polocky::Class;
use JSON::Syck;
use Encode;
use Encode::JavaScript::UCS;
extends 'Polocky::View::Base';

sub render {
    my $self = shift;
    my $args = shift;
    my $vars = $args->{vars} || {};
    my $out = '';
    local $JSON::Syck::ImplicitUnicode = 1;
    my $json = encode( 'JavaScript-UCS', JSON::Syck::Dump( $vars ) );
    my $callback  = $args->{callback} ;
    if( $callback ) {
        $json = "$callback($json)";
    }
    return $json;
}

__POLOCKY__ ;
