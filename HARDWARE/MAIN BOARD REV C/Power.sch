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
Sheet 3 4
Title "Aerostat Control Board"
Date "2017-09-07"
Rev "C"
Comp "University of Toledo 3MDL"
Comment1 "*NOTE: uMCA refers to RGB+3 model"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 9550 2750 2    47   Output ~ 0
VCC_FPV
$Comp
L +11.1V #PWR013
U 1 1 59542024
P 8600 2650
F 0 "#PWR013" H 8600 2500 50  0001 C CNN
F 1 "+11.1V" H 8600 2800 50  0000 C CNN
F 2 "" H 8600 2650 50  0000 C CNN
F 3 "" H 8600 2650 50  0000 C CNN
	1    8600 2650
	1    0    0    -1  
$EndComp
Text GLabel 9550 3700 2    47   Output ~ 0
VCC_uMCA
$Comp
L +11.1V #PWR014
U 1 1 5954206C
P 8600 3600
F 0 "#PWR014" H 8600 3450 50  0001 C CNN
F 1 "+11.1V" H 8600 3750 50  0000 C CNN
F 2 "" H 8600 3600 50  0000 C CNN
F 3 "" H 8600 3600 50  0000 C CNN
	1    8600 3600
	1    0    0    -1  
$EndComp
Text GLabel 8500 2850 0    47   Input ~ 0
FPV_PWR
Text GLabel 8500 3800 0    47   Input ~ 0
uMCA_PWR
Text GLabel 6550 4950 2    47   Output ~ 0
BAL_3%6
$Comp
L CONN_01X04 P3
U 1 1 59544288
P 6150 2850
F 0 "P3" H 6150 3100 50  0000 C CNN
F 1 "LIPO BALANCE" V 6250 2850 50  0000 C CNN
F 2 "MOD:JST_B4B-XH-A(LF)(SN)" H 6150 2850 50  0001 C CNN
F 3 "" H 6150 2850 50  0000 C CNN
	1    6150 2850
	1    0    0    -1  
$EndComp
Text GLabel 6550 3900 2    47   Output ~ 0
BAL_2%4
Text GLabel 6550 3500 2    47   Output ~ 0
BAL_1%2
$Comp
L GND #PWR015
U 1 1 595442D2
P 5950 2600
F 0 "#PWR015" H 5950 2350 50  0001 C CNN
F 1 "GND" H 5950 2450 50  0000 C CNN
F 2 "" H 5950 2600 50  0000 C CNN
F 3 "" H 5950 2600 50  0000 C CNN
	1    5950 2600
	-1   0    0    1   
$EndComp
$Comp
L Battery-RESCUE-Aerostat_REV_A BT1
U 1 1 5954D630
P 1700 1700
F 0 "BT1" H 1450 1750 50  0000 L CNN
F 1 "11.1V LIPO" H 1200 1650 50  0000 L CNN
F 2 "MOD:XT60" V 1700 1740 50  0001 C CNN
F 3 "" V 1700 1740 50  0000 C CNN
	1    1700 1700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 5954DACE
P 1700 1950
F 0 "#PWR016" H 1700 1700 50  0001 C CNN
F 1 "GND" H 1700 1800 50  0000 C CNN
F 2 "" H 1700 1950 50  0000 C CNN
F 3 "" H 1700 1950 50  0000 C CNN
	1    1700 1950
	1    0    0    -1  
$EndComp
$Comp
L R_PACK8 R4
U 1 1 595CCAD5
P 6250 3850
F 0 "R4" H 6250 4300 50  0000 C CNN
F 1 "2K" H 6250 3400 50  0000 C CNN
F 2 "Resistors_SMD:R_Array_Convex_8x0602" H 6250 3850 50  0001 C CNN
F 3 "" H 6250 3850 50  0000 C CNN
	1    6250 3850
	1    0    0    -1  
