# jp2a --output=/mnt/c/Users/Laptop/Desktop/ascii.txt --color /mnt/c/Users/Laptop/Desktop/download.jpg
# cat /mnt/c/Users/Laptop/Desktop/ascii.txt

# compress and decompress folder
#tar -zcvf [folder.tar.gz] [folder/]
# -z : gzip
# -c : create / compress
# -v : verbose
# -f : file

# tar -C [location] -xzf [folder.tar.gz]
# Example: tar -C ./ -xzf ts_sandbox.tar.gz
# -C :
# -x :

function zip-repo(){
  local input="$1"
	input="${input%/}"
  echo 'COMPRESSING:' $input '==>' $input'.tar.gz'
	tar -zcvf $input'.tar.gz' $input
}

function unzip-repo(){
  local input="$1"
	input="${input%/}"
  echo 'DECOMPRESSING:' $input
	tar -C ./ -zxvf $input
}
