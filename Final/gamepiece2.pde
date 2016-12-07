class GamePiece2 {
  color gamepCol; //color will match user
  int gamepWidth = width/2+3; //width
  int gamepHeight = height-130; //...height
  float gampx;
  
  
  GamePiece2(float tGamp) {
  gampx = tGamp;
  }
  void display() {
    gamepCol = user.c;
      fill(gamepCol); 
      noStroke();
      rect(gampx, 0, gamepWidth, gamepHeight);
      noStroke();
      fill(0);
      rect(gampx, 0, 5, gamepHeight);
    
  }
  
 
}