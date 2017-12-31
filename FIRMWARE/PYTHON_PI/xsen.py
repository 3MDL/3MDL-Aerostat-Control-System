import serial
from xbee import XBee
import time

ser = serial.Serial("/dev/ttyUSB2", 115200, timeout = 1)
xbee = XBee(ser)


def chunkstring(string, length):
    return (string[0+i:length+i] for i in range(0, len(string), length))

imageFile = open("break.bmp", 'r')
imageFile = imageFile.read();
imageFileChunk = chunkstring(imageFile, 10)
imageFileChunk = list(imageFileChunk)

def transmit(rfData):
	xbee.tx(dest_addr = b'\x00\x00', data = rfData) 
	print(rfData)

def receive():
	packet = xbee.wait_read_frame()
	rfData = packet["rf_data"]
	print(rfData)
	return rfData

while True: #wait to start
	data = receive()
	if data == '$':
		break #exit loop and start main loop

i = 0
while i < len(imageFileChunk):
	transmit(imageFileChunk[i]) #send chunk
	data = receive()
	if data == imageFileChunk[i]: #packets match
		print("matches")
		i = i + 1
	else:
		print("not matching")
		minus = True
		while minus:
			print("minus loop")
			transmit('-') # reply with received data
			data = receive()
			if data == '-':
				print("minus = False")
				minus = False

xbee.tx(dest_addr = b'\x00\x00', data = '!') #end of file

xbee.halt()
serial_port.close()
