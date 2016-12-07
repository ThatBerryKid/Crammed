class Menubar {
  //I'm gonna make the menubar bounce to the right like the user does
  float menuX;
  float menuY;
  float gravPull= 0.65; //force pulling to the right
  float speed =.5;
  float menuWidth = width/1.7+10;
  float menuHeight = height;
  float btnX, btnY;
  float btn2x, btn3x;
  float cusBtnX;

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
    
    //check if portrait mode
    if(screenWidth == 300 && screenHeight == 533){
    user = new User(objCol, width-width/5, height/2-60, 80, 0.65, 1.5);
    
    fill(34, 141, 204);
    rect(menuX, menuY, menuWidth, height);    

    image(title, menuX+15, height/12.5, 160, 65);

    //buttons
    stroke(155, 186, 204);
    strokeWeight(2);
    textSize(17);
    textAlign(LEFT);
    btn2x =menuX+25;
    btn3x =menuX+105;

    fill(24, 101, 145);
    rect(btn2x, height/2-135, 60, 60);
    image(shop, btn2x, height/2-135);
    fill(user.c);
    text("SOON", btn2x+5, height/2-95);

    fill(24, 101, 145);
    rect(btn3x, height/2-135, 60, 60);
    image(sound, btn3x, height/2-135);
    fill(user.c);
    text("SOON", btn3x+5, height/2-95);
    //buttons


    //orientations
    stroke(155, 186, 204);
    strokeWeight(2);

    fill(155, 186, 204);
    rect(btn2x, height/2-50, 60, 60);
    image(portrait, btn2x, height/2-50);
    
    
    //hover
    if (mouseX>btn3x && mouseX<btn3x+60 &&mouseY>height/2-50 && mouseY<height/2+10) {
    fill(155, 186, 204);
    }else{
      fill(24,101,145);
    }
    rect(btn3x, height/2-50, 60, 60);
    image(landscape, btn3x, height/2-50);
    
        //made into clickable
    if (mousePressed && mouseX>btn3x && mouseX<btn3x+60 &&mouseY>height/2-50 && mouseY<height/2+10) {
   ground.rectLength=400;
    
    screenWidth = 533; 
    screenHeight = 300;
    delay(300);
    }
      //made into clickable
    //orientations

    //link to customize
    cusBtnX =btn2x;
    fill(user.c);
              //made into clickable
                      if (mouseX>cusBtnX && mouseX<cusBtnX+140 &&mouseY>height/2+35 && mouseY<height/2+175) {
                        rect(cusBtnX, height/2+35, 140, 140);
                        image(customize2, cusBtnX+.7, height/2+35.7);
                      }else{
                      rect(cusBtnX, height/2+35, 140, 140);
                      image(customize, cusBtnX+.7, height/2+35.7);
                      }
                      if (mousePressed && mouseX>cusBtnX && mouseX<cusBtnX+140 &&mouseY>height/2+35 && mouseY<height/2+175) {
                      menu  = 2; //second menu
                      menu2 = 1; // second layer menu
                      }
              //made to clickable
    //link to customize



    //button for exit
    btnX =menuX+menuWidth;
    btnY =height/9.5;
    fill(34, 141, 204);
    strokeWeight(12);
    stroke(34, 141, 204);
    strokeJoin(ROUND);
    rect(btnX, btnY, 60, 40);
    fill(255);
    textSize(25);
    text("'E'", btnX+20, btnY+30);
    
    //jw.berry
    fill(user.c);
    noStroke();
    rect(btn3x-30, height-60, 100, 42);
    image(jwb, btn3x-30, height-60);
    //jw.berry
    }//portrait
    
    //check if landscape mode /////////////////////////////////////////
    if(screenWidth == 533 && screenHeight == 300)
    {
    user = new User(objCol, width-width/5.5, height/6, 60, 0.65, 1.5);
    fill(34, 141, 204);
    rect(0, 0, width/2+width/8, height); 
    
    image(title, width/4-45, height/12.5, 160, 65);

    //buttons
    stroke(155, 186, 204);
    strokeWeight(2);
    textSize(17);
    textAlign(LEFT);
    btn2x =width/27;
    btn3x =width/27+75;

    fill(24, 101, 145);
    rect(btn2x, height/2-50, 60, 60);
    image(shop, btn2x, height/2-50);
    fill(user.c);
    text("SOON", btn2x+5, height/2-10);

    fill(24, 101, 145);
    rect(btn3x, height/2-50, 60, 60);
    image(sound, btn3x, height/2-50);
    fill(user.c);
    text("SOON", btn3x+5, height/2-10);
    //buttons


    //orientations
    stroke(155, 186, 204);
    strokeWeight(2);

    //hover
    if (mouseX>btn2x+150 && mouseX<btn2x+210 &&mouseY>height/2-50 && mouseY<height/2+10) {
    fill(155, 186, 204);
    }else{
      fill(24,101,145);
    }
    rect(btn2x+150, height/2-50, 60, 60);
    image(portrait, btn2x+150, height/2-50);
    //made into clickable
    if (mousePressed && mouseX>btn2x+150 && mouseX<btn2x+210 &&mouseY>height/2-50 && mouseY<height/2+10) {
    menuX=-9;
    screenWidth = 300; 
    screenHeight = 533;
    delay(300);    
    }
      //made into clickable
    fill(155, 186, 204);
    rect(btn3x+150, height/2-50, 60, 60);
    image(landscape, btn3x+150, height/2-50);
    //orientations
    
    //link to customize
    cusBtnX =btn2x;
    fill(user.c);
              //made into clickable
                      if (mouseX>cusBtnX && mouseX<cusBtnX+100 &&mouseY>height/2+35 && mouseY<height/2+135) {
                        rect(cusBtnX, height/2+35, 100, 100);
                        image(customize2, cusBtnX+.7, height/2+35.7,100,100);
                      }else{
                      rect(cusBtnX, height/2+35,100,100);
                      image(customize, cusBtnX+.7, height/2+35.7,100,100);
                      }
                      if (mousePressed && mouseX>cusBtnX && mouseX<cusBtnX+100 &&mouseY>height/2+35 && mouseY<height/2+135) {
                      menu  = 2; //second menu
                      menu2 = 1; // second layer menu
                      }
              //made to clickable
    //link to customize
    
      //button for exit
    btnX =width/2+width/8;
    btnY =height/9.5;
    fill(34, 141, 204);
    strokeWeight(12);
    stroke(34, 141, 204);
    strokeJoin(ROUND);
    rect(btnX, btnY, 60, 40);
    fill(255);
    textSize(25);
    text("'E'", btnX+20, btnY+30);
    
    //jw.berry
    fill(user.c);
    noStroke();
    rect(btn3x+127, height-60, 100, 42);
    image(jwb, btn3x+127, height-60);
    //jw.berry
    }//landscape
  }
  
  void exitBtn(){
 //button for exit
    btnX =width-70;
    btnY =height/25;
    fill(34, 141, 204);
    strokeWeight(12);
    stroke(34, 141, 204);
    strokeJoin(ROUND);
    rect(btnX, btnY, 60, 40);
    fill(255);
    textSize(25);
    text("'E'", btnX+20, btnY+30);
  }
  void backBtn(){
   fill(34, 141, 204);
    strokeWeight(12);
    stroke(34, 141, 204);
    strokeJoin(ROUND);
    rect(10, height/25, 60, 40);
    fill(255);
    textSize(25);
    text("'M'", 20, height/25+30); 
  }
}