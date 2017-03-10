#!/bin/bash
# test timing script

# c=$(curl -o /dev/null -s -w "%{time_pretransfer}\n" stetson.edu);

a=0;
d=0;
n=0;

curlit() {
	curl -o /dev/null -s -w "%{time_pretransfer}\n" $1
}

for((i=0; i<5; i++))
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

d=$(echo "$a/5" | bc -l;)
echo "curl avg: 0$d";


