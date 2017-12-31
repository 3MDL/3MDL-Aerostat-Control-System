import serial
import time

comPort = "/dev/ttyUSB2"
ser = serial.Serial(comPort, 9600)

while 1:
	while ser.in_waiting == 0:
		pass #do nothing
	else:
		ser.write('c')
		gps = ser.readline();
		print(gps);
