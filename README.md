# UtilityScripts

A collection of scripts that I have found useful, and maybe someone else will too.

## SMTPVRFY.py
A simple python script that will loop through a network range and attempt to connect to SMTP on port 25. If connected it will attempt to enumerate users using the VRFY command and a provided list of accounts to test from a users.txt file

Usage:
1. Download the script
2. Update the ip range and user list txt file location if necessary
3. Add execute permissions: `chmod 755 SMTPVRFY.py`
3. Run the script `./SMTPVRFY.py`

Improvements to be made:
* Logging / output to file
* Add args to the script so that the ip range, file and port can be passed as args instead of hardcoded.

## snmpwalk.sh
A simple bash script combining `snmpwalk` commands with common / interesting SNMP Management Information Base (MIB) values to find info from a list of known SNMP servers

Usage:
1. Download the script
2. Run `OneSixtyOne` or other SNMP enum tool to get a list of SNMP server IPs, saved to file snmpips.txt
For example: 
* List all IPs on the network:
`for ip in $(seq 1 254);do echo 192.168.0.$ip;done > ips`
* Use OneSixtyOne to find SMNP servers and list the IP addresses: 
`onesixtyone -c community -i ips | cut -d" " -f1 >> snmpips.txt`

3. Add execute permissions: `chmod 755 snmpwalk.sh`
3. Run the script `./snmpwalk.sh`
