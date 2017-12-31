import serial
from xbee import XBee
import time

def newData(data):
	print data["rf_data"]

ser = serial.Serial("/dev/ttyUSB0", 115200)
xbee = XBee(ser, callback = newData)


def chunkstring(string, length):
    return (string[0+i:length+i] for i in range(0, len(string), length))

imageFile = open("break.bmp", 'r')
imageFile = imageFile.read();
imageFileChunk = chunkstring(imageFile, 100)
imageFileChunk = list(imageFileChunk)

def transmit(rfData):
	xbee.tx(dest_addr = b'\x00\x00', data = rfData) 
	print(rfData)

transmit("test") #send chunk

while(True):
	time.sleep(.001);

xbee.halt()
ser.close()
