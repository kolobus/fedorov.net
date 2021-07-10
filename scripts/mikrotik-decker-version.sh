#!/bin/bash
now=$(date +%m-%d-%Y-%H-%M-%S)
save_path=$(pwd) # nas

echo "Backup for" $1 "at" $now

ssh $1 "/export file=$1-$now.rsc; /system backup save name=$1-$now.backup"
scp $1:/$1-$now.rsc $save_path/
scp $1:/$1-$now.backup $save_path/
ssh $1 "/file remove \"$1-$now.rsc\"; /file remove \"$1-$now.backup\""

echo "Done"
