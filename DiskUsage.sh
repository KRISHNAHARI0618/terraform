#!/bin/bash


number=`expr 20 + 30`
echo $number
threashold=90
mailto="root"
hostname=$(hostname)
output=$(df -h | grep -vE 'Filesystem|tmpfs' | awk '{print $5}' | sed 's/%//g')
echo $output
for path in output
do
    if [ $path -ge $threashold ]
    then
        df -h | grep $path% >> temp.sh
    fi
done

value=`cat index.html | wc -l`
echo $value

if [ $value -gt 1 ]
then
    mail -s "$hostname Disk Usage Alert " $mailto < /tmp/temp
fi

rm -rf /tmp/temp

