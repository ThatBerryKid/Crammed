//Should be adapatable for the landsccape mode
class Ground {
  float xPoint;
  float yLine;
  float rectLength;
  float rectHeight;

  Ground (float tXpoint, float tYline, float tRectLength, float tRectHeight) {
    xPoint  = tXpoint;
    yLine   = tYline;
    rectLength = tRectLength;
    rectHeight = tRectHeight;
  }

  void display() {
    fill(85, 255, 17);
    rect(xPoint, yLine, rectLength, rectHeight);
    fill(255, 188, 94);
    rect(xPoint, yLine+20, rectLength, rectHeight);
  }
}