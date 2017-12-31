import serial

pwr = serial.Serial("/dev/ttyACM0", 115200, timeout = 1)

while(1):
	print(pwr.readline());
