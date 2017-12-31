import serial
from xbee import XBee
import time

gps = serial.Serial("/dev/ttyUSB1", 9600, timeout = 1)
ser = serial.Serial("/dev/ttyUSB0", 9600, timeout = 1)
xbee = XBee(ser)

def transmit(rfData):
	xbee.tx(dest_addr = b'\x00\x00', data = rfData) 

def receive():
	packet = xbee.wait_read_frame()
	rfData = packet["rf_data"]
	return rfData

while(1):
	gpsString = gps.readline()
	if (gpsString[0:6] == "$GPGLL"):
		#print(gpsString)
		#transmit(gpsString)
		start = gpsString.index("$GPGLL")
		#end = gpsString.index("$GPTXT")
		#gpsString = gpsString[start + 7: end]
		start = 0
		end = gpsString.index(",N")
		gpsStringLat = gpsString[start + 7: end]
		start =  gpsString.index(",N")
		end = gpsString.index(",W")
		gpsStringLon = gpsString[start+3: end]
		gpsData = gpsStringLat + ", " + gpsStringLon
		transmit(gpsData)
		print(gpsData)
		time.sleep(1)



#xbee.halt()
#serial_port.close()
