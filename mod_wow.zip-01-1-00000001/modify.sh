#!/bin/bash

mod_version="6.02"
game_version="1.4.0.41"
echo "mod_version = $mod_version"
echo "game_version = $game_version"

comment_add="/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = ${mod_version}, game_version = ${game_version}*/"
echo "comment_add = ${comment_add}"

comment_delete="BBWOW:"
echo "comment_delete = ${comment_delete}"

array_css=()
array_js=()
array_nut=()

# SAVE css, js and nut files to corresponding arrays
find . -name "*.css" -print0 >tmp
while IFS=  read -r -d $'\0'; do
    array_css+=("$REPLY")
done <tmp
rm -f tmp

find . -name "*.js" -print0 >tmp
while IFS=  read -r -d $'\0'; do
    array_js+=("$REPLY")
done <tmp
rm -f tmp

find . -name "*.nut" -print0 >tmp
while IFS=  read -r -d $'\0'; do
    array_nut+=("$REPLY")
done <tmp
rm -f tmp


# DELETE previous comments from files
for f in ${array_css[@]}
do
	sed -i "/${comment_delete}/d" "$f"
done
for f in ${array_js[@]}
do
	sed -i "/${comment_delete}/d" "$f"
done
for f in ${array_nut[@]}
do
	sed -i "/${comment_delete}/d" "$f"
done
#sed -i "/$STR/d" "$FILE"


# ADD new comments to files
for f in ${array_css[@]}
do
#	echo "File is $f"
	echo ${comment_add} | cat - $f > temp && mv temp $f
done

for f in ${array_js[@]}
do
#	echo "File is $f"
	echo ${comment_add} | cat - $f > temp && mv temp $f
done

for f in ${array_nut[@]}
do
#	echo "File is $f"
	echo ${comment_add} | cat - $f > temp && mv temp $f
done
#echo "/*This file is part of datchannin bbWoW mod, mod_version = ${mod_version}, game_version = ${game_version}*/" | cat - $f > temp && mv temp $f