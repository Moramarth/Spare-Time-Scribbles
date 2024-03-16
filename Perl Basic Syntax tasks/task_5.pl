=begin
Task 5: Create a subroutine (function) that performs the conversion of a number from binary numeral system to decimal numeral system and returns the converted number.

Guidelines: Use a well-known algorithm for converting a number from binary numeral system to decimal numeral system.
=cut

use warnings;
use strict;

sub convert_binary_to_decimal_by_positional_notation {

    my $current_binary = $_[0];

    my $decimal_digit = 0;

    my $binary_size = length($current_binary);

    for (my $i = 0 ; $i < $binary_size ; $i++) {

        my $bit = substr($current_binary, $i, 1);

        $decimal_digit += $bit * (2**($binary_size - $i - 1));
    }

    return $decimal_digit;
}
print convert_binary_to_decimal_by_positional_notation('111011101')
  . "\n";    # output -> 477

sub convert_binary_to_decimal_by_doubling {

    my $current_binary = $_[0];

    my $decimal_digit = 0;
    foreach my $bit (split //, $current_binary) {

        $decimal_digit = $decimal_digit * 2 + $bit;
    }
    return $decimal_digit;
}

print convert_binary_to_decimal_by_doubling('111011101') . "\n"; # output -> 477

my @binary_numbers =
  ('1010', '110011', '11110000', '101010101', '000001001001', '0', '1',);

foreach my $test_binary (@binary_numbers) {
    print convert_binary_to_decimal_by_doubling($test_binary) . " = ";
    print convert_binary_to_decimal_by_positional_notation($test_binary) . "\n";
}

# output:
# 10 = 10
# 51 = 51
# 240 = 240
# 341 = 341
# 73 = 73
# 0 = 0
# 1 = 1