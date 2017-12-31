import serial
import time
import sys
import gzip
import shutil
import serial
#import RPi.GPIO as GPIO

#GPIO.setmode(GPIO.BCM)
#GPIO.setup(4, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

def chunkstring(string, length):
    return (string[0+i:length+i] for i in range(0, len(string), length))

imageFile = open("break.bmp", 'r')
imageFile = imageFile.read();
imageFileChunk = chunkstring(imageFile, 10)
imageFileChunk = list(imageFileChunk)

#ser = serial.Serial("/dev/serial0", baudrate=115200, timeout=1.0)
ser = serial.Serial("/dev/ttyUSB0", baudrate=115200, timeout=1.0)

i = 0
startProg = time.time()





skip = False

while True: #wait to start
	c = ser.readline()
	if "$" in c:
		break
print("starting")
while i < len(imageFileChunk):
	ser.write(imageFileChunk[i] + "\n")
	print(str(i * 100 / len(imageFileChunk)) + '%')
	print(imageFileChunk[i])
	c = ser.readline()
	c = c.rstrip()
	if c == imageFileChunk[i]: #chunk matches, move along
		i = i + 1
		print("matches")
	else:
		ser.write("-\n")

ser.write("!\n") #end of file

ser.close()
imageFile.close() #close file
runTime = round(time.time() - startProg, 2)
print("Run Time: " + str(runTime))
