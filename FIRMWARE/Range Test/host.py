import serial
from xbee import XBee
import time

ser = serial.Serial("/dev/ttyUSB3", 9600, timeout = 1)
xbee = XBee(ser)

def transmit(rfData):
	xbee.tx(dest_addr = b'\x00\x00', data = rfData) 

def receive():
	packet = xbee.wait_read_frame()
	rfData = packet["rf_data"]
	return rfData

while(1):
	gpsString = receive()
	print(gpsString)

xbee.halt()
serial_port.close()
