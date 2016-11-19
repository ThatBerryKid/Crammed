//Should be adapatable for the landscape mode
class Ground {
  float xPoint;
  float yLine;
  float rectLength;
  float rectHeight;
  float xpos;
  float xposLimit;

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
    rect(xPoint, yLine+30, rectLength, rectHeight);
  }
  void displayOnMenu(float tXpos) {
    xpos  = menbar.menuX+menbar.menuWidth;
    xposLimit = tXpos;
    noStroke();
    fill(85,255,17);
    rect(xpos, yLine, rectLength, rectHeight);
    fill(255,188,94);
    rect(xpos,yLine+30, rectLength, rectHeight);
  }
}