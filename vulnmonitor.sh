#!/bin/sh

# How this works:
# COMMAND is run and it's output is grep-ed for REGEX. If it contains REGEX then grep will return 0 and
#     nothing will happen.
# If grep does not find REGEX it will return 1 and an email will be sent to ADDR

# NOTE: to use this you will need a working outbound smtp deamon running. I recomend opensmtpd as it is easy to use

COMMAND="pkg audit -F"
REGEX="0 problem(s)"
ADDR="you@example.tld"

if ($($COMMAND) | grep -o $REGEX);
  then (echo "")
else  (echo "On " $(hostname) " " $(COMMAND) | mail -s $(hostname) -F $ADDR) fi
