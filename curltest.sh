#!/bin/bash
# test timing script

a=0;
d=0;
n=0;
s=5;

curlit() {
	curl -o /dev/null -s -w "%{time_pretransfer}\n" $1
}

curlfirst=$(curlit $1)
echo "first one: $curlfirst";

for((i=0; i<$s; i++))
	do
	curlres=$(curlit $1)
	echo "curl once: $curlres";
	a=$(echo "$curlres+$a" | bc -l);
	# echo "curl aaa: $a";
	# ((n++));
	# d=$(echo "($d+$curlres)/$n" | bc -l;)
	# let d=$a+1
	# echo "curl avg: 0$d";
	sleep 0.25
done

d=$(echo "$a/$s" | bc -l;)
echo "curl avg: $d";
