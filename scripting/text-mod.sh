#Greps then uses sed to modify a text file.
File=opinion.txt
echo "ethereum is the best" > $File

if grep -iq ethereum "$File"; then
  echo "Modifying opinion"
  sed -i -e 's/ethereum/cardano/g' $File
fi

echo "Finished modification of $File"
exit