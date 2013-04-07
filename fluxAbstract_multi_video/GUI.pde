void setupGUI() {
  dropOne = new SDrop(this);
  dropTargetOne = new DropListenerOne(49, 15, 86, 48);
  dropOne.addDropListener(dropTargetOne);

  
}

void drawGUI() {
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

void drawGUIBackground() {
  fill(0);
  rect(0, 720, width, 80);
  image(logo, 50, 735);
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

