class GamePiece {
  color gamepCol; //color will match user
  int gamepWidth = width/2+3; //width
  int gamepHeight = height-130; //...height
  float momentum = 1;
  float gampxLim = width/2-2.5;
  float gampx;
  long time;
  long zero=10000;
  
  
  GamePiece(float tGamp) {
  gampx = tGamp;
  }
  void display() {
    gamepCol = user.c;
    
      fill(gamepCol); 
      noStroke();
      rect(gampx, 0, gamepWidth, gamepHeight);
      noStroke();
      fill(0);
      rect(gampx+gamepWidth-5, 0, 5, gamepHeight);
      
    
  }
  
  void action() {
    gampx = gampx + momentum;
    if(gampx+gamepWidth >= gampxLim){
      gampx = gampxLim-gamepWidth;
    }
    
  }
  
  void controller(){
  
    time = millis();
    
    if (gampx == gampxLim-gamepWidth && time-zero >=8000){
    gampx=-width/2-10;
    zero=time-2000;
    }
  
  }
}