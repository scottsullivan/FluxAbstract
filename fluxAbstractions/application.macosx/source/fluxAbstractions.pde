//fastco

import controlP5.*;
ControlP5 controlP5;

float thickness, speed, angle, topRight, topLeft, bottomRight, bottomLeft = 0;
PImage imgOne, imgTwo;
void setup() {
  size(1280, 800, P2D);
  background(255);
  smooth();
  noStroke();
  imgOne = loadImage("solar.jpg");
  imgTwo = loadImage("mike.jpg");

  setupGUI();
}

void draw() {
  background(255);


  drawGUI();

  for (int i = -50; i < 150; i = i + 2) { 
    renderOne(i, imgOne);
    renderTwo(i, imgTwo);
  }
}

