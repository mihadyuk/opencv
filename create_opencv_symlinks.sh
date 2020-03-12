#!/bin/bash
#enable verbose mode to debug
#set -x

if [ "$(id -u)" != 0 ]; then
    echo "script \"$0\" must be run as root!"
    exit 1
fi

#package name
pkgname=opencv4

#library extension
ext="4.2.0"

#check whether the package exists
pkg-config --exists "$pkgname"
if [ $? != 0 ]; then
    echo "package \"$pkgname\" does not exist"
    exit 1
fi

#get used libs
libs=$(pkg-config --libs-only-l "$pkgname")
#echo -e "libs: \"$libs\" \n"

#get lib dir
libdir=$(pkg-config --libs-only-L "$pkgname" | sed 's/-L//g')
#echo -e "libdir: \"$libdir\" \n"
#dest_symlink_dir="/tmp/test"
dest_symlink_dir="$libdir"

#create missing symlinks for found libraries
for item in ${libs} 
do
    dst=$(echo "$item" | sed 's/-l/lib/g' | sed 's/\>/.so/g')
    src="$dst"".""$ext"
    dst_full_path="$dest_symlink_dir"/"$dst"

    #echo "$item" "$libdir"/"$src" "$dest_symlink_dir"/"$dst"
    if [ ! -L "$dst_full_path" ]; then
        ln -s "$libdir"/"$src" "$dst_full_path" && echo "created symlink \"$dst_full_path\""
    else
        echo "symlink \"$dst_full_path\" already exists!"	    
    fi
done

