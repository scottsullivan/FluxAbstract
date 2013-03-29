//fastco

import controlP5.*;
ControlP5 controlP5;

float thickness, speed, angle, topRight, topLeft, bottomRight, bottomLeft = 0;

void setup() {
  size(1280, 800, P2D);
  background(255);
  smooth();
  noStroke();

  setupGUI();
}

void draw() {
  background(255);
  float topRight = thickness + angle;
  float topLeft = topRight - thickness;
  float bottomLeft = 0;
  float bottomRight = bottomLeft + thickness;
  PImage imgOne = loadImage("solar.jpg");
  drawGUI();

  textureMode(IMAGE);
  textureWrap(REPEAT);
  beginShape();
  texture(imgOne);
  vertex(topLeft, 80, topLeft, 80);
  vertex(topRight, 80, topRight, 80);
  vertex(bottomRight, height, bottomRight, height);
  vertex(bottomLeft, height, bottomLeft, height);
  endShape(CLOSE);
}

