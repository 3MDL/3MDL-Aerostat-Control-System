EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:recom_r78
LIBS:LM431
LIBS:Aerostat REV C-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title "Aerostat Control Board"
Date "2017-09-07"
Rev "C"
Comp "University of Toledo 3MDL"
Comment1 "*NOTE: uMCA refers to RGB+3 model"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 9250 3950 2    47   Input ~ 0
AVR_RST
$Comp
L R R3
U 1 1 5953F42E
P 9400 3850
F 0 "R3" V 9480 3850 50  0000 C CNN
F 1 "10K" V 9400 3850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 9330 3850 50  0001 C CNN
F 3 "" H 9400 3850 50  0000 C CNN
	1    9400 3850
	0    1    -1   0   
$EndComp
$Comp
L C C6
U 1 1 5953F449
P 6700 2550
F 0 "C6" H 6725 2650 50  0000 L CNN
F 1 "1uF" H 6725 2450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6738 2400 50  0001 C CNN
F 3 "" H 6700 2550 50  0000 C CNN
	1    6700 2550
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 5953F450
P 6700 2800
F 0 "#PWR01" H 6700 2550 50  0001 C CNN
F 1 "GND" H 6700 2650 50  0000 C CNN
F 2 "" H 6700 2800 50  0000 C CNN
F 3 "" H 6700 2800 50  0000 C CNN
	1    6700 2800
	-1   0    0    -1  
$EndComp
$Comp
L FT230XQ-R U2
U 1 1 5953FE3D
P 4450 2500
F 0 "U2" H 4150 2350 60  0000 C CNN
F 1 "FT230XQ-R" H 4450 1150 60  0000 C CNN
F 2 "Housings_DFN_QFN:QFN-16-1EP_4x4mm_Pitch0.65mm" H 4450 2500 60  0001 C CNN
F 3 "" H 4450 2500 60  0001 C CNN
	1    4450 2500
	1    0    0    -1  
$EndComp
Text GLabel 5150 2900 2    47   Input ~ 0
RX_FTDI
Text GLabel 5150 2800 2    47   Output ~ 0
TX_FTDI
$Comp
L USB_OTG-RESCUE-Aerostat_REV_A P1
U 1 1 5953FE48
P 3050 3000
F 0 "P1" H 3375 2875 50  0000 C CNN
F 1 "USB_OTG" H 3050 3200 50  0000 C CNN
F 2 "MOD:UX60-MB-5ST" V 3000 2900 50  0001 C CNN
F 3 "" V 3000 2900 50  0000 C CNN
	1    3050 3000
	0    -1   1    0   
$EndComp
$Comp
L R R1
U 1 1 5953FE4F
P 3600 2900
F 0 "R1" V 3450 2900 50  0000 C CNN
F 1 "22" V 3600 2900 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 3530 2900 50  0001 C CNN
F 3 "" H 3600 2900 50  0000 C CNN
	1    3600 2900
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 5953FE56
P 3600 3000
F 0 "R2" V 3700 3000 50  0000 C CNN
F 1 "22" V 3600 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 3530 3000 50  0001 C CNN
F 3 "" H 3600 3000 50  0000 C CNN
	1    3600 3000
	0    1    1    0   
$EndComp
NoConn ~ 3350 3100
$Comp
L GND #PWR02
U 1 1 5953FE72
P 2950 3500
F 0 "#PWR02" H 2950 3250 50  0001 C CNN
F 1 "GND" H 2950 3350 50  0000 C CNN
F 2 "" H 2950 3500 50  0000 C CNN
F 3 "" H 2950 3500 50  0000 C CNN
	1    2950 3500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5953FE78
P 3350 3300
F 0 "#PWR03" H 3350 3050 50  0001 C CNN
F 1 "GND" H 3350 3150 50  0000 C CNN
F 2 "" H 3350 3300 50  0000 C CNN
F 3 "" H 3350 3300 50  0000 C CNN
	1    3350 3300
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 5953FE80
P 3650 3500
F 0 "C1" H 3675 3600 50  0000 L CNN
F 1 "1uF" H 3675 3400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3688 3350 50  0001 C CNN
F 3 "" H 3650 3500 50  0000 C CNN
	1    3650 3500
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5953FE8B
P 3850 3800
F 0 "#PWR04" H 3850 3550 50  0001 C CNN
F 1 "GND" H 3850 3650 50  0000 C CNN
F 2 "" H 3850 3800 50  0000 C CNN
F 3 "" H 3850 3800 50  0000 C CNN
	1    3850 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 5953FE93
