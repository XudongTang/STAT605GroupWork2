count=0;
for i in {1000..2000}
do
	if [[ $i =~ ^[0-1]+$ ]]
	then 
		count=$(($count + $i));
	fi;
done;
echo $count;
