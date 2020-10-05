#!/bin/ksh

# Append the command line text to informix log file for the current instance.

if [[ -z "$INFORMIXSERVER" ]]; then
    echo "No environment set"
    exit
fi

if (( $# == 1 )); then
    echo "No comment supplied"
    echo "usage: $0 'note to be added to informix log file'"
    exit
fi

if [[ "$1" == "-help" || "$1" == "-?" ]]; then
    echo "usage: $0 'note to be added to informix log file'"
    exit
fi

MSGFILE=$(onstat -c | awk '/^MSGPATH/ { print $2 }')
MSGTIME=$(date +%k:%M:%S)

if [[ -w "${MSGFILE}" ]]
  then echo "$MSGTIME  $*" >> $MSGFILE
  else echo "No write permission"
fi

