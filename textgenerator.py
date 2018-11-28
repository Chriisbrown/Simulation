import sys 
import random

fp = open("positions.txt")
x = int(sys.argv[1]) -1
for i, line in enumerate(fp):
	if i == x:
		a = random.randint(1,1000)
		b = random.randint(1,1000)
		c = random.randint(1,1000)
		d = random.randint(1,1000)
		e = random.randint(1,1000)
		
		with open("run.mac", "w") as text_file:
			text_file.write("/run/useMaximumLogicalCores\n")
			text_file.write("/run/initialize\n")
			text_file.write("/random/setSeeds " + str(a) + " " + str(b) + " " + str(c) + " " + str(d) + " " + str(e) + " \n")
			text_file.write("/gun/position " + str(line[0])+" 10 "+ str(line[2]) +"\n")
			text_file.write("/LXe/rootname/number 1\n")
			text_file.write("/run/beamOn 10\n")

fp.close()
