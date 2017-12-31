import serial
from xbee import XBee
import time




def chunkstring(string, length):
    return (string[0+i:length+i] for i in range(0, len(string), length))

imageFile = open("break.bmp", 'r')
imageFile = imageFile.read();
imageFileChunk = chunkstring(imageFile, 50)
imageFileChunk = list(imageFileChunk)

i = 0

fileNotEnd = True
def transmit(rfData):
	global i
	global start 
	start = time.time()
	if i < len(imageFileChunk):
		xbee.tx(dest_addr = b'\x00\x00', data = imageFileChunk[i]) 
		i = i + 1
		print(imageFileChunk[i])
	else:
		fileNotEnd = False

ser = serial.Serial("/dev/ttyUSB4", 115200)
xbee = XBee(ser, callback = transmit)


start = time.time()
transmit(0)
while fileNotEnd:
	global start
	if time.time() - start > .1:
		i = i - 1
		transmit(0)
	time.sleep(.00001)
print("done")
transmit('!') #end of file

xbee.halt()
ser.close()
