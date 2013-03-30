import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class fluxAbstractions extends PApplet {

//fastco


ControlP5 controlP5;

float thickness, speed, angle, topRight, topLeft, bottomRight, bottomLeft = 0;
PImage imgOne, imgTwo;
public void setup() {
  size(1280, 800, P2D);
  background(255);
  smooth();
  noStroke();
  imgOne = loadImage("solar.jpg");
  imgTwo = loadImage("mike.jpg");

  setupGUI();
}

public void draw() {
  background(255);


  drawGUI();

  for (int i = -50; i < 150; i = i + 2) { 
    renderOne(i, imgOne);
    renderTwo(i, imgTwo);
  }
}

public void setupGUI() {
  controlP5 = new ControlP5(this);
  PFont GUIfont = createFont("arial", 12);
  controlP5.setControlFont(GUIfont);
  //buttonstuff ("function it fires", ?, XPOS, YPOS, Width, Height).setLabel("LABEL"); 
  controlP5.addButton("item1", 50, width - 150, 25, 100, 20).setLabel("Export .gif");
  controlP5.addTextfield("imgOneFileName", 50, 25, 150, 20).setLabel("image 1 file name").setAutoClear(false);
  controlP5.addTextfield("imgTwoFileName", 250, 25, 150, 20).setLabel("image 2 file name").setAutoClear(false);
  controlP5.addSlider("speed").setPosition(450, 25).setSize(150, 20).setRange(0, 200).setValue(100);
  controlP5.addSlider("angle").setPosition(650, 25).setSize(150, 20).setRange(-width/2, width/2).setValue(0);
  controlP5.addSlider("thickness").setPosition(850, 25).setSize(150, 20).setRange(15, width/2).setValue(100);
  controlP5.getController("speed").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  controlP5.getController("angle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  controlP5.getController("thickness").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
}

public void drawGUI() {
  drawGUIBackground();
}

public void drawGUIBackground() {
  fill(0);
  rect(0, 0, width, 80);
}

public void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {
    println("controlEvent: accessing a string from controller '"
      +theEvent.getName()+"': "
      +theEvent.getStringValue()
      );
  }
}


public void renderOne(int offset, PImage img) {
  float topRight = (thickness * offset) + angle + thickness;
  float topLeft = topRight - thickness;
  float bottomLeft = thickness * offset - angle;
  float bottomRight = bottomLeft + thickness;

  textureMode(IMAGE);
  textureWrap(REPEAT);


  beginShape();
  texture(img);
  vertex(topLeft, 80, topLeft, 80);
  vertex(topRight, 80, topRight, 80);
  vertex(bottomRight, height, bottomRight, height);
  vertex(bottomLeft, height, bottomLeft, height);
  endShape(CLOSE);
}

public void renderTwo(int offset, PImage img) {
  float topRight = (thickness * offset) + angle + (2 * thickness);
  float topLeft = topRight - thickness;
  float bottomLeft = thickness * offset - angle + thickness;
  float bottomRight = bottomLeft + thickness;

  textureMode(IMAGE);
  textureWrap(REPEAT);


  beginShape();
  texture(img);
  vertex(topLeft, 80, topLeft, 80);
  vertex(topRight, 80, topRight, 80);
  vertex(bottomRight, height, bottomRight, height);
  vertex(bottomLeft, height, bottomLeft, height);
  endShape(CLOSE);
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "fluxAbstractions" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
