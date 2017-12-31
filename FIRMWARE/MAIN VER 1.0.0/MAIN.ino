
//Arduino Pro Mini Pin Map
#define PD1 1
#define PD0 0
#define PD2 2
#define PD3 3
#define PD4 4
#define PD5 5
#define PD6 6
#define PD7 7
#define PB0 8
#define PB1 9
#define PC3 17
#define PC2 16
#define PC1 15
#define PB4 12
#define PB3 11
#define PB2 10
#define PC4 A4
#define PC5 A5
//A7 and A6 already used in Port Names directly

//AVR Port Names
#define TAKE_PICTURE PB1
#define BMP_CSB 10 //PB2
#define SELECT PC1
#define SCROLL_DOWN PC2
#define SCROLL_UP PC3
#define XBEE_INT PD2
#define GPS_PWR_CTRL PD3
#define PI_PWR PD4
#define FPV_PWR PD5
#define uMCA_PWR PD6
#define XBEE_SLEEP PD7
#define BAL_1 PC0
#define BAL_2 A6
#define BAL_3 A7
#define LED PB0
#define SDA PC4
#define SCL PC5

#define uMCA_IDLE PB6 //not used in pin map
#define uMCA_BUSY PB7 //not used in pin map

#define startMsgLen 6
#define endMsgLen 2
#define gpsBufferSize 600
#define startMsg "$GPGLL"
#define endMsg 0x0D
#define gpsDelay 500UL
bool transmitGps = false;
bool parseGps = true;
bool gpsDirect = false;
int bufferIndex = 0;
char gpsBuffer[gpsBufferSize] = {}; //"circular" buffer for incoming gps data << not actually circular at this point, instead the buffer is made larger than needed
unsigned long gpsTimer = 0;

unsigned long uMCATimer = 0;
unsigned long uMCASleep;
unsigned long uMCADelay;
int uMCAPics;
bool uMCASleepFlag = false;
int uMCACurrentPic = 0;

#include <EEPROM.h>
#include "SoftwareSerial.h"
SoftwareSerial gpsSerial(SCL, SDA);

int readBusy() {
  if (PINB & (1 << uMCA_BUSY)) {
    return 1;
  } else {
    return 0;
  }
}

int readIdle() { //more reliable than readBusy() because red led for busy flashes
  if (PINB & (1 << uMCA_IDLE)) {
    return 1;
  } else {
    return 0;
  }
}

void takePic() {
  if (readIdle() == 0) {
    Serial.println("CAMERA BUSY");
    return 0;
  } else {
    Serial.println("RUNNING");
    digitalWrite(TAKE_PICTURE, HIGH);
    delay(100);
    digitalWrite(TAKE_PICTURE, LOW);
    delay(200);
    for (int i = 0; i < 1000 && readIdle() == 0; i ++) {
      if (i == 999) {
        Serial.println("IDLE TIMEOUT");
      }
      delay(10);
    }
  }
  Serial.println("DONE");
}

void updateParam() {
  int dataRead;
  dataRead = EEPROM.read(0);
  dataRead = EEPROM.read(1) + dataRead * 10;
  uMCASleep = dataRead;
  dataRead = EEPROM.read(2);
  dataRead = EEPROM.read(3) + dataRead * 10;
  uMCADelay = dataRead;
  dataRead = EEPROM.read(4);
  dataRead = EEPROM.read(5) + dataRead * 10;
  uMCAPics = dataRead;
}


void setup() {
  Serial.begin(9600); //needs to be same as XBee and Serial Monitor
  gpsSerial.begin(9600);
  gpsSerial.listen();

  pinMode(FPV_PWR, OUTPUT);
  pinMode(uMCA_PWR, OUTPUT);
  pinMode(TAKE_PICTURE, OUTPUT);
  pinMode(SELECT, OUTPUT);
  pinMode(GPS_PWR_CTRL, OUTPUT);
  pinMode(XBEE_SLEEP, OUTPUT);
  pinMode(LED, OUTPUT);

  digitalWrite(XBEE_SLEEP, LOW); //turn on XBEE
  digitalWrite(GPS_PWR_CTRL, LOW); //turn GPS off
  digitalWrite(FPV_PWR, HIGH); //turn off FPV
  digitalWrite(LED, LOW); //turn LED off
  digitalWrite(uMCA_PWR, HIGH); //turn off uMCA

  //DDRB &= ~((1 << uMCA_IDLE) | (1 << uMCA_BUSY)); //set as inputs
  //PORTB |= ((1 << uMCA_IDLE) | (1 << uMCA_BUSY)); //turn on pullup resistors
  updateParam(); //set camera parameters from EEPROM
  Serial.println("____BOOT____");
}