$EndComp
Text GLabel 5850 2800 0    47   Output ~ 0
BAL_1
Text GLabel 5850 2900 0    47   Output ~ 0
BAL_2
Text GLabel 5850 3000 0    47   Output ~ 0
BAL_3
Text GLabel 5950 3500 0    47   Input ~ 0
BAL_1
Text GLabel 5950 3700 0    47   Input ~ 0
BAL_2
Text GLabel 5950 4550 0    47   Input ~ 0
BAL_3
$Comp
L GND #PWR017
U 1 1 595CF22F
P 5950 3600
F 0 "#PWR017" H 5950 3350 50  0001 C CNN
F 1 "GND" V 5950 3400 50  0000 C CNN
F 2 "" H 5950 3600 50  0000 C CNN
F 3 "" H 5950 3600 50  0000 C CNN
	1    5950 3600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR018
U 1 1 595CF68F
P 5950 4000
F 0 "#PWR018" H 5950 3750 50  0001 C CNN
F 1 "GND" H 5950 3850 50  0000 C CNN
F 2 "" H 5950 4000 50  0000 C CNN
F 3 "" H 5950 4000 50  0000 C CNN
	1    5950 4000
	0    1    1    0   
$EndComp
$Comp
L R_PACK8 R5
U 1 1 595D06C8
P 6250 4900
F 0 "R5" H 6250 5350 50  0000 C CNN
F 1 "2K" H 6250 4450 50  0000 C CNN
F 2 "Resistors_SMD:R_Array_Convex_8x0602" H 6250 4900 50  0001 C CNN
F 3 "" H 6250 4900 50  0000 C CNN
	1    6250 4900
	1    0    0    -1  
$EndComp
NoConn ~ 6050 4100
NoConn ~ 6050 4200
NoConn ~ 6450 4100
NoConn ~ 6450 4200
$Comp
L GND #PWR019
U 1 1 595D16B0
P 5950 5050
F 0 "#PWR019" H 5950 4800 50  0001 C CNN
F 1 "GND" V 5950 4850 50  0000 C CNN
F 2 "" H 5950 5050 50  0000 C CNN
F 3 "" H 5950 5050 50  0000 C CNN
	1    5950 5050
	0    1    1    0   
$EndComp
$Comp
L LOADSWITCHMODULE U5
U 1 1 59602E4D
P 9000 3500
F 0 "U5" H 8850 3450 60  0000 C CNN
F 1 "LOADSWITCHMODULE" H 9025 3075 60  0000 C CNN
F 2 "MOD:LOAD SWITCH MODULE" H 9025 3525 60  0001 C CNN
F 3 "" H 9025 3525 60  0001 C CNN
	1    9000 3500
	1    0    0    -1  
$EndComp
$Comp
L LOADSWITCHMODULE U4
U 1 1 59602EF6
P 9000 2550
F 0 "U4" H 8850 2500 60  0000 C CNN
F 1 "LOADSWITCHMODULE" H 9025 2125 60  0000 C CNN
F 2 "MOD:LOAD SWITCH MODULE" H 9025 2575 60  0001 C CNN
F 3 "" H 9025 2575 60  0001 C CNN
	1    9000 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 596039E9
P 9550 3800
F 0 "#PWR020" H 9550 3550 50  0001 C CNN
F 1 "GND" V 9550 3600 50  0000 C CNN
F 2 "" H 9550 3800 50  0000 C CNN
F 3 "" H 9550 3800 50  0000 C CNN
	1    9550 3800
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR021
U 1 1 59603EB8
P 9550 2850
F 0 "#PWR021" H 9550 2600 50  0001 C CNN
F 1 "GND" V 9550 2650 50  0000 C CNN
F 2 "" H 9550 2850 50  0000 C CNN
F 3 "" H 9550 2850 50  0000 C CNN
	1    9550 2850
	0    -1   -1   0   
$EndComp
$Comp
L +11.1V #PWR022
U 1 1 59611A1D
P 2450 5100
F 0 "#PWR022" H 2450 4950 50  0001 C CNN
F 1 "+11.1V" V 2450 5350 50  0000 C CNN
F 2 "" H 2450 5100 50  0000 C CNN
F 3 "" H 2450 5100 50  0000 C CNN
	1    2450 5100
	0    1    -1   0   
