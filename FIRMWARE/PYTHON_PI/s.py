import serial
import time
import sys
import gzip
import shutil
import serial
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setup(4, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

def chunkstring(string, length):
    return (string[0+i:length+i] for i in range(0, len(string), length))

with open('break.bmp', 'rb') as f_in, gzip.open('break.zip', 'wb') as f_out:
    shutil.copyfileobj(f_in, f_out)

imageFile = open("break.bmp", 'r')

imageFileChunk = imageFile.read();
imageFileChunk = chunkstring(imageFileChunk, 10); #break into chunk of 20 characters
imageFileChunk = list(imageFileChunk)
ser = serial.Serial("/dev/serial0", baudrate=115200, timeout=3.0)
i = 0
start = time.time()


for c in imageFileChunk:
	if(GPIO.input(4) == 0): #if CTS is low
		ser.write(c + '\n') #write chunk to serial port
		print(c + '\n')
	#while (ser.inWaiting() == 0): #wait for serial data
	#	pass
	#if (imageFileChunk[i] in ser.read(10)): #read 20 bytes if they match continue loop
	#	i = i + 1
	#	print('+')
	#else:
	#	ser.write('-------------------\n')
	#	print('-')
	#ser.flush()


ser.close()
imageFile.close() #close file
runTime = round(time.time() - start, 2)
print("Run Time: " + str(runTime))
