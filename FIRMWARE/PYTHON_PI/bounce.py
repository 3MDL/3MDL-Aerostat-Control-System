import serial
from xbee import XBee
import time
from timeout import timeout

serA = serial.Serial("/dev/ttyUSB2", 115200)
serB = serial.Serial("/dev/ttyUSB0", 115200)

xbeeA = XBee(serA)
xbeeB = XBee(serB)

def transmitA(rfData):
	xbeeA.tx(dest_addr = b'\x00\x00', data = rfData) 
	print(rfData)

def receiveA():
	packet = xbeeA.wait_read_frame()
	rfData = packet["rf_data"]
	print(rfData)
	return rfData	

def transmitB(rfData):
	xbeeB.tx(dest_addr = b'\x00\x00', data = rfData) 
	print(rfData)

@timeout(2)
def receiveB():
	packet = xbeeB.wait_read_frame()
	rfData = packet["rf_data"]
	print(rfData)
	return rfData	
i = 0
while True:
	i = i + 1
	transmitA(str(i))
	time.sleep(.1)
	if serB.inWaiting():
		data = receiveB()
	

xbeeA.halt()
xbeeB.halt()
serA.close()
serB.close() 
