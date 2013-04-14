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

  int frameNumber = mm.getQueuedFrames();

  Textlabel myTextlabelA;

  public void setup() {
    size(w, h);
    frameRate(25);
    cp5 = new ControlP5(this);

    //////////////////////new
    cp5.setColorForeground(0xffcccccc);
    cp5.setColorBackground(0xffffffff);
    cp5.setColorLabel(0xffffffff);
    cp5.setColorValue(0xff444444);
    cp5.setColorActive(0xffff0000);

    cp5.addSlider("speed").setPosition(10, 10).setSize(180, 20).setRange(-20, 20).setValue(0).plugTo(parent, "speed");
    cp5.addSlider("angle").setPosition(10, 60).setSize(180, 20).setRange(-640, 640).setValue(85).setLabel("slant").plugTo(parent, "angle");
    cp5.addSlider("thickness").setPosition(10, 110).setSize(180, 20).setRange(15, 640).setValue(100).plugTo(parent, "thickness");
    cp5.addSlider("duration").setPosition(10, 160).setSize(180, 20).setRange(20, 80).setValue(80).setLabel("movie length").plugTo(parent, "duration");
    cp5.addToggle("showTargets").setPosition(10, 210).setSize(50, 20).setLabel("Hide Drop Targets").plugTo(parent, "showTargets");

    cp5.getController("speed").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("angle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("duration").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("thickness").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  }

  public void draw() {
    background(0);
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

