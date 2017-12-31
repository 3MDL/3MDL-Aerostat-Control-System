# Firmware Docs #

## Power Test ##
- Simple test that used an Arduino board to monitor the power draw of the RGB+3 camera

## i2c_slave ##
- Arduino sketch of the code that ran on REV A and REV B of the control board
- Includes code that interfaced the Pi with the AVR over I2C

## MAIN ##
- Main code that runs on REV C of the board

## OPTIBOOT FLASH ##
- Avrdude commands and hex file for flashing bootloader onto the ATMega328P without using the Arduino IDE

## PYTHON_PI ##
- Old code from when the project plan included transfering images to the ground using the XBee and Raspberry Pi

## Range Test, RANGE TEST 2, Range Test Desktop ##
- Multiple python scripts and output data from range tests