P 3650 3750
F 0 "#PWR05" H 3650 3500 50  0001 C CNN
F 1 "GND" H 3650 3600 50  0000 C CNN
F 2 "" H 3650 3750 50  0000 C CNN
F 3 "" H 3650 3750 50  0000 C CNN
	1    3650 3750
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 5953FE9A
P 5300 3050
F 0 "C3" V 5350 2900 50  0000 L CNN
F 1 "0.1uF" V 5350 3100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5338 2900 50  0001 C CNN
F 3 "" H 5300 3050 50  0000 C CNN
	1    5300 3050
	0    1    1    0   
$EndComp
NoConn ~ 5050 3150
NoConn ~ 5050 3300
NoConn ~ 5050 3400
NoConn ~ 5050 3500
NoConn ~ 5050 3600
Text GLabel 5550 3050 2    60   Output ~ 0
AVR_RST
$Comp
L CONN_02X03 P2
U 1 1 595402A1
P 3350 5250
F 0 "P2" H 3350 5450 50  0000 C CNN
F 1 "ICSP" H 3350 5050 50  0000 C CNN
F 2 "MOD:2.54 ICSP" H 3350 4050 50  0001 C CNN
F 3 "" H 3350 4050 50  0000 C CNN
	1    3350 5250
	1    0    0    -1  
$EndComp
Text GLabel 3000 5150 0    47   BiDi ~ 0
MISO
Text GLabel 3000 5250 0    47   Output ~ 0
SCK
Text GLabel 3000 5350 0    47   Output ~ 0
AVR_RST
Text GLabel 3700 5250 2    47   BiDi ~ 0
MOSI
$Comp
L +3.3V #PWR06
U 1 1 595402AC
P 3600 5050
F 0 "#PWR06" H 3600 4900 50  0001 C CNN
F 1 "+3.3V" H 3600 5190 50  0000 C CNN
F 2 "" H 3600 5050 50  0000 C CNN
F 3 "" H 3600 5050 50  0000 C CNN
	1    3600 5050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 595402B2
P 3600 5450
F 0 "#PWR07" H 3600 5200 50  0001 C CNN
F 1 "GND" H 3600 5300 50  0000 C CNN
F 2 "" H 3600 5450 50  0000 C CNN
F 3 "" H 3600 5450 50  0000 C CNN
	1    3600 5450
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5954AA07
P 3850 2550
F 0 "C2" H 3875 2650 50  0000 L CNN
F 1 "1uF" H 3875 2450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3888 2400 50  0001 C CNN
F 3 "" H 3850 2550 50  0000 C CNN
	1    3850 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 5954AA6E
P 3850 2300
F 0 "#PWR08" H 3850 2050 50  0001 C CNN
F 1 "GND" H 3850 2150 50  0000 C CNN
F 2 "" H 3850 2300 50  0000 C CNN
F 3 "" H 3850 2300 50  0000 C CNN
	1    3850 2300
	-1   0    0    1   
$EndComp
Text Label 3850 3000 2    47   ~ 0
D2+
Text Label 3850 2900 2    47   ~ 0
D2-
Text Label 3450 2900 2    47   ~ 0
D1-
Text Label 3450 3000 2    47   ~ 0
D1+
Wire Wire Line
	6700 2800 6700 2700
Wire Wire Line
	5150 2800 5050 2800
Wire Wire Line
	5050 2900 5150 2900
Wire Wire Line
	3350 2900 3450 2900
Wire Wire Line
	3450 3000 3350 3000
Wire Wire Line
	3750 2900 3850 2900
Wire Wire Line
	3850 3000 3750 3000
Wire Wire Line
	3350 2800 3850 2800
Wire Wire Line
	3350 2800 3350 2700
Wire Wire Line
	3350 3300 3350 3200
Wire Wire Line
	2950 3400 2950 3500
Wire Wire Line
	3850 3150 3850 3350
Connection ~ 3850 3250
Wire Wire Line
	3850 3500 3850 3800
Connection ~ 3850 3600
Connection ~ 3850 3700
Wire Wire Line
	3850 3350 3650 3350
Wire Wire Line
	3650 3750 3650 3650
Wire Wire Line
	5150 3050 5050 3050
Wire Wire Line
	5550 3050 5450 3050
Wire Wire Line
	3600 5150 3600 5050
Wire Wire Line
	3600 5250 3700 5250
Wire Wire Line
	3600 5350 3600 5450
Wire Wire Line
	3100 5250 3000 5250
Wire Wire Line
	3000 5150 3100 5150
Wire Wire Line
	3100 5350 3000 5350
Wire Wire Line
	3850 2300 3850 2400
Wire Wire Line
	3850 2800 3850 2700
