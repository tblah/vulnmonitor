#!/bin/sh

# How this works:
# COMMAND is run and it's output is grep-ed for REGEX. If it contains REGEX then grep will return 0 and
#     nothing will happen.
# If grep does not find REGEX it will return 1 and an email will be sent to ADDR containing the output
#     of INFOCOMMAND

# NOTE: to use this you will need a working outbound smtp deamon running. 
#     I recomend opensmtpd as it is easy to use

COMMAND="pkg audit -F"
INFOCOMMAND="pkg audit" # if you run COMMAND for the email it soometimes complains
REGEX="0 problem(s)"
ADDR="you@example.tld"

if ($($COMMAND) | grep -o $REGEX);
  then (echo "")
else  (echo "On " $(hostname) " " $($INFOCOMMAND) | mail -s $(hostname) -F $ADDR) fi
