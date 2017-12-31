import serial
import serial
import time

ser0 = serial.Serial("/dev/ttyUSB0", baudrate=115200, timeout=1.0)
ser1 = serial.Serial("/dev/ttyUSB1", baudrate=115200, timeout=1.0)

ser0.write("this is a line\n")
time.sleep(.01)
c = ser1.readline()
c = c[:-1]

print(c)
print("done")
