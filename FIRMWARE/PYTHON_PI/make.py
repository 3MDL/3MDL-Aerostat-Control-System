import serial

comPort = "/dev/ttyUSB1"
imageBuffer = "";
imageFile = open("make.zip", 'w')
ser = serial.Serial(comPort, 115200)

while True:
    chunk = ser.read(100)
    ser.write(chunk)
    while True:
	if ser.in_waiting:
            check = ser.read(ser.in_waiting)
	    if "good" in check:
		print("good")
		imageFile.write(chunk)
		continue
	    if "done" in check:
		break

print("done")
imageFile.close()
