import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import codeanticode.gsvideo.*; 
import controlP5.*; 
import sojamo.drop.*; 
import java.awt.Frame; 
import java.awt.BorderLayout; 
import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class fluxAbstract extends PApplet {

//fastco


GSMovieMaker mm;



ControlP5 controlP5;


SDrop dropOne;

float topRight, topLeft, bottomRight, bottomLeft, speeder;
float thickness = 100;
float speed = 2;
float angle = 85;

PImage imgOne, imgTwo, logo;

float spdMap = map(speed, 0, 100, 0, .0001f);
boolean showTargets = true;

int fps = 30;

DropListenerOne dropTargetOne;





private ControlP5 cp5;

ControlFrame cf;

int def;

public void setup() {
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

public void draw() {
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

public void record() {
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

public void export() {
  mm.finish();
  exit();
}

public void setupGUI() {
  dropOne = new SDrop(this);
  dropTargetOne = new DropListenerOne(49, 15, 86, 48);
  dropOne.addDropListener(dropTargetOne);

  controlP5 = new ControlP5(this);

  controlP5.setColorForeground(0xffcccccc);
  controlP5.setColorBackground(0xff444444);
  controlP5.setColorLabel(0xffff0000);
  controlP5.setColorValue(0xffffffff);
  controlP5.setColorActive(0xffff0000);


  controlP5.addButton("export", 50, width - 150, 665, 100, 20).setLabel("Export movie");
  controlP5.addButton("record", 50, width - 250, 665, 100, 20).setLabel("record");
}

public void drawGUI() {
  //drag and drop targets
  textureMode(NORMAL);
  textureWrap(REPEAT); 
  beginShape();
  texture(imgOne);
  vertex(149, 655, 0, 0);
  vertex(235, 655, 1, 0);
  vertex(235, 703, 1, 1);
  vertex(149, 703, 0, 1);
  endShape(CLOSE);

  //drag and drop targets
  textureMode(NORMAL);
  textureWrap(REPEAT); 
  beginShape();
  texture(imgTwo);
  vertex(249, 655, 0, 0);
  vertex(335, 655, 1, 0);
  vertex(335, 703, 1, 1);
  vertex(249, 703, 0, 1);
  endShape(CLOSE);
}

public void drawGUIBackground() {
  fill(0);
  rect(0, 640, 400, 80);
  image(logo, 50, 655);
}


public void dropEvent(DropEvent theDropEvent) {
  if (theDropEvent.isImage()) {
    if (theDropEvent.x() < 249) {
      imgOne = theDropEvent.loadImage();
    }
    else {
      imgTwo = theDropEvent.loadImage();
    }
  }
}

class DropListenerOne extends DropListener {

  int boxX, boxY, boxWidth, boxHeight, myColor;

  DropListenerOne(int boxX, int boxY, int boxWidth, int boxHeight) {
    myColor = color(0xffFFFFFF);
    // set a target rect for drop event.
    setTargetRect(boxX, boxY, boxWidth, boxHeight);
  }

  public void draw(int boxX, int boxY, int boxWidth, int boxHeight) {
    noFill();
    stroke(myColor);
    rect(149, 735, 86, 48);
    rect(249, 735, 86, 48);
  }

  public void dropEnter() {
    myColor = color(0xffFF0000);
  }

  public void dropLeave() {
    myColor = color(255);
  }

  public void dropEvent(DropEvent DropEventOne) {
    println("Dropped");
  }
}

public ControlFrame addControlFrame(String theName, int theWidth, int theHeight) {
  Frame f = new Frame(theName);
  ControlFrame p = new ControlFrame(this, theWidth, theHeight);
  f.add(p);
  p.init();
  f.setTitle(theName);
  f.setSize(p.w, p.h);
  f.setLocation(100, 100);
  f.setResizable(false);
  f.setVisible(true);
  return p;
}


// the ControlFrame class extends PApplet, so we 
// are creating a new processing applet inside a
// new frame with a controlP5 object loaded
public class ControlFrame extends PApplet {

  int w, h;

  int abc = 100;

  public void setup() {
    size(w, h);
    frameRate(25);
    cp5 = new ControlP5(this);

    //////////////////////new
    cp5.setColorForeground(0xffcccccc);
    cp5.setColorBackground(0xffffffff);
    cp5.setColorLabel(0xffff0000);
    cp5.setColorValue(0xff444444);
    cp5.setColorActive(0xffff0000);

    cp5.addSlider("speed").setPosition(10, 100).setSize(150, 20).setRange(-50, 50).setValue(2).plugTo(parent, "speed");
    cp5.addSlider("angle").setPosition(10, 150).setSize(150, 20).setRange(-640, 640).setValue(85).setLabel("slant").plugTo(parent, "angle");
    cp5.addSlider("thickness").setPosition(10, 200).setSize(150, 20).setRange(15, 640).setValue(100).plugTo(parent, "thickness");
    cp5.addToggle("showTargets").setPosition(10, 10).setSize(50, 20).setLabel("Hide Drop Targets").plugTo(parent, "showTargets");

    cp5.getController("speed").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("angle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("thickness").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  }

  public void draw() {
    background(abc);
  }

  private ControlFrame() {
  }

  public ControlFrame(Object theParent, int theWidth, int theHeight) {
    parent = theParent;
    w = theWidth;
    h = theHeight;
  }


  public ControlP5 control() {
    return cp5;
  }


  ControlP5 cp5;

  Object parent;
}

public void renderOne(int offset, PImage img) {
  noStroke();
  float topRight = (thickness * offset) + angle + thickness;
  float topLeft = topRight - thickness;
  float bottomLeft = thickness * offset - angle;
  float bottomRight = bottomLeft + thickness;

  float trMap = map(topRight, 0, 1280, 0, 1);
  float tlMap = map(topLeft, 0, 1280, 0, 1);
  float blMap = map(bottomLeft, 0, 1280, 0, 1);
  float brMap = map(bottomRight, 0, 1280, 0, 1);
  float spdMap = map(speed, 0, 100, 0, .0001f);


  textureMode(NORMAL);
  textureWrap(REPEAT); 

  beginShape();
  texture(img);
  vertex(topLeft, 0, tlMap + speeder, 0);
  vertex(topRight, 0, trMap + speeder, 0);
  vertex(bottomRight, height, brMap + speeder, 1);
  vertex(bottomLeft, height, blMap + speeder, 1);
  endShape(CLOSE);

  if (speeder < 1) {
    speeder = speeder + spdMap;
  } 
  else {
    speeder = 0;
  }
}

public void renderTwo(int offset, PImage img) {
  float topRight = (thickness * offset) + angle + (2 * thickness);
  float topLeft = topRight - thickness;
  float bottomLeft = thickness * offset - angle + thickness;
  float bottomRight = bottomLeft + thickness;

  float trMap = map(topRight, 0, 1280, 0, 1);
  float tlMap = map(topLeft, 0, 1280, 0, 1);
  float blMap = map(bottomLeft, 0, 1280, 0, 1);
  float brMap = map(bottomRight, 0, 1280, 0, 1);
  float spdMap = map(speed, 0, 100, 0, .0001f);

  textureMode(NORMAL);
  textureWrap(REPEAT);

  beginShape();
  texture(img);
  vertex(topLeft, 0, tlMap + speeder, 0);
  vertex(topRight, 0, trMap + speeder, 0);
  vertex(bottomRight, height, brMap + speeder, 1);
  vertex(bottomLeft, height, blMap + speeder, 1);
  endShape(CLOSE);
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "fluxAbstract" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
