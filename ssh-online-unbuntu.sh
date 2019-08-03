#!/bin/bash
data=( `ps aux | grep -i dropbear | awk '{print $2}'`);

for PID in "${data[@]}"
do
NUM=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | wc -l`;
USER=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk '{print $10}'`;
IP="xxxxxxxxxx";
if [ $NUM -eq 1 ]; then
echo "$PID - $USER - $IP";
fi
done
