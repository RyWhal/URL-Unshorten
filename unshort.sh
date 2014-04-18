#!/bin/bash
#Author: Ryan Whalen
#Take a shortened URL, Follow the 302s to get an unshortened URL
#usage: ./unshort.sh <URL>

if [[ ! -z "$1" ]]; then
  url="$1";
fi;

[ $# -eq 0 ] && { echo "Usage: $0 <shortened url>"; exit 1; }

regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'

if [[ $url =~ $regex ]]
then
  echo -e "\n  Shortened URL:  $1"
  result=`curl -sIL $1 | grep Location | awk '{print $2}'`
  echo "Unshortened URL:  $result"
else
  echo "Invalid URL"
fi
