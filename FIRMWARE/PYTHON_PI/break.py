import serial
import time
import sys
import gzip
import shutil


def chunkstring(string, length):
    return (string[0+i:length+i] for i in range(0, len(string), length))

with open('break.bmp', 'rb') as f_in, gzip.open('break.zip', 'wb') as f_out:
    shutil.copyfileobj(f_in, f_out)

imageFile = open("break.zip", 'r') #open file of name second parameter

imageFile = imageFile.read();
imageFileChunk = chunkstring(imageFile, 20); #break into chunk of 20 characters
imageFileChunk = list(imageFileChunk)
comPort = "/dev/ttyUSB0"
ser = serial.Serial(comPort, 115200)
i = 0
while i < len(imageFileChunk):
	ser.write(imageFileChunk[i]) #write chunk to serial port
	print(imageFileChunk[i] + "\n") #print chunk

	while ser.in_waiting == 0:
		pass #do nothing
	else:
		print(i)
		check = ser.read(19)
		print(check)
		if check in imageFile[i]:
			ser.write("good")
			print("good")
			i = i + 1
		else:
			ser.write("bad")
			print("bad")
		continue

time.sleep(2) #wait 2s
ser.write("done")
print("done")
imageFile.close() #close file
