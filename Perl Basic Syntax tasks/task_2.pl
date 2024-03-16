=begin
Task 2. Given is a list of numbers. Develop a subroutine (function) that sorts the positive and negative numbers into two new lists and returns them.
The list of positive numbers should be sorted in ascending order, and the list of negative numbers should be sorted in descending order.
Requirement: Use a foreach loop. 
=cut

use warnings;
use strict;

sub separate_to_positive_and_negative_numbers_arrays {

    my @array = @_;

    my @positives_array = ();
    my @negatives_array = ();

    foreach my $current_number (@array) {

        if ($current_number > 0) {

            push(@positives_array, $current_number);
        }

        elsif ($current_number < 0) {

            push(@negatives_array, $current_number);
        }
    }

    my @sorted_positives_array = sort { $a <=> $b } @positives_array;
    my @sorted_negatives_array = sort { $b <=> $a } @negatives_array;

    return (\@sorted_positives_array, \@sorted_negatives_array);
}

my $separate_and_sort = \&separate_to_positive_and_negative_numbers_arrays;

my ($positives, $negatives) = &$separate_and_sort(-14 .. 14);

print "@$positives\n";
print "@$negatives\n";

($positives, $negatives) =
  &$separate_and_sort(732, 155, 891, 422, 667, 57, 999, 308, 843, 216);
print "@$positives\n";
print "@$negatives\n";

($positives, $negatives) =
  &$separate_and_sort(-732, -155, -891, -422, -667, -57, -999, -308, -843,
    -216);
print "@$positives\n";
print "@$negatives\n";

($positives, $negatives) = &$separate_and_sort(0);
print "@$positives\n";
print "@$negatives\n";