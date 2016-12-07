//James W. Berry
/*JW.Berry
 CRAMMED - Puzzle Game
 
 Timer adapted from Sarah Page's adaptation of timer
 from this example:
 https://forum.processing.org/one/topic/how-to-create-countdown-timer.html
 
 User is the bouncing object. Player is the controller User bounces on.
 
 */

import drop.*;

SDrop drop;

//Objects//
Player player;
User user;
Ground ground;
Menubar menbar;
GamePiece gamePiece1;
GamePiece2 gamePiece2;
PImage title, jwb, sound, shop, customize, customize2;
PImage portrait, landscape;
PImage userImg;

//Obj var//
color objCol;
color objColNew;
float userX;
float userY;
float gamp1;
float gamp2;
float direction1 = 1;
float direction2 = -1;
float wallSpd = 2;
float menuX;
float menuY;
//Obj var//
//Objects//

//timers//
int currentTime;
int interval=5;
//timer//


//Stages//
int menu  = 0;
int menu2 = 0;
int start = 1;
int game  = 0;
//Stages//

//Switches//
boolean grav = false;
boolean addTimeOnce = true;
boolean wallsGo = false;
boolean landscapeMode = false;
//Switches//

//Screen control//
int screenWidth         = 300;
int screenHeight        = 533;
int screenSizeIncrement = 10;
//Screen control//

void setup() {
  size(300, 533);
  userX = random(width/2-100, width/2+100);
  userY = 0;
  gamp1 = -width/2-10;
  gamp2 = width;
  objCol = color(205, 4, 0);

  //obj's//
  user = new User(objCol, userX, userY, 100, 0.65, 1.5);
  menbar = new Menubar(-200, 0);
  gamePiece1 = new GamePiece(gamp1);
  gamePiece2 = new GamePiece2(gamp2);
  player = new Player();
  drop = new SDrop(this);
  //obj's//

  title = loadImage("crammed_logo.png");
  jwb = loadImage("jwberry_game.png");
  sound = loadImage("sound.png");
  shop = loadImage("shop.png");
  customize = loadImage("customize.png");
  customize2 = loadImage("customize_hover.png");
  portrait = loadImage("phone_portrait.png");
  landscape = loadImage("phone_landscape.png");
}

