#You can do something like

git ls-tree -r HEAD
#To see the blobs and the files.
#If you don't want to manually look which are the same blobs:

git ls-tree -r HEAD | sort -t ' ' -k 3 | perl -ne '$1 && / $1\t/ && print "\e[0;31m" ; / ([0-9a-f]{40})\t/; print "$_\e[0m"'
