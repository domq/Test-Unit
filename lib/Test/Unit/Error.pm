package Test::Unit::Error;
use strict;
use base qw(Test::Unit::Exception);

# This is a hack to effectively rebless an unknown user exception as a
# Test::Unit::Error, which is nice because all Test::Unit::Exceptions
# have nice stringify() methods.
sub make_new_from_error {
    my $self = shift;
    my $ex = shift;
    my $object = shift;
    $self->new(%$ex, -object => $object);
}

1;
__END__

=head1 NAME

Test::Unit::Error - unit testing framework exception class

=head1 SYNOPSIS

This class is not intended to be used directly 

=head1 DESCRIPTION

This class is used by the framework to communicate the occurrence of
run-time errors (that is, syntax errors and the like, not failed
tests, as the latter are classified as failures) generated by user
code.  When such an error occurs, an instance of this class will be
thrown and caught internally in the framework.

=head1 AUTHOR

Copyright (c) 2000 Christian Lemburg, E<gt>lemburg@acm.orgE<gt>.

All rights reserved. This program is free software; you can
redistribute it and/or modify it under the same terms as Perl itself.

Thanks go to the other PerlUnit framework people: 
Brian Ewins, Cayte Lindner, J.E. Fritz, Zhon Johansen.

=head1 SEE ALSO

=over 4

=item *

L<Test::Unit::Exception>

=item *

L<Test::Unit::Assert>

=back

=cut