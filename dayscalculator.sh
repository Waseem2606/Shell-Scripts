#!/bin/bash
#
################################################
#                                              #
# Clculate the number of days between two dates#
# Author: Waseem Saher WRF Youtube             #
# Date: 8/25/2024                              #
# Version:1.0                                  #
#                                              #
# ##############################################

# Prompt the user to enter the first date
echo "Enter the First date (e.g., Month Day, year): "
read date1

# Prompt the user to enter the second date
echo "Enter the second date (e.g., Month Day, year): "
read date2

# Convert the date to timestamps (Unix epoch seconds)

time1=$(date -d "$date1" +%s)
time2=$(date -d "$date2" +%s)

# Calculate the difference in seconds
diff=$(expr $time2 - $time1)

# Clculate the number of seconds in a day
seconds_in_Day=$(expr 24 \* 60 \* 60)

# Calculate the difference in days
days=$(expr $diff / $seconds_in_Day)

echo "The  difference between $date2 and $date1 is $days days."

