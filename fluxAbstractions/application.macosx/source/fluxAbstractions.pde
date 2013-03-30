//fastco

import controlP5.*;
ControlP5 controlP5;

import sojamo.drop.*;
SDrop drop;
SDrop dropTwo;

float thickness, speed, angle, topRight, topLeft, bottomRight, bottomLeft, speeder;
PImage imgOne, imgTwo;

MyDropListener dropTarget;
MyDropListener dropTargetTwo;

void setup() {
  size(1280, 800, P2D);
  background(255);
  smooth();
  noStroke();
  imgOne = loadImage("emptypic.jpg");
  imgTwo = loadImage("emptypic.jpg");
  setupGUI();
}

void draw() {
  background(255);
  drawGUI();

  dropTarget.draw(49, 15, 86, 48);
  if (imgOne !=null) {
  }

  dropTargetTwo.draw(149, 15, 86, 48);
  if (imgTwo !=null) {
  }

  for (int i = -50; i < 150; i = i + 2) {
    renderOne(i, imgOne);
    renderTwo(i, imgTwo);
  }
}

