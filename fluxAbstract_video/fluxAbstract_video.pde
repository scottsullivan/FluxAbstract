//fastco

import controlP5.*;
ControlP5 controlP5;

import sojamo.drop.*;
SDrop dropOne;

import unlekker.moviemaker.*;
UMovieMaker mm;

float thickness, speed, angle, topRight, topLeft, bottomRight, bottomLeft, speeder;
PImage imgOne, imgTwo, logo;

float spdMap = map(speed, 0, 100, 0, .0001);

DropListenerOne dropTargetOne;

void setup() {
  size(1280, 720, P2D);
  background(255);
  smooth();
  noStroke();
  frameRate(30);
  imgOne = loadImage("img1.jpg");
  imgTwo = loadImage("img2.jpg");
  logo = loadImage("fastcodesignlogo.png");

  setupGUI();

  mm = new UMovieMaker(this, sketchPath(month() + "_" + day() + "_" + year() + "-" + hour() + "_" + minute() + "_" + second() +".mov"), width, 720, 30);
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

//void record() {

void keyPressed() {
  if (key == 'r') {
    for (int i = 1; i < 2500; i++) {
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
      mm.addFrame();
    }
  }
  if (key == 'x') {
    mm.finish();
    exit();
  }
}

void export() {
  mm.finish();
  exit();
}

