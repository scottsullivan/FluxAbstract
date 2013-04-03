import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import gifAnimation.*; 
import processing.opengl.*; 
import controlP5.*; 
import sojamo.drop.*; 

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



GifMaker gifExport;


ControlP5 controlP5;


SDrop dropOne;

float thickness, speed, angle, topRight, topLeft, bottomRight, bottomLeft, speeder;
PImage imgOne, imgTwo, logo;
boolean recordCheck;

float spdMap = map(speed, 0, 100, 0, .0001f);

DropListenerOne dropTargetOne;

public void setup() {
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

public void draw() {
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

public void record() {
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

public void export() {
  gifExport.finish();
  exit();
}

public void setupGUI() {
  dropOne = new SDrop(this);
  dropTargetOne = new DropListenerOne(49, 15, 86, 48);
  dropOne.addDropListener(dropTargetOne);

  controlP5 = new ControlP5(this);
  PFont GUIfont = createFont("arial", 12);
  controlP5.setControlFont(GUIfont);

  controlP5.setColorForeground(0xffcccccc);
  controlP5.setColorBackground(0xffffffff);
  controlP5.setColorLabel(0xffff0000);
  controlP5.setColorValue(0xff444444);
  controlP5.setColorActive(0xffff0000);


  controlP5.addButton("export", 50, width - 150, 745, 100, 20).setLabel("Export .gif");
  controlP5.addButton("record", 50, width - 250, 745, 100, 20).setLabel("record");

  controlP5.addSlider("speed").setPosition(450, 745).setSize(150, 20).setRange(-50, 50).setValue(2);
  controlP5.addSlider("angle").setPosition(650, 745).setSize(150, 20).setRange(-width/2, width/2).setValue(85).setLabel("slant");
  controlP5.addSlider("thickness").setPosition(850, 745).setSize(150, 20).setRange(15, width/2).setValue(100);

  controlP5.getController("speed").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  controlP5.getController("angle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  controlP5.getController("thickness").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
}

public void drawGUI() {
  drawGUIBackground();

  //drag and drop targets
  textureMode(NORMAL);
  textureWrap(REPEAT); 
  beginShape();
  texture(imgOne);
  vertex(149, 735, 0, 0);
  vertex(235, 735, 1, 0);
  vertex(235, 783, 1, 1);
  vertex(149, 783, 0, 1);
  endShape(CLOSE);

  //drag and drop targets
  textureMode(NORMAL);
  textureWrap(REPEAT); 
  beginShape();
  texture(imgTwo);
  vertex(249, 735, 0, 0);
  vertex(335, 735, 1, 0);
  vertex(335, 783, 1, 1);
  vertex(249, 783, 0, 1);
  endShape(CLOSE);
}

public void drawGUIBackground() {
  fill(0);
  rect(0, 720, width, 80);
  image(logo, 50, 735);
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
  vertex(bottomRight, height - 80, brMap + speeder, 1);
  vertex(bottomLeft, height - 80, blMap + speeder, 1);
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
  vertex(bottomRight, height - 80, brMap + speeder, 1);
  vertex(bottomLeft, height - 80, blMap + speeder, 1);
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