$EndComp
$Comp
L +3.3V #PWR023
U 1 1 59641B3E
P 9300 4500
F 0 "#PWR023" H 9300 4350 50  0001 C CNN
F 1 "+3.3V" V 9300 4750 50  0000 C CNN
F 2 "" H 9300 4500 50  0000 C CNN
F 3 "" H 9300 4500 50  0000 C CNN
	1    9300 4500
	0    1    -1   0   
$EndComp
Text GLabel 8800 4500 0    47   Input ~ 0
VCC_XBEE
$Comp
L R R7
U 1 1 59641BF5
P 9050 4500
F 0 "R7" V 9130 4500 50  0000 C CNN
F 1 ".01" V 9050 4500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 8980 4500 50  0001 C CNN
F 3 "" H 9050 4500 50  0000 C CNN
	1    9050 4500
	0    1    -1   0   
$EndComp
Text Notes 1800 1750 0    47   ~ 0
XT60\nCONN.
Text Notes 5200 2950 0    47   ~ 0
3S LIPO\nBAL. CONN.
Text Notes 4950 4000 0    47   ~ 0
RESISTIVE DIVIDERS\nFOR MONITORING \nBATTERY VOLTAGE
Text Notes 8750 3100 0    47   ~ 0
FPV LOAD SWITCH\n
Text Notes 8650 4050 0    47   ~ 0
uMCA LOAD SWITCH\n
Text Notes 8600 4650 0    47   ~ 0
SHUNT RESISTOR FOR XBEE\n
Text Notes 8400 5200 0    47   ~ 0
*LOAD SWITCHES INCLUDE SHUNT\nRESISTOR FOR MONITORING CURRENT\nDRAWN BY FPV AND uMCA. XBEE\nINCLUDES SIMILAR SHUNT RESISTOR.
Text Notes 8350 2350 0    47   ~ 0
Load Switch (FPF2701MPX) Calculations\nRset(K Ohms) = 277.5 / Current Limit (A)\nRset FPV = 820 ohm (338mA)\nRset uMCA = 330 ohm (841mA)\nResistors are found on Load Switch PCB\n
$Comp
L GND #PWR024
U 1 1 59BAA847
P 2500 6500
F 0 "#PWR024" H 2500 6250 50  0001 C CNN
F 1 "GND" H 2500 6350 50  0000 C CNN
F 2 "" H 2500 6500 50  0000 C CNN
F 3 "" H 2500 6500 50  0000 C CNN
	1    2500 6500
	1    0    0    -1  
$EndComp
$Comp
L C C9
U 1 1 59BAA85A
P 2950 6150
F 0 "C9" H 2975 6250 50  0000 L CNN
F 1 "10uF" H 2750 6050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2988 6000 50  0001 C CNN
F 3 "" H 2950 6150 50  0000 C CNN
	1    2950 6150
	1    0    0    -1  
$EndComp
$Comp
L C C8
U 1 1 59BAA860
P 2050 6150
F 0 "C8" H 2075 6250 50  0000 L CNN
F 1 "10uF" H 2075 6050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2088 6000 50  0001 C CNN
F 3 "" H 2050 6150 50  0000 C CNN
	1    2050 6150
	1    0    0    -1  
$EndComp
Text Notes 2000 6850 0    47   ~ 0
3.3V 0.5A BUCK REGULATOR\n
$Comp
L RECOM_R78 U6
U 1 1 59BAAABA
P 2500 5700
F 0 "U6" H 2500 5700 47  0000 C CNN
F 1 "RECOM_R78" H 2550 5600 47  0000 C CNN
F 2 "MOD:R-78E" H 2500 5700 47  0001 C CNN
F 3 "" H 2500 5700 47  0001 C CNN
	1    2500 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 1450 1700 1550
Wire Wire Line
	1700 1950 1700 1850
Wire Wire Line
	5950 2700 5950 2600
Wire Wire Line
	5850 3000 5950 3000
Wire Wire Line
	5950 2900 5850 2900
Wire Wire Line
	5850 2800 5950 2800
Wire Wire Line
	6550 3500 6450 3500
Wire Wire Line
	6050 3500 5950 3500
