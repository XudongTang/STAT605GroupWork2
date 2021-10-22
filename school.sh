grep "MADISON SCHOOLS" Property_Tax_Roll.csv | cut -d , -f 7 > file.csv;

count=0;
sum=0;

while read -r line;
do
	sum=$(($sum+$line));
	count=$(($count+1));
done < file.csv;

mean=$(echo "$sum / $count" | bc -l);
echo $mean;
rm file.csv;
