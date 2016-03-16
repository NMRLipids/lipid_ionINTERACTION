seb=`grep -c gcq $1`
if [ $seb == 1 ]
then
  echo "File Found: $seb"
else
  echo "File Not Found"
  exit
fi
