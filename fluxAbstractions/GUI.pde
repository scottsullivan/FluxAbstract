void setupGUI() {
  drop = new SDrop(this);
  dropTarget = new MyDropListener(49, 15, 86, 48);
  drop.addDropListener(dropTarget);

  dropTwo = new SDrop(this);
  dropTargetTwo = new MyDropListener(149, 15, 86, 48);
  dropTwo.addDropListener(dropTargetTwo);

  controlP5 = new ControlP5(this);
  PFont GUIfont = createFont("arial", 12);
  controlP5.setControlFont(GUIfont);
  //buttonstuff ("function it fires", ?, XPOS, YPOS, Width, Height).setLabel("LABEL"); 
  controlP5.addButton("item1", 50, width - 150, 25, 100, 20).setLabel("Export .gif");

  controlP5.addSlider("speed").setPosition(450, 25).setSize(150, 20).setRange(-50, 50).setValue(2);
  controlP5.addSlider("angle").setPosition(650, 25).setSize(150, 20).setRange(-width/2, width/2).setValue(85).setLabel("slant");
  controlP5.addSlider("thickness").setPosition(850, 25).setSize(150, 20).setRange(15, width/2).setValue(100);

  controlP5.getController("speed").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  controlP5.getController("angle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  controlP5.getController("thickness").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
}

void drawGUI() {
  drawGUIBackground();

  //drag and drop targets
  textureMode(NORMAL);
  textureWrap(REPEAT); 
  beginShape();
  texture(imgOne);
  vertex(49, 15, 0, 0);
  vertex(135, 15, 1, 0);
  vertex(135, 63, 1, 1);
  vertex(49, 63, 0, 1);
  endShape(CLOSE);

  //drag and drop targets
  textureMode(NORMAL);
  textureWrap(REPEAT); 
  beginShape();
  texture(imgTwo);
  vertex(149, 15, 0, 0);
  vertex(235, 15, 1, 0);
  vertex(235, 63, 1, 1);
  vertex(149, 63, 0, 1);
  endShape(CLOSE);
}

void drawGUIBackground() {
  fill(0);
  rect(0, 0, width, 80);
}


void dropEvent(DropEvent theDropEvent) {
  if (theDropEvent.isImage()) {
      imgOne = theDropEvent.loadImage();
    }
}

  class MyDropListener extends DropListener {

    int boxX, boxY, boxWidth, boxHeight, myColor;

    MyDropListener(int boxX, int boxY, int boxWidth, int boxHeight) {
      myColor = color(#FFFFFF);
      // set a target rect for drop event.
      setTargetRect(boxX, boxY, boxWidth, boxHeight);
    }

    void draw(int boxX, int boxY, int boxWidth, int boxHeight) {
      noFill();
      stroke(myColor);
      rect(boxX, boxY, boxWidth, boxHeight);
    }

    void dropEnter() {
      myColor = color(#FF0000);
    }

    void dropLeave() {
      myColor = color(255);
    }

    void dropEvent(DropEvent theEvent) {
      println("Dropped on MyDropListener");
    }
  }

