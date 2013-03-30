void setupGUI() {
  drop = new SDrop(this);
  dropTarget = new MyDropListener();
  drop.addDropListener(dropTarget);

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

  int myColor;

  MyDropListener() {
    myColor = color(#FFFFFF);
    // set a target rect for drop event.
    setTargetRect(49, 15, 86, 48);
  }

  void draw() {
    noFill();
    stroke(myColor);
    rect(49, 15, 86, 48);

    textureMode(NORMAL);
    textureWrap(REPEAT); 

    beginShape();
    texture(imgOne);
    vertex(49, 15, 0, 0);
    vertex(135, 15, 1, 0);
    vertex(135, 63, 1, 1);
    vertex(49, 63, 0, 1);
    endShape(CLOSE);
  }

  // if a dragged object enters the target area.
  // dropEnter is called.
  void dropEnter() {
    myColor = color(#FF0000);
  }

  // if a dragged object leaves the target area.
  // dropLeave is called.
  void dropLeave() {
    myColor = color(255);
  }

  void dropEvent(DropEvent theEvent) {
    println("Dropped on MyDropListener");
  }
}
