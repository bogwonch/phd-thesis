#! /bin/bash
detex="detex -e lstlisting,figure,table,tabular,quote,policyrule"

total_word_count=$($detex chapters/*.tex | wc -w)
for f in chapters/*.tex; do 
	text=$($detex $f)
	words=$(wc -w <<<"$text")
	echo -ne "$f\t"
	fi=$((style <<< "$text") | awk '/Flesch/ {print $3}' | awk -F/ '{print $1}')
	echo -ne "$fi\t"
	python -c $"
weight=($fi - 60)*($words.0 / $total_word_count)
if weight >= 0:
	print('\033[32m%0.2f\033[0m' % weight)
else:
	print('\033[31m%0.2f\033[0m' % (0-weight))
"
done | column -t
echo
$detex chapters/*.tex | style | awk '/Flesch/ {print "Overall: " $3}'
echo
