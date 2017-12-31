import serial
import time

comPort = ""
ser = ""
comGood = False
for i in range(10):
	try:
		comPort = "/dev/ttyUSB" + str(i)
		ser = serial.Serial(comPort, 115200)
		comGood = True
	except:
		comGood = False
	if comGood:
		break	

print(comPort)
ser = serial.Serial(comPort, 115200)

imageFile = open("make.bmp", 'w')

start = time.time()
chunkFile = [];


while True:
	chunk = ser.read(100)
	imageFile.write(chunk)
	'''if(ser.inWaiting() == 20): #if data is waiting
		start = time.time() #update start time
		chunk = ser.readline() #read 20 bytes
		ser.flush()
		#ser.flush()
		if ('-' in chunk): #if - is found in chunk delete last chunk from list
			print('-' + '\n')
			chunkFile.pop() #remove last chunk
		else:
			chunkFile.append(chunk) #add chunk to list
			ser.write(chunk) #reply with chunk
			print(chunk + '\n')

	if(time.time() - start > 10): #breaks after 10 seconds of no data
		break


for j in range(len(chunkFile) - 1):
	imageFile.write(chunkFile[j])
imageFile.close()
print("done")'''