$Comp
L ATMEGA328P-M U3
U 1 1 5961371A
P 7750 3500
F 0 "U3" H 7000 4750 50  0000 L BNN
F 1 "ATMEGA328P-M" H 8150 2100 50  0000 L BNN
F 2 "Housings_DFN_QFN:QFN-32-1EP_5x5mm_Pitch0.5mm" H 7850 1950 50  0000 C CIN
F 3 "" H 7750 3500 50  0000 C CNN
	1    7750 3500
	1    0    0    -1  
$EndComp
Text GLabel 8850 4400 2    47   Output ~ 0
PI_PWR
Text GLabel 8850 4500 2    47   Output ~ 0
FPV_PWR
Text GLabel 8850 4700 2    47   Output ~ 0
XBEE_SLEEP
Text GLabel 8850 4600 2    47   Output ~ 0
uMCA_PWR
Text GLabel 8850 3750 2    47   BiDi ~ 0
SCL
Text GLabel 8850 3650 2    47   Input ~ 0
SDA
Text GLabel 8850 4200 2    47   Input ~ 0
XBEE_INT
Text GLabel 8850 4100 2    47   Output ~ 0
TX_AVR
Text GLabel 8850 4000 2    47   Input ~ 0
RX_AVR
Text GLabel 8850 2900 2    47   Output ~ 0
SCK
Text GLabel 8850 2700 2    47   BiDi ~ 0
MOSI
Text GLabel 8850 2800 2    47   BiDi ~ 0
MISO
Text GLabel 8850 2600 2    47   Output ~ 0
BMP_CSB
Text GLabel 8850 3550 2    47   Output ~ 0
SCROLL_UP
Text GLabel 8850 2500 2    47   Output ~ 0
TAKE_PICTURE
Text GLabel 8850 3350 2    47   Output ~ 0
SELECT
Text GLabel 8850 3450 2    47   Output ~ 0
SCROLL_DOWN
Text GLabel 8850 3000 2    47   Input ~ 0
uMCA_IDLE
Text GLabel 8850 3100 2    47   Input ~ 0
uMCA_BUSY
Text GLabel 8850 4300 2    47   Output ~ 0
GPS_PWR_CTRL
Text GLabel 8850 3250 2    47   Input ~ 0
BAL_1%2
Text GLabel 6750 3750 0    47   Input ~ 0
BAL_2%4
Text GLabel 6750 3850 0    47   Input ~ 0
BAL_3%6
Wire Wire Line
	8750 4400 8850 4400
Wire Wire Line
	8850 4500 8750 4500
Wire Wire Line
	8750 4700 8850 4700
Wire Wire Line
	8850 4600 8750 4600
Wire Wire Line
	8850 4200 8750 4200
Wire Wire Line
	8750 4000 8850 4000
Wire Wire Line
	8850 4100 8750 4100
Wire Wire Line
	8750 3650 8850 3650
Wire Wire Line
	8850 3750 8750 3750
Wire Wire Line
	8850 3550 8750 3550
Wire Wire Line
	8850 2900 8750 2900
Wire Wire Line
	8850 2800 8750 2800
Wire Wire Line
	8750 2700 8850 2700
Wire Wire Line
	8850 2600 8750 2600
Wire Wire Line
	8850 3100 8750 3100
Wire Wire Line
	8750 3000 8850 3000
Wire Wire Line
	8850 3350 8750 3350
Wire Wire Line
	8850 3450 8750 3450
Wire Wire Line
	8850 2500 8750 2500
Wire Wire Line
	8850 4300 8750 4300
Wire Wire Line
	8850 3250 8750 3250
Wire Wire Line
	6850 3750 6750 3750
Wire Wire Line
	6750 3850 6850 3850
$Comp
L LED-RESCUE-Aerostat_REV_A D2
U 1 1 59614A2A
P 9450 2400
F 0 "D2" H 9450 2500 50  0000 C CNN
F 1 "LED" H 9450 2300 50  0000 C CNN
F 2 "LEDs:LED_0603" H 9450 2400 50  0001 C CNN
F 3 "" H 9450 2400 50  0000 C CNN
	1    9450 2400
	-1   0    0    1   
$EndComp
$Comp
L R R6
U 1 1 59614ACD
P 9000 2400
F 0 "R6" V 8900 2400 50  0000 C CNN
F 1 "330" V 9000 2400 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 8930 2400 50  0001 C CNN
F 3 "" H 9000 2400 50  0000 C CNN
	1    9000 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	9150 2400 9250 2400
$Comp
L GND #PWR09
U 1 1 59614C3F
P 9650 2500
F 0 "#PWR09" H 9650 2250 50  0001 C CNN
F 1 "GND" H 9650 2350 50  0000 C CNN
F 2 "" H 9650 2500 50  0000 C CNN
F 3 "" H 9650 2500 50  0000 C CNN
	1    9650 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 2500 9650 2400
Wire Wire Line
	8850 2400 8750 2400
