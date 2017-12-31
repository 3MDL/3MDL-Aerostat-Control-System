import serial
import time
comPort = ""
ser = ""
'''comGood = False
for i in range(10):
	try:
		comPort = "/dev/ttyUSB" + str(i)
		ser = serial.Serial(comPort, 115200)
		comGood = True
	except:
		comGood = False
	if comGood:
		break	

print(comPort)'''

#ser = serial.Serial(comPort, baudrate=115200, timeout=1.0)
ser = serial.Serial("/dev/ttyUSB1", baudrate=115200, timeout=1.0)
fileOut = open("make.bmp", 'w')

fileBuf = [];

ser.write("$\n") #start

while True:
	print("serial")
	c = ser.readline()
	c = c.rstrip()
	print(len(c))
	if (c != ""):
		if c == '-': #chunk doesn't match
			fileBuf.pop()
			pass
		elif c == '!': #end of file
			break
		else: #100 byte chunk is received
			ser.write(c + '\n')
			fileBuf.append(c)

ser.close()
for j in range(len(fileBuf) - 1):
	fileOut.write(fileBuf[j])
fileOut.close()
print("done")
