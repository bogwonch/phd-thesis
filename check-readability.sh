#! /bin/bash
for f in chapters/*.tex; do 
	echo -ne "$f\t"
	detex $f | style | awk '/Flesch/ {print $3}'
done | column -t
echo
detex chapters/*.tex | style | awk '/Flesch/ {print "Overall: " $3}'
echo
