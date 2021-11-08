#!/bin/bash

while true; do
sleep 1
CPU=$(vmstat 1 2| tail -1| awk '{print $15}')
CPU_USAGE=$((100-$CPU))
echo "<center><h2>CPU Usage is: $CPU_USAGE %</h2></center>" > /var/www/html/cpu.html
done
