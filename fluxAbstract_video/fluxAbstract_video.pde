//fastco

import gifAnimation.*;
import processing.opengl.*;
GifMaker gifExport;

import controlP5.*;
ControlP5 controlP5;

import sojamo.drop.*;
SDrop dropOne;

float thickness, speed, angle, topRight, topLeft, bottomRight, bottomLeft, speeder;
PImage imgOne, imgTwo, logo;
boolean recordCheck;

float spdMap = map(speed, 0, 100, 0, .0001);

DropListenerOne dropTargetOne;

void setup() {
  size(1280, 800, P2D);
  background(255);
  smooth();
  noStroke();

  imgOne = loadImage("emptypic1.jpg");
  imgTwo = loadImage("emptypic2.jpg");
  logo = loadImage("fastcodesignlogo.png");

  setupGUI();

  gifExport = new GifMaker(this, month() + "_" + day() + "_" + year() + "-" + hour() + "_" + minute() + "_" + second() + ".gif", 10);
  gifExport.setSize(1280, 720);
}

void draw() {
  background(255);
  drawGUI();

  dropTargetOne.draw(149, 735, 186, 48);
  if (imgOne !=null) {
  }

  for (int i = -50; i < 150; i = i + 2) {
    renderOne(i, imgOne);
    renderTwo(i, imgTwo);
    if (speeder < 1) {
      speeder = speeder + spdMap;
    } 
    else {
      speeder = 0;
    }
  }
}

void record() {
  for (int i = 1; i < 30; i++) {
    gifExport.setRepeat(0);
    gifExport.setDelay(1);
    for (int c = -50; c < 150; c = c + 2) {
      renderOne(c, imgOne);
      renderTwo(c, imgTwo);
      if (speeder < 1) {
        speeder = speeder + spdMap;
      } 
      else {
        speeder = 0;
      }
    }
    gifExport.addFrame();
  }
}

void export() {
  gifExport.finish();
  exit();
}

