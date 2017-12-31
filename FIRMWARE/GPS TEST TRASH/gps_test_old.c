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
#define uMCA_IDLE PB6
#define uMCA_BUSY PB7
#define SELECT PC1
#define SCROLL_DOWN PC2
#define SCROLL_UP PC3
#define XBEE_INT PD2
#define GPS_PWR_CTRL PD3
#define PI_PWR PD4
#define FPV_PWR PD5
#define uMCA_PWR 6
#define XBEE_SLEEP PD7
#define BAL_1 PC0
#define BAL_2 A6
#define BAL_3 A7
#define LED PB0
#define SDA PC4
#define SCL PC5

#define startMsg "$GPGLL"
#define endMsg "$GPRMC"
#define startMsgLen 6
#define endMsgLen 6
#include "SoftwareSerial.h"
SoftwareSerial gpsSerial(SCL, SDA);
unsigned long secondTimer = 0;
void setup() {
  Serial.begin(115200);
  gpsSerial.begin(9600);
  gpsSerial.listen();
  pinMode(GPS_PWR_CTRL, OUTPUT);
  digitalWrite(GPS_PWR_CTRL, HIGH);
  pinMode(LED, OUTPUT);
  digitalWrite(LED, LOW);
}
void loop() {
  gpsSerial.listen();
  String gps = "";
  while (gpsSerial.available() > 1) {
    char data = gpsSerial.read();
    gps += data;
    //Serial.print(data);
  }
  if (gps.length() >= 100 && gps.indexOf(startMsg) == -1){
    Serial.println("buffer cleared");
    gps = ""; //clear gps string when start condition is not met;
  }
  
  if (millis() - secondTimer >= 500UL) {
    int startPt = 0;
    gps = "$00000988998417$$$$$326413$$$$00000$0000$GPGLL,2447.65027,N,12100.78318,E,065500.00,A,D*6E $GPTXT,01,01,02,";
    for (int i = 0; i < gps.length(); i ++) {
      Serial.println(i);
      startPt = gps.indexOf("$", startPt);//$GPGLL
      if (gps.substring(startPt, startPt + startMsgLen) == startMsg) {
        break;
      } else {
        startPt += 1; //avoid searching previous $
      }
    }
    int endPt = 0;
    for (int i = 0; i < gps.length(); i ++) {
      endPt = gps.indexOf("$", endPt);//$GPTXT
      if (gps.substring(endPt, endPt + endMsgLen) == endMsg) {
        break;
      } else {
        endPt += 1; //avoid searching previous $
      }
    }
    String gpsData = gps.substring(startPt, endPt);
    secondTimer = millis();
    digitalWrite(LED, !digitalRead(LED));
    if (gpsData != "") {
      if (gpsData.length() <= 60) {
        Serial.println(gpsData);
      }
      gpsData = "";
      gps = "";
    }
  }
}