class Player {
  float x;
  float y;
}
void draw() {

  if (screenWidth == 533 && screenHeight == 300)
  { 
    landscapeMode =true;
  } else if (screenWidth == 300 && screenHeight == 533) {
    landscapeMode = false;
  }

  //START STATE//
  if (menu == 0 && start == 1) {
    userX = random(width/2-100, width/2+100); //random pos for user
    ground = new Ground(0, height-130, width, 130); //needed here, to update with the size

    background(84, 186, 255);

    bouncyUser();            //calls user, gravity, and handler
    user.changeGrav(0.65);   //adjusts gravity
    ground.display();        //calls ground


    if (mouseX>ground.xPoint+70 && mouseX<ground.xPoint+220 && mouseY>ground.yLine+50 && mouseY<ground.yLine+105) {
      fill(user.c);
    } else {
      fill(20, 205, 0);
    }
    rect(ground.xPoint+70, ground.yLine+50, 150, 55);


    if (mousePressed && mouseX>ground.xPoint+70 && mouseX<ground.xPoint+220 && mouseY>ground.yLine+50 && mouseY<ground.yLine+105) {
      gamePiece1 = new GamePiece(gamp1);
      gamePiece2 = new GamePiece2(gamp2);
      start = 0;
      game  = 1;
    }
    image(title, width/2-100, height/15, /*AlternateWidth*//*231*/ (width>>1)+45, 79);

    //menu button on Start
    fill(34, 141, 204);
    strokeWeight(12);
    stroke(34, 141, 204);
    strokeJoin(ROUND);
    rect(-30, height/9.5, 60, 40);
    fill(255);
    textSize(25);
    text("'M'", 0, height/9.5+30);
    //button press
    if (mousePressed && mouseX > 0 && mouseX<30 && mouseY>height/9.5 && mouseY<height/9.5+40) {
      user = new User(objCol, width-width/5, height/2-60, 80, 0.65, 1.5);
      menu =1;
      start =0;
    }
    //button press
    //menu button on Start
  }
  //START STATE //


  // MENU STATE ///////////////////////////////////////////////////////////////////////////////////////
  if (menu == 1 && start == 0) 
  {
    noStroke();
    background(84, 186, 255);

    //displayed items//
    //depends on orientation
    if (landscapeMode!=true) {
      ground.displayOnMenu(width/1.7, height-130);
    }
    if (landscapeMode) {
      ground.displayOnMenu(width/1.7, height/2+10);
    }

    menbar.elastic();
    menbar.display();
    menbar.bounceBack();
    user.display();
    //displayed items//





    //exit button on Menu1
    //button press
    if (menbar.btnX >= 100 && mousePressed && mouseX > menbar.btnX && mouseX<menbar.btnX+60 && mouseY>menbar.btnY && mouseY<menbar.btnY+40) {
      user  = new User(objCol, userX, userY, 100, 0.65, 1.5);
      menu =0;
      start =1;
    }
    //button press
    //exit button on Menu1
  }
  //MENU STATE ////////////////////////////////////////////////////////////////////////////////////////

  //LAYER 2 MENU //
  if (menu == 2 && start == 0 && menu2 == 1) {
    background(24, 101, 145);

    //controllers //
    //back button on Menu2
    menbar.backBtn();
    //button press
    if (mousePressed && mouseX > 10 && mouseX<70 && mouseY>height/9.5 && mouseY<height/9.5+40) {
      user = new User(objCol, width-width/5, height/2-60, 80, 0.65, 1.5);
      menu =1;
      start =0;
    }
    //button press
    //back button on Menu2
    
    
    //exit button on Menu2
    menbar.exitBtn();
    //button press
    if (menbar.btnX >= 100 && mousePressed && mouseX > menbar.btnX && mouseX<menbar.btnX+60 && mouseY>menbar.btnY && mouseY<menbar.btnY+40) {
      user  = new User(objCol, userX, userY, 100, 0.65, 1.5);
      menu =0;
      start =1;
    }
    //button press
    //exit button on Menu2
    //controllers //

    if (landscapeMode!= true) {
      noStroke();
      user.displayOnCustom(width/11,height/4,250);
      //rect(width/11, height/4, 250, 250);
      if (userImg !=null) {
        image(userImg, width/11, height/4, 250, 250);
      }
      fill(204, 5, 0);
      rect(width/11-5, (height/4)*3, 60, 60);

      fill(6, 45, 128);
      rect(width/11+95, (height/4)*3, 60, 60);

      fill(objColNew);
      rect(width/11+200, (height/4)*3, 60, 60);
    }
    if (landscapeMode) {
      
      noStroke();
      rect(width/11, height/11, 250, 250);
      if (userImg !=null) {
        image(userImg, width/11, height/11, 250, 250);
      }
    }
    colorChange();
  }
  //LAYER 2 MENU //


  //GAME STATE //
  if (start == 0 && game == 1) {
    currentTime=interval-(millis()/1000);
    if (currentTime <= 0) {
      wallsGo = true;
      interval +=5;
    }
    if (addTimeOnce) {
      interval +=5;
      addTimeOnce = false;
    }
    background(84, 186, 255);

    fill(0);
    rect(mouseX-75, mouseY-5, 150, 10);
    walls();
    bouncyUser();
    ground.display();
  }
  //GAME STATE //


  //Game STATE 2  (paused)//
  if (game ==2 && menu ==3) {
    background(84, 186, 255);
    user.display();
    gamePiece2.display();
    gamePiece1.display();
    ground.display();
  }
  //GAME STATE 2 //

  //////////Screen Control/////////////

  surface.setSize(screenWidth, screenHeight);
  if (screenWidth <=200) {
    screenWidth = 200;
    screenSizeIncrement = 1;
  } else {
    screenSizeIncrement = 10;
  }
  if (screenHeight <=200) {
    screenHeight = 200;
    screenSizeIncrement = 1;
  } else {
    screenSizeIncrement = 10;
  }
  //////////Screen Control/////////////

  //println("Side one pos: " + gamePiece1.gampx + " width: " + gamePiece1.gamepWidth + " Side two pos: " + gamePiece2.gampx + " width: " + gamePiece2.gamepWidth);
  // println("Interval: " + interval + " CurTime: " + currentTime + " Millis " + millis());
  //println("menu btnx: " + menbar.btnX + " menu btny: " + menbar.btnY);
  println("menu x: " + menbar.menuX + " menu y: " + menbar.menuY);
}

