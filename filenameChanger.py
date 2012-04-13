#!/usr/bin/python
import os

#real simple script to chop the start of a file off
for filename in os.listdir("."):
	if filename.startswith("************"): #enter the bit you want removed here
		os.rename(filename, filename[15:]) #the 15 is the amount of character in the previous statment

