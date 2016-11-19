class Menubar {
//I'm gonna make the menubar bounce to the right like the user does
  float menuX;
  float menuY;
  float gravPull= 0.65; //force pulling to the right
  float speed =.5;
  float menuWidth = width/1.7+10;
  float menuHeight = height;
  
  Menubar (float tMenux, float tMenuy){ 
    menuX = tMenux;
    menuY = tMenuy;
  }
  void elastic(){
    menuX = menuX + speed;
    speed = speed + gravPull; 
  }
  void bounceBack(){
   if ((speed < 0.65) && ( menuX+menuWidth > ground.xposLimit)) {
      speed = 0;
      gravPull = 0;
    } else if ( menuX+menuWidth >ground.xposLimit) {
      speed = speed * -.754; //BOUNCINESS Closer to -1.0 constant bouncing, 0 is no bounce.
    } 
  }
  void display(){
    fill(34, 141, 204);
    rect(menuX, menuY, menuWidth, height);
  }
}