=begin
Task 1. Given is a list (array) of numbers. Develop a subroutine (function) to calculate the sum of the positive and the sum of the negative numbers
 from the list and return the result. Requirement: Use a for loop.
=cut

use warnings;
use strict;

sub calculate_sums_of_positive_and_negative_numbers_in_array {
    my @array = @_;

    my $positive_sum = 0;
    my $negative_sum = 0;

    my $array_size = @array;
    for (my $i = 0 ; $i < $array_size ; $i += 1) {
        my $current_number = $array[$i];

        if ($current_number >= 0) {
            $positive_sum += $current_number;
        } else {
            $negative_sum += $current_number;
        }
    }

    return ($positive_sum, $negative_sum);

}

my $custom_sum = \&calculate_sums_of_positive_and_negative_numbers_in_array;
my @output_1   = &$custom_sum(1, 2, 3, 4, 5);
my @output_2   = &$custom_sum(-1, -2, -3, -4, -5);
my @output_3   = &$custom_sum(-3, 5, -7, 10, -2);
my @output_4   = &$custom_sum(147);
my @output_5   = &$custom_sum(-1000000, 500000, 700000, -300000, 200000);
my @output_6   = &$custom_sum(-80 .. 23);
my @output_7   = &$custom_sum();

print "@output_1\n";
print "@output_2\n";
print "@output_3\n";
print "@output_4\n";
print "@output_5\n";
print "@output_6\n";
print "@output_7\n";