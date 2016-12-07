//Should be adapatable for the landscape mode
class Ground {
  float xPoint;
  float yLine;
  float yLine2;
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
    
    
    //check if landscape mode
    if(screenWidth == 533 && screenHeight == 300){
    fill(85,255,17);
    rect(width/2+width/8,height/2+10,width-(width/2+width/8),height);
    }
    
  }
  void displayOnMenu(float tXpos, float tYline2) {
    xpos  = menbar.menuX+menbar.menuWidth;
    xposLimit = tXpos;
    yLine2 = tYline2;
    noStroke();
    fill(85,255,17);
    rect(xpos, yLine2, rectLength, rectHeight);
    fill(255,188,94);
    rect(xpos,yLine2+30, rectLength, rectHeight);
    

    ////check if landscape mode
    //if(screenWidth == 533 && screenHeight == 300){
    //fill(85,255,17);
    //rect(width/2+width/8,height/2+10,width-(width/2+width/8),height);
    //fill(255,188,94);
    //rect(width/2+width/8,height/2+30,width-(width/2+width/8),height);
    //}
}
//void changeGround(float tLength){
//  rectLength = tLength;
//}
}