Wire Wire Line
	6450 3500 6450 3600
Wire Wire Line
	6050 3600 5950 3600
Wire Wire Line
	5950 3700 6050 3700
Wire Wire Line
	6450 3700 6450 3800
Wire Wire Line
	6050 3800 6050 3900
Wire Wire Line
	5950 4000 6050 4000
Wire Wire Line
	6450 3900 6450 4000
Wire Wire Line
	6550 3900 6450 3900
Wire Wire Line
	5950 4550 6050 4550
Wire Wire Line
	6450 4550 6450 4650
Wire Wire Line
	6050 4650 6050 4750
Wire Wire Line
	6450 4750 6450 4850
Wire Wire Line
	6050 4850 6050 4950
Wire Wire Line
	6450 4950 6450 5050
Wire Wire Line
	5950 5050 6050 5050
Wire Wire Line
	6550 4950 6450 4950
Wire Wire Line
	9450 3700 9550 3700
Wire Wire Line
	8500 3800 8600 3800
Wire Wire Line
	9550 3800 9450 3800
Wire Wire Line
	8600 3600 8600 3700
Wire Wire Line
	8600 2650 8600 2750
Wire Wire Line
	9550 2850 9450 2850
Wire Wire Line
	8500 2850 8600 2850
Wire Wire Line
	9550 2750 9450 2750
Wire Wire Line
	8800 4500 8900 4500
Wire Wire Line
	9200 4500 9300 4500
Wire Wire Line
	2500 6500 2500 6400
Wire Wire Line
	2050 6400 2950 6400
Wire Wire Line
	2950 6400 2950 6300
Wire Wire Line
	2050 6300 2050 6400
Connection ~ 2500 6400
Connection ~ 2950 5950
Connection ~ 2050 5950
$Comp
L D_Schottky D3
U 1 1 59BACE58
P 2200 5100
F 0 "D3" H 2300 5050 50  0000 C CNN
F 1 "1A" H 2100 5050 50  0000 C CNN
F 2 "Diodes_SMD:D_SOD-123" H 2200 5100 50  0001 C CNN
F 3 "" H 2200 5100 50  0000 C CNN
	1    2200 5100
	1    0    0    1   
$EndComp
Text GLabel 2450 5350 2    47   Input ~ 0
V_USB
Text Notes 1700 4950 0    47   ~ 0
USB DOES ONLY POWERS 3.3V REGULATOR\n
$Comp
L D_Schottky D4
U 1 1 59BAD664
P 2200 5350
F 0 "D4" H 2300 5300 50  0000 C CNN
F 1 "1A" H 2100 5300 50  0000 C CNN
F 2 "Diodes_SMD:D_SOD-123" H 2200 5350 50  0001 C CNN
F 3 "" H 2200 5350 50  0000 C CNN
	1    2200 5350
	1    0    0    1   
$EndComp
Wire Wire Line
	2450 5350 2350 5350
Wire Wire Line
	2350 5100 2450 5100
Connection ~ 2050 5350
$Comp
L POT RV2
U 1 1 59C90139
P 2200 4000
F 0 "RV2" V 2025 4000 50  0000 C CNN
F 1 "POT" V 2100 4000 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer-EVM3E" H 2200 4000 50  0001 C CNN
F 3 "" H 2200 4000 50  0000 C CNN
	1    2200 4000
	1    0    0    -1  
$EndComp
$Comp
L Q_TRIAC_AAG Q2
U 1 1 59C902E1
P 3100 3800
F 0 "Q2" H 3225 3825 50  0000 L CNN
F 1 "Q_TRIAC_AAG" H 3225 3750 50  0001 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" V 3175 3825 50  0001 C CNN
F 3 "" V 3100 3800 50  0000 C CNN
	1    3100 3800
	1    0    0    1   
$EndComp
$Comp
L R R9
U 1 1 59C903B2
P 2750 3450
F 0 "R9" V 2830 3450 50  0000 C CNN
F 1 "R" V 2750 3450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 2680 3450 50  0001 C CNN
F 3 "" H 2750 3450 50  0000 C CNN
	1    2750 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3700 2750 3600
