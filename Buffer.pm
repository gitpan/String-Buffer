package String::Buffer;

# Copyright 2001 by Steve McKay. All rights reserved.
# This library is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

use strict;
use vars qw( @ISA $VERSION );
$VERSION = 0.04;

sub new
{
	my ( $proto, $str ) = @_;
	my $class = ref( $proto ) || $proto;
	my $self = {
		buffer => undef,
	};
	$self->{buffer} = $str if $str;
	bless( $self, $class );
	return $self;
}

sub write
{
	my( $self, @val ) = @_;
	$self->{buffer} .= join( '', @val );
	return undef;
}

sub writeln
{
	my( $self, @val ) = @_;
	return $self->write( @val, "\n" );
}

sub read
{
	my( $self ) = @_;
	return $self->{buffer};
}

sub flush
{
	my( $self ) = @_;
	my $flushed = $self->read();
	$self->{buffer} = undef;
	return $flushed;
}

1;

__END__

=head1 NAME

String::Buffer - simple string buffer class.

=head1 SYNOPSIS

  use String::Buffer;
  my $buf = new String::Buffer();

  $buf->write('Foo');
  print $out->read();
  $out->flush();
  $buf->write('Bar');
  print $out->flush();


=head1 DESCRIPTION

C<String::Buffer> provides a basic string buffer class.

=head1 Functions

=over 10

=item new()

Create a new buffer object. Accepts a string as an argument.

=item write()

Add some text to the buffer.

=item writeln()

Add some text to the buffer, with a new line at the end.

=item read()

Return the here-to-forth buffered content.

=item flush()

Empty out the output buffer.

=back

=head1 CHANGES

=head1 AUTHOR

Steve McKay, steve@colgreen.com

=head1 COPYRIGHT

Copyright 2001 by Steve McKay. All rights reserved.

This library is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

perl(1).

=cut

