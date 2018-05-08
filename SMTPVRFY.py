#!/usr/bin/python

import socket
import sys
import re

for ip in range(1,255):
	port = 25 
        host = '192.168.1.'+str(ip)
	userlist = 'users.txt'

	print "Establishing connection to",host,":",port
	s = socket.socket()
	recv_data = 0
	try:
		s.connect((host,port))
	except Exception as msg:
		print("%s does not have a mail server: %s" % (host, msg))
		s.close
		continue

	banner = s.recv(512)
	print "Banner:"
	print banner
	file = open(userlist,'r')
	count = 1
	for line in file:
		# close and reopen the connection every 10 requests
		if count % 10 == 0:
			s.shutdown(2) 
			s.close

			s = socket.socket()
			recv_data = 0
			try:
				s.connect((host,port))
			except Exception as msg:
				print("%s does not have a mail server: %s" % (host, msg))
				s.close
				continue

			banner = s.recv(512)
			print banner

		user = line.rstrip('\n')

		msg = "VRFY "
		msg += user
		msg += "\n"
#		print "Sending:",msg

		error = s.sendall(msg)

		if error:
			print "\nError with user",user,":", error
		else:
			try:
				recv_data = s.recv(512)
			except socket.timeout:
				print "Timeout on user",user,"!"
		
		if recv_data:
#			print recv_data
			if re.match("250",recv_data):
				print "Found User:",user
#			if re.match("550",recv_data):
#				print " -> Not Found!"
		else:
			print "\nNo recv_data!"
		count+=1

	file.close()
	s.shutdown(2)
	s.close()
