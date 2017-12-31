import smbus
import time
bus = smbus.SMBus(1)

class avrExp:
	def readAlt(self):
		bus.write_byte(address, 1)
		alt = self.receive()
		return alt

	def readADC(self, adcNum):
		bus.write_byte(address, 101)
		bus.write_byte(address, adcNum)
		adc = self.receive()
		return adc

	def setGPIO(self, gpio, value):
		bus.write_byte(address, 201)
		bus.write_byte(address, gpio)
		bus.write_byte(address, value)

	def receive(self):
		c1 = bus.read_byte(address)
		c2 = bus.read_byte(address)
		result = c1 * 255 + c2
		return result
	def triggerCam(self):
		self.setGPIO(8, 0)
		time.sleep(1)
		self.setGPIO(8, 1)

	def readUART(self):
		inBuf = ""
		while True:
			bus.write_byte(address, 2)
			c = bus.read_byte(address)
			if (c != 0):
				inBuf = inBuf + str(unichr(c))
			else:
				break
		return inBuf

	def writeUART(self, outBuf):
		for c in outBuf:
			bus.write_byte(address, 102)
			bus.write_byte(address, ord(c))		

avr = avrExp()
address = 0x60

while True:
	avr.triggerCam()
        time.sleep(1)