Wire Wire Line
	2950 3700 2750 3700
Wire Wire Line
	2450 4000 2350 4000
Wire Wire Line
	2200 3850 2200 3300
Wire Wire Line
	2000 3300 3100 3300
Connection ~ 2200 3300
Wire Wire Line
	2200 4300 3100 4300
Wire Wire Line
	2200 4150 2200 4400
Connection ~ 2750 4300
$Comp
L GND #PWR025
U 1 1 59C9085E
P 2200 4400
F 0 "#PWR025" H 2200 4150 50  0001 C CNN
F 1 "GND" H 2200 4250 50  0000 C CNN
F 2 "" H 2200 4400 50  0000 C CNN
F 3 "" H 2200 4400 50  0000 C CNN
	1    2200 4400
	1    0    0    -1  
$EndComp
Connection ~ 2200 4300
Connection ~ 2750 3300
Wire Wire Line
	3100 3200 3100 3650
Wire Wire Line
	3100 4300 3100 3950
$Comp
L Polyfuse F2
U 1 1 59C90F2A
P 1850 3300
F 0 "F2" V 1750 3300 50  0000 C CNN
F 1 "Polyfuse" V 1950 3300 50  0000 C CNN
F 2 "Capacitors_SMD:C_1210" H 1900 3100 50  0001 L CNN
F 3 "" H 1850 3300 50  0001 C CNN
	1    1850 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 3300 1700 3300
Text GLabel 1600 3300 0    47   Input ~ 0
3.3_VOUT
$Comp
L +3.3V #PWR026
U 1 1 59C914D7
P 3100 3200
F 0 "#PWR026" H 3100 3050 50  0001 C CNN
F 1 "+3.3V" H 3100 3340 50  0000 C CNN
F 2 "" H 3100 3200 50  0000 C CNN
F 3 "" H 3100 3200 50  0000 C CNN
	1    3100 3200
	1    0    0    -1  
$EndComp
Connection ~ 3100 3300
$Comp
L POT RV1
U 1 1 59C91926
P 2200 2150
F 0 "RV1" V 2025 2150 50  0000 C CNN
F 1 "POT" V 2100 2150 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer-EVM3E" H 2200 2150 50  0001 C CNN
F 3 "" H 2200 2150 50  0000 C CNN
	1    2200 2150
	1    0    0    -1  
$EndComp
$Comp
L Q_TRIAC_AAG Q1
U 1 1 59C9192C
P 3100 1950
F 0 "Q1" H 3225 1975 50  0000 L CNN
F 1 "Q_TRIAC_AAG" H 3225 1900 50  0001 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" V 3175 1975 50  0001 C CNN
F 3 "" V 3100 1950 50  0000 C CNN
	1    3100 1950
	1    0    0    1   
$EndComp
$Comp
L R R8
U 1 1 59C91932
P 2750 1600
F 0 "R8" V 2830 1600 50  0000 C CNN
F 1 "R" V 2750 1600 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 2680 1600 50  0001 C CNN
F 3 "" H 2750 1600 50  0000 C CNN
	1    2750 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1850 2750 1750
Wire Wire Line
	2950 1850 2750 1850
Wire Wire Line
	2450 2150 2350 2150
Wire Wire Line
	2200 2000 2200 1450
Wire Wire Line
	2000 1450 3100 1450
Connection ~ 2200 1450
Wire Wire Line
	2200 2450 3100 2450
Wire Wire Line
	2200 2300 2200 2550
Connection ~ 2750 2450
$Comp
L GND #PWR027
U 1 1 59C91941
P 2200 2550
F 0 "#PWR027" H 2200 2300 50  0001 C CNN
F 1 "GND" H 2200 2400 50  0000 C CNN
F 2 "" H 2200 2550 50  0000 C CNN
F 3 "" H 2200 2550 50  0000 C CNN
	1    2200 2550
	1    0    0    -1  
$EndComp
Connection ~ 2200 2450
Connection ~ 2750 1450
Wire Wire Line
	3100 1350 3100 1800
Wire Wire Line
	3100 2450 3100 2100
