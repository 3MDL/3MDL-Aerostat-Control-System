/*#include <Wire.h>
#include <SPI.h>

#include <Adafruit_Sensor.h>
#include <Adafruit_BMP280.h>
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
#define PC0 14
#define PB5 13
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

Adafruit_BMP280 bmp(BMP_CSB);

void setup() {
  //set inputs and outputs
  pinMode(TAKE_PICTURE, OUTPUT);
  pinMode(BMP_CSB, OUTPUT);
  pinMode(uMCA_IDLE, INPUT);
  pinMode(uMCA_BUSY, INPUT);
  pinMode(BAL_1, INPUT);
  pinMode(BAL_2, INPUT);
  pinMode(BAL_3, INPUT);
  pinMode(SELECT, OUTPUT);
  pinMode(SCROLL_DOWN, OUTPUT);
  pinMode(SCROLL_UP, OUTPUT);
  pinMode(XBEE_INT, INPUT);
  pinMode(GPS_PWR_CTRL, OUTPUT);
  pinMode(PI_PWR, OUTPUT);
  pinMode(FPV_PWR, OUTPUT);
  pinMode(uMCA_PWR, OUTPUT);
  pinMode(XBEE_SLEEP, OUTPUT);
  pinMode(LED, OUTPUT);
  //turn all load switches off and xbee off
  digitalWrite(PI_PWR, LOW);
  digitalWrite(FPV_PWR, LOW);
  digitalWrite(uMCA_PWR, LOW);
  digitalWrite(XBEE_SLEEP, HIGH);
  //start i2c interface
  Wire.begin(0X60);
  Wire.onRequest(transmit);
  Wire.onReceive(receive);
  //start serial interface
  Serial.begin(9600);
  //start spi interface
  /*if (!bmp.begin()) {
    Serial.println(F("Could not find a valid BMP280 sensor, check wiring!"));
    while (1);
  }*/
}
/*
int c[] = { -1, -1, -1}; //command, parameter 1, parameter 2

void loop() {
    digitalWrite(uMCA_PWR, LOW); //turn uMCA on
  if (Serial.available()) {
    char c = Serial.read();
    if (c == 'm') { //menu
      Serial.println("menu");
      digitalWrite(SELECT, LOW);
      delay(100);
      digitalWrite(SELECT, HIGH);
    } else if (c == 'u') { //up
      Serial.println("up");
      digitalWrite(SCROLL_UP, LOW);
      delay(100);
      digitalWrite(SCROLL_UP, HIGH);
    } else if (c == 'd') { //down
      Serial.println("down");
      digitalWrite(SCROLL_DOWN, LOW);
      delay(100);
      digitalWrite(A2, HIGH);
    } else if (c == 'p') { //picture
      Serial.println("picture");
      digitalWrite(TAKE_PICTURE, LOW);
      delay(100);
      digitalWrite(TAKE_PICTURE, HIGH);
    }
  }
  delay(1000);
  int alt = bmp.readAltitude(1013.25);
  Serial.println(alt);
}

int output; //holds i2c transmit message

void receive() {
  digitalWrite(LED, !digitalRead(LED));
  int data = Wire.read();
  if (c[0] == -1) {
    c[0] = data;
  } else if (c[1] == -1) {
    c[1] = data;
  } else if (c[2] == -1) {
    c[2] = data;
  }
  Serial.println(c[0]);
  Serial.println(c[1]);
  Serial.println(c[2]);
  switch (c[0]) {
    case 1: //readAlt
      output = bmp.readAltitude(1013.25);
      c[0] = -1; c[1] = -1; c[2] = -1;
      break;
    case 101: //readCell
      output = analogRead("CELL_" + c[1]);
      c[0] = -1; c[1] = -1; c[2] = -1;
      break;
    case 102: //takePic
      digitalWrite(TAKE_PICTURE, LOW);
      delay(100);
      digitalWrite(TAKE_PICTURE, HIGH);
      c[0] = -1; c[1] = -1; c[2] = -1;
      break;
    case 201: //setGPIO
      if (c[1] != 999 && c[2] != 999) {
        digitalWrite(c[1], c[2]);
        c[0] = -1; c[1] = -1; c[2] = -1;
      }
      break;
  }
}
void transmit() {
  Wire.write(output);
}
*/
#include "TinyGPS++.h"

// A sample NMEA stream.
const char *gpsStream =
  "$GPRMC,045103.000,A,3014.1984,N,09749.2872,W,0.67,161.46,030913,,,A*7C\r\n"
  "$GPGGA,045104.000,3014.1985,N,09749.2873,W,1,09,1.2,211.6,M,-22.5,M,,0000*62\r\n"
  "$GPRMC,045200.000,A,3014.3820,N,09748.9514,W,36.88,65.02,030913,,,A*77\r\n"
  "$GPGGA,045201.000,3014.3864,N,09748.9411,W,1,10,1.2,200.8,M,-22.5,M,,0000*6C\r\n"
  "$GPRMC,045251.000,A,3014.4275,N,09749.0626,W,0.51,217.94,030913,,,A*7D\r\n"
  "$GPGGA,045252.000,3014.4273,N,09749.0628,W,1,09,1.3,206.9,M,-22.5,M,,0000*6F\r\n";

// The TinyGPS++ object
TinyGPSPlus gps;

void setup()
{
  Serial.begin(115200);

  Serial.println(F("BasicExample.ino"));
  Serial.println(F("Basic demonstration of TinyGPS++ (no device needed)"));
  Serial.print(F("Testing TinyGPS++ library v. ")); Serial.println(TinyGPSPlus::libraryVersion());
  Serial.println(F("by Mikal Hart"));
  Serial.println();

  while (*gpsStream)
    if (gps.encode(*gpsStream++))
      displayInfo();

  Serial.println();
  Serial.println(F("Done."));
}

void loop()
{
}

void displayInfo()
{
  Serial.print(F("Location: ")); 
  if (gps.location.isValid())
  {
    Serial.print(gps.location.lat(), 6);
    Serial.print(F(","));
    Serial.print(gps.location.lng(), 6);
  }
  else
  {
    Serial.print(F("INVALID"));
  }

  Serial.print(F("  Date/Time: "));
  if (gps.date.isValid())
  {
    Serial.print(gps.date.month());
    Serial.print(F("/"));
    Serial.print(gps.date.day());
    Serial.print(F("/"));
    Serial.print(gps.date.year());
  }
  else
  {
    Serial.print(F("INVALID"));
  }

  Serial.print(F(" "));
  if (gps.time.isValid())
  {
    if (gps.time.hour() < 10) Serial.print(F("0"));
    Serial.print(gps.time.hour());
    Serial.print(F(":"));
    if (gps.time.minute() < 10) Serial.print(F("0"));
    Serial.print(gps.time.minute());
    Serial.print(F(":"));
    if (gps.time.second() < 10) Serial.print(F("0"));
    Serial.print(gps.time.second());
    Serial.print(F("."));
    if (gps.time.centisecond() < 10) Serial.print(F("0"));
    Serial.print(gps.time.centisecond());
  }
  else
  {
    Serial.print(F("INVALID"));
  }

  Serial.println();
}
