import serial
from xbee import XBee
import time

ser = serial.Serial("/dev/ttyUSB0", 115200, timeout = 1)
xbee = XBee(ser)

fileOut = open("make.bmp", 'w')

fileBuf = []

def transmit(rfData):
	xbee.tx(dest_addr = b'\x00\x00', data = rfData) 
	print(rfData)

def receive():
	packet = xbee.wait_read_frame()
	rfData = packet["rf_data"]
	print(rfData)
	return rfData


transmit('$') #start transmission

popFlag = False

while True:
	data = receive()
	if data == '-': #received packet doesn't match
		print('-')
		if popFlag:
			fileBuf.pop()
			popFlag = False
		transmit('-') # reply with '-'
	if data == '!': #end of file
		print('!')
		break #exit loop
	else:
		print('#')
		fileBuf.append(data)
		popFlag = True
		transmit(data) # reply with received data

for j in range(len(fileBuf) - 1):
	fileOut.write(fileBuf[j])
fileOut.close()

xbee.halt()
serial_port.close()
