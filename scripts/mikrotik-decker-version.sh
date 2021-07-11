#!/bin/bash
now=$(date +%m-%d-%Y-%H-%M-%S)
save_path=$(pwd) # nas

echo "Backup for" $1 "at" $now

ssh $1 "/export file=$1-$now.rsc; /system backup save name=$1-$now.backup"

scp $1:/$1-$now.rsc $save_path/
scp $1:/$1-$now.backup $save_path/

tar -cvf - $save_path/$1-$now.rsc $save_path/$1-$now.backup | gzip -9 - >  $save_path/mikrotik-$1-$now.tar.gz

rm $save_path/$1-$now.rsc
rm $save_path/$1-$now.backup

ssh $1 "/file remove \"$1-$now.rsc\"; /file remove \"$1-$now.backup\""

echo "Done"
