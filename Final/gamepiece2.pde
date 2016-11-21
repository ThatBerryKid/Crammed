class GamePiece2 {
  color gamepCol; //color will match user
  int gamepWidth = width/2+3; //width
  int gamepHeight = height-130; //...height
  float momentum = 1;
  float gampxLim = width/2-2.5;
  float gampx;
  long time;
  long zero=10000;
  
  
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
  
  void action() {
   gampx = gampx - momentum;
    if(gampx <= gampxLim){
      gampx = gampxLim;
    }
  }
  void controller(){
    time = millis();
    
    if (gampx == gampxLim && time-zero >=8000){
    gampx=width;
    zero=time-2000;
    } 
  }
}