$Comp
L +3.3V #PWR010
U 1 1 59614FB6
P 6850 2300
F 0 "#PWR010" H 6850 2150 50  0001 C CNN
F 1 "+3.3V" H 6850 2440 50  0000 C CNN
F 2 "" H 6850 2300 50  0000 C CNN
F 3 "" H 6850 2300 50  0000 C CNN
	1    6850 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 2300 6850 3000
Connection ~ 6850 2400
Connection ~ 6850 2500
Connection ~ 6850 2700
Wire Wire Line
	6700 2400 6850 2400
Wire Wire Line
	6850 4500 6850 4800
Connection ~ 6850 4600
$Comp
L GND #PWR011
U 1 1 59615746
P 6850 4800
F 0 "#PWR011" H 6850 4550 50  0001 C CNN
F 1 "GND" H 6850 4650 50  0000 C CNN
F 2 "" H 6850 4800 50  0000 C CNN
F 3 "" H 6850 4800 50  0000 C CNN
	1    6850 4800
	1    0    0    -1  
$EndComp
Connection ~ 6850 4700
Wire Wire Line
	9250 3950 9250 3850
Wire Wire Line
	9250 3850 8750 3850
$Comp
L +3.3V #PWR012
U 1 1 59615C99
P 9550 3750
F 0 "#PWR012" H 9550 3600 50  0001 C CNN
F 1 "+3.3V" H 9550 3890 50  0000 C CNN
F 2 "" H 9550 3750 50  0000 C CNN
F 3 "" H 9550 3750 50  0000 C CNN
	1    9550 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 3850 9550 3750
$Comp
L CONN_01X03 P7
U 1 1 59B1C19F
P 3600 6150
F 0 "P7" H 3600 6350 50  0000 C CNN
F 1 "RX" H 3600 5950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 3600 6150 50  0001 C CNN
F 3 "" H 3600 6150 50  0000 C CNN
	1    3600 6150
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 P8
U 1 1 59B1C248
P 3600 6700
F 0 "P8" H 3600 6900 50  0000 C CNN
F 1 "TX" H 3600 6500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 3600 6700 50  0001 C CNN
F 3 "" H 3600 6700 50  0000 C CNN
	1    3600 6700
	1    0    0    -1  
$EndComp
Wire Notes Line
	3700 6050 3750 6050
Wire Notes Line
	3750 6050 3750 6150
Wire Notes Line
	3750 6150 3700 6150
Wire Notes Line
	3700 6600 3750 6600
Wire Notes Line
	3750 6600 3750 6700
Wire Notes Line
	3750 6700 3700 6700
Text Notes 4000 6650 0    47   ~ 0
JUMPERS SELECT BETWEEN USB\nTO SERIAL AND XBEE. THIS ALLOWS\nFOR PROGRAMMING OVER USB AND\nDEBUGGING WHILE STILL BEING\nABLE TO COMMUNICATE WITH THE\nXBEE OVER HARDWARE UART.
Text GLabel 3300 6700 0    47   Input ~ 0
TX_AVR
Text GLabel 3300 6150 0    47   Output ~ 0
RX_AVR
Wire Wire Line
	3400 6150 3300 6150
Wire Wire Line
	3300 6700 3400 6700
Text GLabel 3300 6600 0    47   Output ~ 0
RX_FTDI
Text GLabel 3300 6050 0    47   Input ~ 0
TX_FTDI
Wire Wire Line
	3300 6050 3400 6050
Wire Wire Line
	3300 6600 3400 6600
Text GLabel 3300 6250 0    47   Input ~ 0
TX_XBEE
Wire Wire Line
	3300 6250 3400 6250
Text GLabel 3300 6800 0    47   Input ~ 0
RX_XBEE
Wire Wire Line
	3300 6800 3400 6800
Text Notes 4100 5500 0    47   ~ 0
ICSP, USE ONLY FOR FLASHING\n8MHZ BREADBOARD (INTERNAL CLOCK)\nARDUINO BOOTLOADER. FAILURE TO DO\nSO WILL LOCK THE AVR SINCE\nTHERE IS NO CRYSTAL ON THE PCB.
Text Notes 3850 4450 0    47   ~ 0
FTDI 230X, USB TO SERIAL ADAPTER\nINTERFACES WITH ATMEGA328P\nUSING ARDUINO BOOTLOADER TO\nPROGRAM AND DEBUGGING OVER\nSERIAL.
Text Notes 6950 5300 0    47   ~ 0
ATMEGA328P MCU COMMONLY USED IN ARDUINO UNO\nRUNS MODIFIED OPTIBOOT BOOTLOADER AT 8MHZ.
Text GLabel 3350 2700 1    47   Output ~ 0
V_USB
$EndSCHEMATC