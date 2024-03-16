=begin
Task 6. Given is the function localtime(), built into the Perl language.
Develop a subroutine (function) that returns information about the current time in the format DD-MM-YYYY HH:mm:SS,
where: DD is the current day of the month; MM is the current month; YYYY is the current year; HH is the current hour; mm are the minutes, and SS are the seconds.
For example: 19-01-2024 19:20:06
=cut

use warnings;
use strict;
use POSIX qw(strftime);
use Time::Local;

sub show_formatted_date_time_with_strftime {
    return ((strftime "%F %X", @_));
}

sub show_formatted_date_time_no_strftime {

    my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = @_;

    $min += int($sec / 60);
    $sec %= 60;

    $hour += int($min / 60);
    $min %= 60;

    $mday += int($hour / 24);
    $hour %= 24;

    my $days_in_month = (gmtime(timelocal(0, 0, 0, 1, $mon, 1900 + $year)))[3];

    while ($mday > $days_in_month) {
        $mday -= $days_in_month;
        $mon++;
        if ($mon > 11) {
            $mon = 0;
            $year++;
        }
        $days_in_month = (gmtime(timelocal(0, 0, 0, 1, $mon, 1900 + $year)))[3];
    }

    while ($mon > 11) {
        $mon -= 12;
        $year++;
    }

    return (
        sprintf(
            "%d-%02d-%02d %02d:%02d:%02d",
            1900 + $year,
            $mon + 1, $mday, $hour, $min, $sec
        )
    );
}

my @current_time = localtime();
print show_formatted_date_time_with_strftime(@current_time) . "\n"; # 2024-03-15 11:59:00
print show_formatted_date_time_no_strftime(@current_time) . "\n"; # 2024-03-15 11:59:00

my @date = (6, 2, 1, 1, 0, 123, 2, 0, -1 );
print show_formatted_date_time_with_strftime(@date) . "\n"; # 2023-01-01 01:02:06
print show_formatted_date_time_no_strftime(@date) . "\n"; # 2023-01-01 01:02:06

@date = ( 7, 3, 4, 15, 2, 124, 5, 0, -1 );
print show_formatted_date_time_with_strftime(@date) . "\n"; # 2024-03-15 04:03:07
print show_formatted_date_time_no_strftime(@date) . "\n"; # 2024-03-15 04:03:07

@date = ( 59, 31, 22, 30, 8, 125, 6, 0, -1 );
print show_formatted_date_time_with_strftime(@date) . "\n"; # 2025-09-30 22:31:59
print show_formatted_date_time_no_strftime(@date) . "\n"; # 2025-09-30 22:31:59


@date = ( 44, 25, 22, 28, 1,  123, 3, 0, -1 );
print show_formatted_date_time_with_strftime(@date) . "\n"; # 2023-02-28 22:25:44
print show_formatted_date_time_no_strftime(@date) . "\n"; # 2023-02-28 22:25:44

@date = ( 21, 37, 17, 29, 1,  124, 5, 0, -1 );
print show_formatted_date_time_with_strftime(@date) . "\n"; # 2024-02-29 17:37:21
print show_formatted_date_time_no_strftime(@date) . "\n"; # 2024-02-29 17:37:21

@date = ( 12, 56, 7, 31, 11, 123, 1, 0, -1 );
print show_formatted_date_time_with_strftime(@date) . "\n"; # 2023-12-31 07:56:12
print show_formatted_date_time_no_strftime(@date) . "\n"; # 2024-01-01 07:56:12

@date = (37, 11, 13, 31, 11, 124, 3, 0, -1 );
print show_formatted_date_time_with_strftime(@date) . "\n"; # 2024-12-31 13:11:37
print show_formatted_date_time_no_strftime(@date) . "\n"; # 2025-01-01 13:11:37


@date = ( 59, 59, 23, 1,  0, 123, 1, 0, -1 );
print show_formatted_date_time_with_strftime(@date) . "\n"; # 2023-01-01 23:59:59
print show_formatted_date_time_no_strftime(@date) . "\n"; # 2023-01-01 23:59:59

@date = ( 59, 59, 23, 15, 2, 124, 4, 0, -1 );
print show_formatted_date_time_with_strftime(@date) . "\n"; # 2024-03-15 23:59:59
print show_formatted_date_time_no_strftime(@date) . "\n"; # 2024-03-15 23:59:59

@date = ( 744, 59, 23, 1,  0, 123, 1, 0, -1 );
print show_formatted_date_time_with_strftime(@date) . "\n"; # 2023-01-02 00:11:24
print show_formatted_date_time_no_strftime(@date) . "\n"; # 2023-01-02 00:11:24


@date = ( 42, 943, 23, 1,  0, 123, 1, 0, -1 );
print show_formatted_date_time_with_strftime(@date) . "\n"; # 2023-01-02 14:43:42
print show_formatted_date_time_no_strftime(@date) . "\n"; # 2023-01-02 14:43:42


@date = ( 42, 22, 42, 1,  0, 123, 1, 0, -1 );
print show_formatted_date_time_with_strftime(@date) . "\n"; # 2023-01-02 18:22:42
print show_formatted_date_time_no_strftime(@date) . "\n"; # 2023-01-02 18:22:42


@date = ( 42, 22, 42, 177,  0, 123, 1, 0, -1 );
print show_formatted_date_time_with_strftime(@date) . "\n"; # 2023-06-27 18:22:42
print show_formatted_date_time_no_strftime(@date) . "\n"; # 2023-06-27 18:22:42


@date = ( 42, 22, 42, 77,  0, 123, 1, 0, -1 );
print show_formatted_date_time_with_strftime(@date) . "\n"; # 2023-03-19 18:22:42
print show_formatted_date_time_no_strftime(@date) . "\n"; # 2023-03-16 18:22:42
