void renderOne(int offset, PImage img) {
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

void renderTwo(int offset, PImage img) {
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