$Comp
L Polyfuse F1
U 1 1 59C9194B
P 1850 1450
F 0 "F1" V 1750 1450 50  0000 C CNN
F 1 "Polyfuse" V 1650 1450 50  0000 C CNN
F 2 "Capacitors_SMD:C_1210" H 1900 1250 50  0001 L CNN
F 3 "" H 1850 1450 50  0001 C CNN
	1    1850 1450
	0    1    1    0   
$EndComp
Connection ~ 3100 1450
$Comp
L +11.1V #PWR028
U 1 1 59C91B15
P 3100 1350
F 0 "#PWR028" H 3100 1200 50  0001 C CNN
F 1 "+11.1V" H 3100 1500 50  0000 C CNN
F 2 "" H 3100 1350 50  0000 C CNN
F 3 "" H 3100 1350 50  0000 C CNN
	1    3100 1350
	1    0    0    -1  
$EndComp
$Comp
L LM431 U8
U 1 1 59C8FED3
P 2750 3600
F 0 "U8" H 2650 3500 60  0000 C CNN
F 1 "LM431" H 2750 2800 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-323_SC-70" H 2750 3600 60  0001 C CNN
F 3 "" H 2750 3600 60  0001 C CNN
	1    2750 3600
	1    0    0    -1  
$EndComp
Text GLabel 3150 6100 3    47   Output ~ 0
3.3_VOUT
Wire Wire Line
	3150 6100 3150 5950
Wire Wire Line
	3150 5950 2950 5950
Wire Wire Line
	2950 5950 2950 6000
$Comp
L D_Schottky D1
U 1 1 59D46841
P 2200 5600
F 0 "D1" H 2300 5550 50  0000 C CNN
F 1 "1A" H 2100 5550 50  0000 C CNN
F 2 "Diodes_SMD:D_SOD-123" H 2200 5600 50  0001 C CNN
F 3 "" H 2200 5600 50  0000 C CNN
	1    2200 5600
	1    0    0    1   
$EndComp
Connection ~ 2050 5600
$Comp
L +9V #PWR029
U 1 1 59D468E5
P 2450 5600
F 0 "#PWR029" H 2450 5450 50  0001 C CNN
F 1 "+9V" V 2450 5800 50  0000 C CNN
F 2 "" H 2450 5600 50  0000 C CNN
F 3 "" H 2450 5600 50  0000 C CNN
	1    2450 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	2450 5600 2350 5600
Wire Wire Line
	2050 5100 2050 6000
$Comp
L LM431 U7
U 1 1 59C91920
P 2750 1750
F 0 "U7" H 2650 1650 60  0000 C CNN
F 1 "LM431" H 2750 950 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-323_SC-70" H 2750 1750 60  0001 C CNN
F 3 "" H 2750 1750 60  0001 C CNN
	1    2750 1750
	1    0    0    -1  
$EndComp
$Comp
L Battery-RESCUE-Aerostat_REV_A BT2
U 1 1 59E61F65
P 3600 4800
F 0 "BT2" H 3700 4850 50  0000 L CNN
F 1 "9V" H 3700 4750 50  0000 L CNN
F 2 "MOD:TE1X2" V 3600 4840 50  0001 C CNN
F 3 "" V 3600 4840 50  0000 C CNN
	1    3600 4800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR030
U 1 1 59E62055
P 3600 5050
F 0 "#PWR030" H 3600 4800 50  0001 C CNN
F 1 "GND" H 3600 4900 50  0000 C CNN
F 2 "" H 3600 5050 50  0000 C CNN
F 3 "" H 3600 5050 50  0000 C CNN
	1    3600 5050
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR031
U 1 1 59E62099
P 3600 4550
F 0 "#PWR031" H 3600 4400 50  0001 C CNN
F 1 "+9V" H 3600 4690 50  0000 C CNN
F 2 "" H 3600 4550 50  0000 C CNN
F 3 "" H 3600 4550 50  0000 C CNN
	1    3600 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 4550 3600 4650
Wire Wire Line
	3600 4950 3600 5050
$EndSCHEMATC
