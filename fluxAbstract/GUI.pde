void setupGUI() {
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

void drawGUI() {
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

void drawGUIBackground() {
  fill(0);
  rect(0, 640, 400, 80);
  image(logo, 50, 655);
}


void dropEvent(DropEvent theDropEvent) {
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
    myColor = color(#FFFFFF);
    // set a target rect for drop event.
    setTargetRect(boxX, boxY, boxWidth, boxHeight);
  }

  void draw(int boxX, int boxY, int boxWidth, int boxHeight) {
    noFill();
    stroke(myColor);
    rect(149, 735, 86, 48);
    rect(249, 735, 86, 48);
  }

  void dropEnter() {
    myColor = color(#FF0000);
  }

  void dropLeave() {
    myColor = color(255);
  }

  void dropEvent(DropEvent DropEventOne) {
    println("Dropped");
  }
}

