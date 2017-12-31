# KiCAD Design Docs #

## Load Switch Modules ##
- Utilize the Fairchild FPF2701MX load switch
- Include current shunt resistor and current set resistor

## Voltage Regulator Modules ##
- Stability issues on REV A
- Stability issues on REV B
- Currently using Recom R-78 Module

## Main Board REV A ##
- Initial Design using Raspberry Pi Zero W and ATMega328P
- Raspberry Pi acts as USB host for RGB+3 camera.

## Main Board REV A ##
- Redesign of REV A that addresses flipped I2C lines

## Main Board REV C ##
- Redesign that ditches the Pi and instead only uses the ATMega328P
- Uses new Recom R-78 buck regulator module

## Main Board REV D ##
- Fixes numerous pinout issues with REV C
- Passive components moved to bottom side to aid layout
- New connectors are used that utilize side entry to compact the system further


