//fastco

import gifAnimation.*;
import processing.opengl.*;
GifMaker gifExport;

import controlP5.*;
ControlP5 controlP5;

import sojamo.drop.*;
SDrop dropOne;

float thickness, speed, angle, topRight, topLeft, bottomRight, bottomLeft, speeder;
PImage imgOne, imgTwo;
boolean recordCheck;

float spdMap = map(speed, 0, 100, 0, .0001);

DropListenerOne dropTargetOne;

void setup() {
  size(1280, 800, P2D);
  background(255);
  smooth();
  noStroke();
  frameRate(30);

  imgOne = loadImage("emptypic1.jpg");
  imgTwo = loadImage("emptypic2.jpg");

  setupGUI();
  
  //gifExport.setRepeat(0);
  gifExport = new GifMaker(this, "export.gif", 1);
  gifExport.setQuality(1);
  gifExport.setSize(1280, 720);
}

void draw() {
  background(255);
  drawGUI();

  dropTargetOne.draw(49, 735, 186, 48);
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
  for (int i = 1; i < 10; i++) {
    gifExport.setDelay(33);
    renderOne(i, imgOne);
    renderTwo(i, imgTwo);
    if (speeder < 1) {
      speeder = speeder + spdMap;
    } 
    else {
      speeder = 0;
    }
    gifExport.addFrame();
  }
}

void export() {
  gifExport.finish();
}