//Draw Ends//

void dropEvent(DropEvent theDropEvent) {
  println("");
  println("isFile()\t"+theDropEvent.isFile());
  println("isImage()\t"+theDropEvent.isImage());
  println("isURL()\t"+theDropEvent.isURL());

  // if the dropped object is an image, then 
  // load the image into our PImage.
  if (theDropEvent.isImage()) {
    println("### loading image ...");
    userImg = theDropEvent.loadImage();
  }
}

void colorChange() {

  objColNew =color(random(255), random(255), random(255));
  delay(50);
  if (mousePressed && mouseX> width/11+200 && mouseX<width/11+260 && mouseY>(height/4)*3 && mouseY<((height/4)*3)+60)
  {
    user.changeCol(objColNew);
    objCol = objColNew;
    userImg = null;
  }
  if (mousePressed && mouseX> width/11+95 && mouseX<width/11+155 && mouseY>(height/4)*3 && mouseY<((height/4)*3)+60)
  {
    user.changeCol(color(6,45,128));
    objCol=color(6,45,128);
    userImg = null;
  }
    if (mousePressed && mouseX> width/11 && mouseX<width/11+60 && mouseY>(height/4)*3 && mouseY<((height/4)*3)+60)
  {
    user.changeCol(color(205,4,0));
    objCol=color(205,4,0);
    userImg = null;
  }
}

void bouncyUser() {
  user.display();
  user.handler();
  user.gravity();
}

void walls() {

  if (wallsGo==true) {
    //walls drawn
    gamePiece1.display();
    gamePiece2.display();

    //Release doors after they've touched
    if (gamePiece1.gampx >= 0) {
      direction1 = direction1 * -1;
      direction2 = direction2 * -1;
    } else if (gamePiece1.gampx < -width/2-10) {
      direction1 = direction1 * -1;
      direction2 = direction2 * -1;
      wallsGo = false;
    }

    //walls CRAM user in
    gamePiece1.gampx = gamePiece1.gampx + 1 * direction1 * wallSpd;
    gamePiece2.gampx = gamePiece2.gampx + 1 * direction2 * wallSpd;
  }
}

void keyPressed() {
  int k = keyCode;

  if (k == LEFT) {
    screenWidth -=screenSizeIncrement;
  } else if
    (k == RIGHT) {
    screenWidth +=screenSizeIncrement;
  }

  if (k == UP) {
    screenHeight -=screenSizeIncrement;
  } else if
    (k == DOWN) {
    screenHeight +=screenSizeIncrement;
  }

  if (k == ' ') {
    user.jump(15);
  }

  if ( menu == 1 && key == 'c' ) {//if on menu
    menu  = 2; //second menu
    menu2 = 1; // second layer menu
  }
  if (menu == 0 && start==1 && key == 'm') {//if menu is off
    menu  = 1; //menu
    start = 0; //start closes
    game  = 0; //game closes
  }
  if (menu == 2 && key == 'm') {//if on second layer menu
    user = new User(objCol, width-width/5, height/2-60, 80, 0.65, 1.5);
    menu = 1; //back to menu
  }
  if (menu == 0 && game==1 && key == 'm') {//if menu is off and game is on
    menu = 3; //third menu
    game = 2; //frozen game
  }

  if (menu == 1 && key == 'e' || menu == 2 && key == 'e') {//if either on menu or second layer menu
    user  = new User(objCol, userX, userY, 100, 0.65, 1.5);
    menu  = 0; //menu closes
    start = 1; //start starts :)
  }

  if (game == 2 && menu == 3 && key == 'e') {//if on menu while game
    menu = 0; // menu closes
    game = 1; // resumes game
  }
  if (game == 1  && key == 'e') {//if on game
    menu  = 0; // menu closes
    start = 1;
    game  = 0;
    addTimeOnce = true;
  }
}
