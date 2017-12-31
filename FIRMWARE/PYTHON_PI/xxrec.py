import serial
from xbee import XBee
import time

fileNotEnd = True


def receive(packet):
	rfData = packet["rf_data"]
	if '!' in rfData: # end of file
		fileNotEnd = False
		return
	print(rfData)
	fileOut.write(rfData)
	time.sleep(.01)
	transmit(rfData)

ser = serial.Serial("/dev/ttyUSB5", 115200)

xbee = XBee(ser, callback = receive)

fileOut = open("make.bmp", 'w')

def transmit(rfData):
	xbee.tx(dest_addr = b'\x00\x00', data = rfData) 
	print(rfData)
	

while fileNotEnd:
	time.sleep(.00001)

fileOut.close()
xbee.halt()
ser.close()
