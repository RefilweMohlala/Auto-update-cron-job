#!/bin/bash

email="refilwemohlalaa@gmail.com"
disk_space=$(df -h / | awk 'NR==2 { print $5}' | sed 's/%//')
log_file="/var/log/system_update.log"

if [ "$disk_space" -gt 80 ]; then
	echo "$(date): Low disk storage detected. Update skipped." | tee -a $log_file
	echo "Low disk space detected. update skipped." | mail -s "EC2 Update failed: Low Disk Space" $email
	exit 1
fi

echo "$(date): Running system updates..." | tee -a $log_file
sudo apt update && sudo apt upgrade -y >> $log_file 2>&1

if [ $? -eq 0 ]; then 
	echo "$(date): System update successful." | tee -a $log_file
	echo -e "Good Morning, \n\nThis is confirmation that your EC2 instance has been updated. Enjoy your week and happy coding!" | mail -s "EC2 Update Confirmation" $email
else
	echo "$(date): System update failed!" | tee -a $log_file
	echo "EC2 system update failed!" | mail -s "EC2 Update Failed" $email
fi
