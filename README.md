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
