function mean {
	if [[ $# -lt 1 ]];
	then 
		echo "usage: $0 <column> [file.csv]" 1>&2;
		exit 0;
	fi;

	if [[ $# -eq 1 ]];
	then
		default_file=/dev/stdin;
	else
		default_file=$2;
	fi;

	local col=$1;
	local file=$default_file;


	touch file_new.csv;
	file1="file_new.csv";
	
	
	tail -n +2 "$file" | cut -d , -f $col > $file1;

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
