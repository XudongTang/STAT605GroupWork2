function mean {
	local col=$1;
	local file=$2;
	touch file_new.csv;
	file1="file_new.csv";

	tail -n +2 "$file" > "$file.tmp" && mv "$file.tmp" "$file1";
	cut -d, -f$col "$file1" > "$file1.tmp" && mv "$file1.tmp" "$file1";

	count=0;
	sum=0;
		
	while read -r line;
	do 
		sum=$(($sum+$line));
		count=$(($count+1));
	done < $file1;
	mean=$(echo "$sum / $count" | bc -l);
	echo $mean;
	rm file_new.csv;
}
mean $1 $2
