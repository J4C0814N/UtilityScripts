#!/bin/bash

while read ip;do
	echo 'IP: '$ip | tee snmpwalk.txt
	echo 'System Processes (1.3.6.1.2.1.25.1.6.0)' | tee snmpwalk.txt
	snmpwalk -c public -v1 $ip 1.3.6.1.2.1.25.1.6.0 | tee snmpwalk.txt
	echo "" >> snmpwalk.txt
	echo 'Running Programs (1.3.6.1.2.1.25.4.2.1.2)' | tee snmpwalk.txt
	snmpwalk -c public -v1 $ip 1.3.6.1.2.1.25.4.2.1.2 | cut -d " " -f4 | tee snmpwalk.txt
	echo "" >> snmpwalk.txt
	echo 'Storage Units (1.3.6.1.2.1.25.2.3.1.4)' | tee snmpwalk.txt
	snmpwalk -c public -v1 $ip 1.3.6.1.2.1.25.2.3.1.4 | cut -d " " -f4 | tee snmpwalk.txt
	echo "" >> snmpwalk.txt
	echo 'Software Names (1.3.6.1.2.1.25.6.3.1.2)' | tee snmpwalk.txt
	snmpwalk -c public -v1 $ip 1.3.6.1.2.1.25.6.3.1.2 | cut -d " " -f4 | tee snmpwalk.txt
	echo "" >> snmpwalk.txt
	echo 'User Accounts (1.3.6.1.4.1.77.1.2.25)' | tee snmpwalk.txt
	snmpwalk -c public -v1 $ip 1.3.6.1.4.1.77.1.2.25 | cut -d " " -f4 | tee snmpwalk.txt
	echo "" >> snmpwalk.txt
	echo 'TCP Local Ports (1.3.6.1.2.1.6.13.1.3)' | tee snmpwalk.txt
	snmpwalk -c public -v1 $ip 1.3.6.1.2.1.6.13.1.3 | cut -d " " -f4 | tee snmpwalk.txt
	echo "" >> snmpwalk.txt
done < snmpips.txt
