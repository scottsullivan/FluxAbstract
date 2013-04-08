//fastco

import codeanticode.gsvideo.*;
GSMovieMaker mm;


import controlP5.*;
ControlP5 controlP5;

import sojamo.drop.*;
SDrop dropOne;

float thickness, speed, angle, topRight, topLeft, bottomRight, bottomLeft, speeder;
PImage imgOne, imgTwo, logo;

float spdMap = map(speed, 0, 100, 0, .0001);
boolean visible = true;

int fps = 30;

DropListenerOne dropTargetOne;

import java.awt.Frame;
import java.awt.BorderLayout;
import controlP5.*;

private ControlP5 cp5;

ControlFrame cf;

int def;

void setup() {
  size(1280, 800, P2D);
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

  // by calling function addControlFrame() a
  // new frame is created and an instance of class
  // ControlFrame is instanziated.
  cf = addControlFrame("extra", 200, 200);

  // add Controllers to the 'extra' Frame inside 
  // the ControlFrame class setup() method below.
}

void draw() {
  background(255);
  if (visible) {
    drawGUI();
  }

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
  visible = false;
  String s = "Frame " + frameCount;

  for (int i = 1; i < 500; i++) {
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

