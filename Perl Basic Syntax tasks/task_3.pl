=begin
Task 3. Given is a list of numbers. Develop a subroutine (function) that separates the positive and negative numbers into two hashes and saves their positions from the original list in them.
Requirement: Use a while loop.

Hints:
List of numbers: 5 -2 3 10 8 -12.7 -142.97
The number 10 is located at position 4. This number is positive and should be saved in the hash of positive numbers, preserving its position, i.e., 4.
=cut

use warnings;
use strict;

use constant {
    TRUE  => 1,
    FALSE => 0
};

sub create_hash_for_positive_and_negative_numbers {

    my @array = @_;

    my %positives_hash;
    my %negatives_hash;

    my $position_counter = 1;

    while (@array) {
        my $current_number = shift(@array);
        if ($current_number > 0) {

            $positives_hash{$position_counter} = $current_number;
        }

        elsif ($current_number < 0) {

            $negatives_hash{$position_counter} = $current_number;
        }
        $position_counter += 1;
    }
    return (\%positives_hash, \%negatives_hash);
}

sub test_if_positions_match {

    my $positive_ref = shift(@_);
    my $negative_ref = shift(@_);
    my @array        = @_;

    my $array_size = @array;

    my $test_has_passed = TRUE;

    my $stored_number = 0;

    for (my $i = 0 ; $i < $array_size ; $i++) {

        my $current_number   = $array[$i];
        my $current_position = $i + 1;

        if ($current_number > 0) {

            $stored_number = %$positive_ref{$current_position};

        } elsif ($current_number < 0) {

            $stored_number = %$negative_ref{$current_position};
        }

        if (($current_number != $stored_number) and ($current_number != 0)) {
            print
"Test failed. Number $current_number is not at the proper position $current_position\n";

            $test_has_passed = FALSE;

            last;
        }
    }

    if ($test_has_passed) {
        print "Test has passed successfully\n";
    }
}

my @initial_array = (-14 .. 14);
my ($positive, $negative) =
  create_hash_for_positive_and_negative_numbers(@initial_array);
test_if_positions_match($positive, $negative, @initial_array);

@initial_array = (1 .. 38);
($positive, $negative) =
  create_hash_for_positive_and_negative_numbers(@initial_array);
test_if_positions_match($positive, $negative, @initial_array);

@initial_array = (-88 .. -22);
($positive, $negative) =
  create_hash_for_positive_and_negative_numbers(@initial_array);
test_if_positions_match($positive, $negative, @initial_array);

my @different_array = (15 .. 44);
test_if_positions_match($positive, $negative, @different_array);

my @partially_overlapping_array = (-11 .. 17);
test_if_positions_match($positive, $negative, @partially_overlapping_array);