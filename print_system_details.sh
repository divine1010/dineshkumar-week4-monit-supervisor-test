#!/bin/bash
log_file="/home/dinesh/Desktop/week4_test/system_info.log"
print_system_details(){
echo "Date & time: $(date +"%Y-%m-%d %H:%M:%S")"
echo "CPU Usage: $(top -b -n 1 | grep "Cpu(s)" | awk '{print $2}')"
echo "Memory: $(free -m | grep Mem | awk '{print $3 " MB"}')"
echo "Swap Memory: $(free -m | grep Swap | awk '{print $3 " MB"}')"
echo "Disk Usage: $(df -h / | grep /dev/nvme0n1p2 | awk '{print $5 " used"}')"
echo "Top 5 processes consuming CPU:" 
ps -eo pid,%cpu,cmd --sort=-%cpu | head -n 6
echo "Top 5 processes consuming Memory:" 
ps -eo pid,%mem,cmd --sort=-%mem | head -n 6
} >> "$log_file"

while true; do
print_system_details
sleep 5
done