void loop() {
  if (Serial.available() > 0) {
    char command = Serial.read();
    int serRead;
    switch (command) {
      case 'a':
        transmitGps = true;
        Serial.println("GPS TRANS ON");
        break;
      case 'b':
        transmitGps = false;
        Serial.println("GPS TRANS OFF");
        break;
      case 'c':
        Serial.println("GPS PWR ON");
        digitalWrite(GPS_PWR_CTRL, HIGH);
        break;
      case 'd':
        Serial.println("GPS PWR OFF");
        digitalWrite(GPS_PWR_CTRL, LOW);
        break;
      case 'e':
        Serial.println("GPS PRS ON");
        parseGps = true;
        break;
      case 'f':
        Serial.println("GPS PRS OFF");
        parseGps = false;
        break;
      case 'x':
        Serial.println("GPS DIRECT ON");
        gpsDirect = true;
        break;
      case 'y':
        Serial.println("GPS DIRECT OFF");
        gpsDirect = false;
        break;
      case 'g':
        Serial.println("____SET_uMCA_PARAM____");
        Serial.print("SLEEP MINUTES: ");
        while (!Serial.available()) {
          //do nothing
        }
        serRead = Serial.read() - 48;
        Serial.print(serRead);
        EEPROM.write(0, serRead);
        delay(10);
        serRead = Serial.read() - 48;
        if (serRead == -49) {
          serRead = EEPROM.read(0);
          EEPROM.write(1, serRead);
          EEPROM.write(0, 0);
          Serial.println();
        } else {
          Serial.println(serRead);
          EEPROM.write(1, serRead);
        }
        Serial.print("DELAY MINUTES: ");
        while (!Serial.available()) {
          //do nothing
        }
        serRead = Serial.read() - 48;
        Serial.print(serRead);
        EEPROM.write(2, serRead);
        delay(10);
        serRead = Serial.read() - 48;
        if (serRead == -49) {
          serRead = EEPROM.read(2);
          EEPROM.write(3, serRead);
          EEPROM.write(2, 0);
          Serial.println();
        } else {
          Serial.println(serRead);
          EEPROM.write(3, serRead);
        }
        Serial.print("PICTURES: ");
        while (!Serial.available()) {
          //do nothing
        }
        serRead = Serial.read() - 48;
        Serial.print(serRead);
        EEPROM.write(4, serRead);
        delay(10);
        serRead = Serial.read() - 48;
        if (serRead == -49) {
          serRead = EEPROM.read(4);
          EEPROM.write(5, serRead);
          EEPROM.write(4, 0);
          Serial.println();
        } else {
          Serial.println(serRead);
          EEPROM.write(5, serRead);
        }
        updateParam();
        break;
      case 'i':
        Serial.println("____READ_uMCA_PARAM____");
        serRead = EEPROM.read(0);
        serRead = EEPROM.read(1) + serRead * 10;
        Serial.print("CAMERA SLEEP TIME: ");
        Serial.print(serRead);
        Serial.println(" MINUTES");
        serRead = EEPROM.read(2);
        serRead = EEPROM.read(3) + serRead * 10;
        Serial.print("PICTURE DELAY TIME: ");
        Serial.print(serRead);
        Serial.println(" MINUTES");
        serRead = EEPROM.read(4);
        serRead = EEPROM.read(5) + serRead * 10;
        Serial.print("NUMBER OF PICTURES: ");
        Serial.print(serRead);
        Serial.println(" PICTURES");
        break;
      case 'h':
        Serial.println("____COMMANDS____");
        Serial.println("a: GPS TRANS ON");
        Serial.println("b: GPS TRANS OFF");
        Serial.println("c: GPS PWR ON");
        Serial.println("d: GPS PWR OFF");
        Serial.println("e: GPS PRS ON");
        Serial.println("f: GPS PRS OFF");
        Serial.println("x: GPS DIRECT ON");
        Serial.println("y: GPS DIRECT OFF");
        Serial.println("g: SET uMCA PARAM");
        Serial.println("i: READ uMCA PARAM");
        Serial.println("j: FPV PWR ON");
        Serial.println("k: FPV PWR OFF");
        Serial.println("l: uMCA PWR ON");
        Serial.println("m: uMCA PWR OFF");
        Serial.println("z: uMCA TAKE PIC");
        break;
      case 'j':
        Serial.println("FPV ON");
        digitalWrite(FPV_PWR, LOW);
        break;
      case 'k':
        Serial.println("FPV OFF");
        digitalWrite(FPV_PWR, HIGH);
        break;
      case 'l':
        Serial.println("uMCA_ON");
        digitalWrite(uMCA_PWR, LOW);
        delay(40000);
        if (!readIdle()){
          Serial.println("DIAGNOSTIC");
          digitalWrite(SELECT, HIGH);
          delay(100);
          digitalWrite(SELECT, LOW);
          delay(1000);
          digitalWrite(TAKE_PICTURE, HIGH);
          delay(100);
          digitalWrite(TAKE_PICTURE, LOW);
        }
        Serial.println("uMCA_ON_DONE");
        break;
      case 'm':
        Serial.println("uMCA OFF");
        digitalWrite(uMCA_PWR, HIGH);
        break;
      case 'z':
        takePic();
        break;
      default:
        Serial.println("COMMAND NOT FOUND, TYPE 'h' FOR HELP");
        break;
    }
  }
  if (millis() - uMCATimer >= uMCASleep * 60000 || uMCASleepFlag) {
    uMCASleepFlag = true;
    digitalWrite(uMCA_PWR, LOW);

    if (millis() - uMCATimer >= uMCADelay * 60000) {
      uMCATimer = millis();
      uMCACurrentPic ++;
      if (uMCACurrentPic >= uMCAPics) {
        uMCASleepFlag = false;
        digitalWrite(uMCA_PWR, HIGH);
        uMCACurrentPic = 0;
      }
      else {
        takePic();
      }
    }
  }
  if (transmitGps) {
    gpsSerial.listen();
    while (gpsSerial.available() > 1) {
      char data = gpsSerial.read();
      if (gpsDirect) {
        Serial.write(data);
      } else {
        gpsBuffer[bufferIndex] = data;
        if (bufferIndex < gpsBufferSize) {
          bufferIndex ++;
        }
      }
    }
    if (millis() - gpsTimer >= gpsDelay) {
      int startPt = 0;
      for (int j = 0; j < gpsBufferSize; j ++) {
        for (int i = 0; i < startMsgLen; i ++) {
          if (gpsBuffer[j] == startMsg[i] && i == startMsgLen - 1) {
            startPt = j + 2;
            j = gpsBufferSize; //break out of both loops
          }
        }
      }
      int endPt = 0;
      for (int j = startPt + 3; j < gpsBufferSize; j ++) {
        if (gpsBuffer[j] == endMsg) {
          endPt = j;
          j = gpsBufferSize; //break out of both loops
        }
      }
      //Serial.println(endPt);
      //Serial.println(startPt);
      gpsTimer = millis();
      bufferIndex = 0;
      if (startPt != 0 && endPt != 0) {
        if (parseGps) {
          bool validLock = true;
          for (int i = startPt; i < endPt; i ++) {
            if (gpsBuffer[i] == ',' && gpsBuffer [i + 1] == ',' && gpsBuffer [i + 2] == ','  && i < startPt + 10) {
              //Serial.println(i);
              validLock = false;
            }
          }
          if (validLock) {
            Serial.print("LAT: ");
            for (int i = startPt; i < endPt && gpsBuffer[i] != 0x0A; i ++) {

              if (gpsBuffer[i] == ',' && (gpsBuffer[i + 1] == 'N' || gpsBuffer[i + 1] == 'S') && gpsBuffer[i + 2] == ',') { //fix N and S notation
                Serial.print(" ");
                Serial.println(gpsBuffer[i + 1]);
                Serial.print("LON: ");
                i = i + 3;
              }
              if (gpsBuffer[i] == ',' && (gpsBuffer[i + 1] == 'E' || gpsBuffer[i + 1] == 'W') && gpsBuffer[i + 2] == ',') { //fix E and W notation
                Serial.print(" ");
                Serial.print(gpsBuffer[i + 1]);
                i = endPt; //break from loop
              }
              if (gpsBuffer[i] != ',') { //dont print commas
                Serial.print(gpsBuffer[i]);
              }
            }
          } else {
            Serial.print("NO LOCK");
          }
        } else {
          for (int i = startPt - startMsgLen; i < endPt && gpsBuffer[i] != 0x0A; i ++) {
            Serial.print(gpsBuffer[i]);
          }
        }
        int i;
        for (i = 0; i < gpsBufferSize; i ++) {
          gpsBuffer[i] = "";
        }
        Serial.println("");
      }
    }
  }
}
