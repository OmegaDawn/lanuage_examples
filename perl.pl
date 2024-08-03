use strict;
use warnings;
use Time::Piece;

# Constants
use constant PI => 3.141592653589793;

# Function with loops, conditionals, and exception handling
sub complex_function {
    my ($x) = @_;
    die "x must be non-negative" if $x < 0;
    my $result = 0;
    for my $i (1..10) {
        $result += ($x ** $i) / factorial($i);
        last if $result > 100;
    }
    return $result;
}

# Helper function to compute factorial
sub factorial {
    my ($n) = @_;
    return 1 if $n == 0;
    my $fact = 1;
    $fact *= $_ for (1..$n);
    return $fact;
}

# Package definition with a method
package MathOperations;
sub new {
    my ($class, $values) = @_;
    return bless { values => $values }, $class;
}

sub compute_squares {
    my ($self) = @_;
    return map { $_ >= 0 ? $_ * $_ : -1 } @{$self->{values}};
}

# Main execution block
package main;
{
    # Date formatting
    my $date_str = localtime->strftime('%Y-%m-%d');
    print "Hello, VS Code! Today is $date_str.\n";

    # Function call with exception handling
    eval {
        my $result = complex_function(5);
        print "Result of complex_function(5): $result\n";
    };
    if ($@) {
        print "Error: $@\n";
    }

    # Package instantiation and method call
    my $values = MathOperations->new([1, -2, 3, 4]);
    my @squares = $values->compute_squares();
    print "Squares: @squares\n";

    # Array comprehension using mapping and filtering
    my @even_squares = map { $_ * $_ } grep { $_ % 2 == 0 } @{$values->{values}};
    print "Even squares: @even_squares\n";
}
