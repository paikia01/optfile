#!/bin/sh
#
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export PATH

# Import ardnspod functions
. /etc/storage/ardnspod

# Combine your token ID and token together as follows
arToken="160232,7d48745f915eccd2ead83326d09d39b1"

# Place each domain you want to check as follows
# you can have multiple arDdnsCheck blocks
arDdnsCheck "yydata.cf" "www"
