//fastco

import codeanticode.gsvideo.*;
GSMovieMaker mm;


import controlP5.*;
ControlP5 controlP5;

import sojamo.drop.*;
SDrop dropOne;

float topRight, topLeft, bottomRight, bottomLeft, speeder;
float thickness = 100;
float speed = 2;
float angle = 85;

PImage imgOne, imgTwo, logo;

float spdMap = map(speed, 0, 100, 0, .0001);
boolean showTargets = true;

int fps = 30;

DropListenerOne dropTargetOne;

import java.awt.Frame;
import java.awt.BorderLayout;
import controlP5.*;

private ControlP5 cp5;

ControlFrame cf;

int def;

void setup() {
  size(1280, 720, P2D);
  background(255);
  smooth();
  noStroke();
  frameRate(fps);

  logo = loadImage("fastcodesignlogo.png");
  imgOne = loadImage("emptypic1.jpg");
  imgTwo = loadImage("emptypic2.jpg");

  mm = new GSMovieMaker(this, width, height, "drawing.ogg", GSMovieMaker.THEORA, GSMovieMaker.MEDIUM, fps);
  mm.setQueueSize(0, 10);

  setupGUI();
  mm.start();
  cp5 = new ControlP5(this);
  cf = addControlFrame("extra", 200, 720);
}

void draw() {
  background(255);

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

  if (showTargets==true) {
    drawGUIBackground();
    drawGUI();
    dropTargetOne.draw(149, 735, 186, 48);
  }
}

void record() {
  String s = "Frame " + frameCount;

  for (int i = 1; i < 8000; i++) {
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
    loadPixels();
    mm.addFrame(pixels);
    println("Number of queued frames : " + mm.getQueuedFrames());
    println("Number of dropped frames: " + mm.getDroppedFrames());
  }
}

void export() {
  mm.finish();
  exit();
}

