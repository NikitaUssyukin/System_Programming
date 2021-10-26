echo "Filename:"
read filename
echo "Starting line:"

read starting

echo "Ending line:"
read ending

if [ -f $filename ]
    then 
    sed -n $starting,$ending\p $filename | cat > newline
    cat newline
    else 
    echo "File doesn't exist"
fi