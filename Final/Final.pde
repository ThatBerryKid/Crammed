//James W. Berry
/*JW.Berry
 CRAMMED - Puzzle Game
 */

//Objects//
User user, editable;
Ground ground;
Menubar menbar;
GamePiece gamePiece1;
GamePiece2 gamePiece2;
PImage title;

//Obj var//
color objCol;
color objColNew;
float userX;
float userY;
float gamp1;
float gamp2;
float menuX;
float menuY;
//Obj var//
//Objects//

//timers//
long globalTime;
long currentTime;
long startTime;
long time;
long zero=10000;
//timer//


//Stages//
int menu  = 0;
int menu2 = 0;
int start = 1;
int game  = 0;
//Stages//

//Switches//
boolean grav = false;
boolean wallsGo = false;
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
  objCol = color(205, 5, 0);
  currentTime=2000;
  startTime=3000;

  //obj's//
  user = new User(objCol, userX, userY, 100, 0.65, 1.5);
  menbar = new Menubar(-200, 0);
  gamePiece1 = new GamePiece(gamp1);
  gamePiece2 = new GamePiece2(gamp2);
  //obj's//

  title = loadImage("crammed_logo.png");
}


void draw() {
  globalTime = millis(); //timer started

  
  //START STATE//
  if (menu == 0 && start == 1) {
    userX = random(width/2-100, width/2+100); //random pos for user
    ground = new Ground(0, height-130, width, 130); //needed here, to update with the size
 
    background(84, 186, 255);

    bouncyUser();            //calls user, gravity, and handler
    user.changeGrav(0.65);   //adjusts gravity
    ground.display();        //calls ground


    if (mouseX>ground.xPoint+70 && mouseX<ground.xPoint+220 && mouseY>ground.yLine+50 && mouseY<ground.yLine+105) {
    fill(user.c);}
    else{
    fill(20, 205, 0);}
    rect(ground.xPoint+70, ground.yLine+50, 150, 55);
    
    
    //fill(20, 205, 0);
    //rect(ground.xPoint+70, ground.yLine+50, 150, 55);
    if (mousePressed && mouseX>ground.xPoint+70 && mouseX<ground.xPoint+220 && mouseY>ground.yLine+50 && mouseY<ground.yLine+105) {
    //fill(205, 20, 0);
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


  // MENU STATE //
  if (menu == 1 && start == 0) 
  {
    noStroke();
    //    background(34, 141, 204);
    background(84, 186, 255);

    //displayed items//
    menbar.elastic();
    menbar.display();
    menbar.bounceBack();
    ground.displayOnMenu(width/1.7);
    user.display();
    //displayed items//


    //controllers //
    colorChange();
    //controllers //
  }
  //MENU STATE //

  //LAYER 2 MENU //
  if (menu == 2 && start == 0 && menu2 == 1) {
    background(255, 82, 76);
  }
  //LAYER 2 MENU //


  //GAME STATE //
  if (start == 0 && game == 1) {
    if (globalTime-currentTime >= 5000) {
      currentTime = millis();
    }
    background(84, 186, 255);
    if (wallsGo==false && currentTime - startTime >= 3000) {
      wallsGo=true;
      startTime=currentTime;
    }
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
  println(" Game Time" +gamePiece2.time + " Point: " + gamePiece2.zero + " Current: " +currentTime + " Global: " +globalTime);
}

//Draw Ends//

//void wallControlNTime(){
//    time=millis();
//    if (gamePiece1.gampx == gamePiece1.gampxLim-gamePiece1.gamepWidth && time-zero >=8000){
//    gamePiece1.gampx=width;
//    zero=time-2000;
//    }
//}

void colorChange() {
  if (mousePressed)
  {
    objColNew =color(random(255), random(255), random(255));
    user.changeCol(objColNew);
    objCol = objColNew;
  }
}

void bouncyUser() {
  user.display();
  user.handler();
  user.gravity();
}

void walls() {
  gamePiece1.display();
  gamePiece2.display();
  if (wallsGo==true) {
    gamePiece1.action();
    gamePiece2.action();
    gamePiece1.controller();
    gamePiece2.controller();
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
    user = new User(objCol, width-width/5, height/2-60, 80, 0.65, 1.5);
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
  }
}