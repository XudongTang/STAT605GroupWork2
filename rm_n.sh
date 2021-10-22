function a {
local a=$1;
local b=$2;


if [[ $# -ne 2 ]];
then
	echo "Usage: $0 <dir> <n>" 1>&2;
	exit 0;
fi;

mysize=$(find "$a" -size +"$b"c -type f);
echo $mysize;

rm $mysize;

}

a $1 $2
