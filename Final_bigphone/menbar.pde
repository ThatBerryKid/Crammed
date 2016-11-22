class Menubar {
  //I'm gonna make the menubar bounce to the right like the user does
  float menuX;
  float menuY;
  float gravPull= 0.65; //force pulling to the right
  float speed =.5;
  float menuWidth = width/1.7+10;
  float menuHeight = height;

  Menubar (float tMenux, float tMenuy) { 
    menuX = tMenux;
    menuY = tMenuy;
  }
  void elastic() {
    menuX = menuX + speed;
    speed = speed + gravPull;
  }
  void bounceBack() {
    if ((speed < 0.65) && ( menuX+menuWidth > ground.xposLimit)) {
      speed = 0;
      gravPull = 0;
    } else if ( menuX+menuWidth >ground.xposLimit) {
      speed = speed * -.754; //BOUNCINESS Closer to -1.0 constant bouncing, 0 is no bounce.
    }
  }
  void display() 
  {
    fill(34, 141, 204);
    rect(menuX, menuY, menuWidth, height);    

    //menu button on Menu
    fill(34, 141, 204);
    strokeWeight(12);
    stroke(34, 141, 204);
    strokeJoin(ROUND);
    rect(menuX+menuWidth, height/9.5, 60, 40);
    fill(255);
    textSize(25);
    text("'E'", menuX+menuWidth+20, height/9.5+30);
    //menu button on Menu  }
  }
}