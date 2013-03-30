void renderOne(int offset, PImage img) {
  noStroke();
  float topRight = (thickness * offset) + angle + thickness;
  float topLeft = topRight - thickness;
  float bottomLeft = thickness * offset - angle;
  float bottomRight = bottomLeft + thickness;

  float trMap = map(topRight, 0, 1280, 0, 1);
  float tlMap = map(topLeft, 0, 1280, 0, 1);
  float blMap = map(bottomLeft, 0, 1280, 0, 1);
  float brMap = map(bottomRight, 0, 1280, 0, 1);
  float spdMap = map(speed, 0, 100, 0, .0001);


  textureMode(NORMAL);
  textureWrap(REPEAT); 

  beginShape();
  texture(img);
  vertex(topLeft, 80, tlMap + speeder, 0);
  vertex(topRight, 80, trMap + speeder, 0);
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

void renderTwo(int offset, PImage img) {
  float topRight = (thickness * offset) + angle + (2 * thickness);
  float topLeft = topRight - thickness;
  float bottomLeft = thickness * offset - angle + thickness;
  float bottomRight = bottomLeft + thickness;

  float trMap = map(topRight, 0, 1280, 0, 1);
  float tlMap = map(topLeft, 0, 1280, 0, 1);
  float blMap = map(bottomLeft, 0, 1280, 0, 1);
  float brMap = map(bottomRight, 0, 1280, 0, 1);
  float spdMap = map(speed, 0, 100, 0, .0001);

  textureMode(NORMAL);
  textureWrap(REPEAT);

  beginShape();
  texture(img);
  vertex(topLeft, 80, tlMap + speeder, 0);
  vertex(topRight, 80, trMap + speeder, 0);
  vertex(bottomRight, height, brMap + speeder, 1);
  vertex(bottomLeft, height, blMap + speeder, 1);
  endShape(CLOSE);
}

