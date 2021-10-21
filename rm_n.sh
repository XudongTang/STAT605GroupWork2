function a {
local a=$1;
local b=$2;

echo "Usage: $0 $1 $2" 1>&2;

for entry in "$a"/*
do
	mysize=$(find "$entry" -type f -printf "%s");
	if [ $mysize -gt $b ]
	then
		rm "$entry";
	fi;
done;
}

a $1 $2









