//fastco

//import gifAnimation.*;
//import processing.opengl.*;
//GifMaker gifExport;

import controlP5.*;
ControlP5 controlP5;

import sojamo.drop.*;
SDrop dropOne;

float thickness, speed, angle, topRight, topLeft, bottomRight, bottomLeft, speeder;
PImage imgOne, imgTwo;

DropListenerOne dropTargetOne;

void setup() {
  size(1280, 800, P2D);
  background(255);
  smooth();
  noStroke();
  imgOne = loadImage("emptypic.jpg");
  imgTwo = loadImage("emptypic.jpg");
  setupGUI();

//  gifExport = new GifMaker(this, "export.gif");
//  gifExport.setRepeat(0); // make it an "endless" animation
}

void draw() {
  background(255);
  drawGUI();

  dropTargetOne.draw(49, 15, 186, 48);
  if (imgOne !=null) {
  }

  for (int i = -50; i < 150; i = i + 2) {
    renderOne(i, imgOne);
    renderTwo(i, imgTwo);
  }
}


//void record() {
//  gifExport.setDelay(1);
//  gifExport.addFrame();
//}
//
//void export() {
//  gifExport.finish();
//}

