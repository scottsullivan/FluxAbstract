ControlFrame addControlFrame(String theName, int theWidth, int theHeight) {
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

