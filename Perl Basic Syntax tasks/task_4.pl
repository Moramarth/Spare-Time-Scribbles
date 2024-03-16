=begin
Task 4. Given is a list of strings. Develop a subroutine (function) that finds the longest and shortest string from the list and returns them via a reference to a hash.

Hints:
Input to the subroutine:

Reference to a list containing strings;
Reference to a hash to store the found strings.

=cut

use warnings;
use strict;

sub find_longest_and_shortest_string_all_unique {

    my ($hash_storage_ref, $array_ref) = @_;

    my @sorted_array = sort { length($a) <=> length($b) } @$array_ref;

    $hash_storage_ref->{'shortest'} = shift(@sorted_array);
    $hash_storage_ref->{'longest'}  = pop(@sorted_array);
}

sub separate_strings_in_hash_by_length {

    my ($hash_storage_ref, $array_ref) = @_;

    foreach my $current_string (@$array_ref) {

        my $current_length = length($current_string);

        unless (exists($hash_storage_ref->{$current_length})) {
            $hash_storage_ref->{$current_length} = ();
        }

        push(@{ $hash_storage_ref->{$current_length} }, $current_string);
    }
}

my %hash_holder_best_case_scenario;
my @all_unique_length_strings_strings = (
    "b",               "cc",
    "zzz",             "aaaaa",
    "yyyyyy",          "aaaaaaaa",
    "aaaaaaaaaa",      "ffffffffffff",
    "aaaaaaaaaaaaaaa", "oooooooooooooooo",
);

find_longest_and_shortest_string_all_unique(\%hash_holder_best_case_scenario,
    \@all_unique_length_strings_strings);

print 'The shortest string is '
  . $hash_holder_best_case_scenario{'shortest'}
  . ' with length of '
  . length($hash_holder_best_case_scenario{'shortest'}) . "\n";

print 'The longest string is '
  . $hash_holder_best_case_scenario{'longest'}
  . ' with length of '
  . length($hash_holder_best_case_scenario{'longest'}) . "\n";

my %hash_holder_of_arrays_by_word_length;
my @words_with_various_length = (
    "computer", "guitar",    "mountain",  "ocean",
    "unicorn",  "adventure", "chocolate", "dream",
    "rainbow",  "fireworks"
);

separate_strings_in_hash_by_length(\%hash_holder_of_arrays_by_word_length,
    \@words_with_various_length);

my @hash_keys = keys %hash_holder_of_arrays_by_word_length;

foreach my $key (sort(@hash_keys)) {
    my @values = @{ $hash_holder_of_arrays_by_word_length{$key} };
    print "Length: $key, Words: " . join(", ", @values) . "\n";
}

# Output:
# Length: 5, Words: ocean, dream
# Length: 6, Words: guitar
# Length: 7, Words: unicorn, rainbow
# Length: 8, Words: computer, mountain
# Length: 9, Words: adventure, chocolate, fireworks