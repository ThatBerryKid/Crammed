//James W. Berry
/*JW.Berry
 CRAMMED - Puzzle Game
 */

//Objects//
User user, editable;
Ground ground;
Menubar menbar;
PImage title;
//Objects//

color objCol;
color objColNew;
float userX;
float userY;
float menuX;
float menuY;

//Stages//
int menu  = 0;
int menu2 = 0;
int start = 1;
//Stages//

//Switches//
boolean grav = false;
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
  objCol = color(205, 5, 0);
  //obj's//
  user = new User(objCol, userX, userY, 100, 0.85, 1.5);
  menbar = new Menubar(-200, 0);
  //obj's//

  title = loadImage("crammed_logo.png");
}


void draw() {
  //GAME STATE//
  if (menu == 0 && start == 1) {

    userX = random(width/2-100, width/2+100);

    ground = new Ground(0, height-130, width, 130); //needed here, to update with the size
    background(84, 186, 255);
    user.display();
    user.handler();
    user.gravity();
    ground.display();
    image(title, width/2-100, height/15, /*AlternateWidth*//*231*/ (width>>1)+45, 79);

    //menu button on Game
    fill(34, 141, 204);
    strokeWeight(12);
    stroke(34, 141, 204);
    strokeJoin(ROUND);
    rect(-30, height/9.5, 60, 40);
    fill(255);
    textSize(25);
    text("'M'", 0, height/9.5+30);
    //menu button on Game

    println(user.gravity);


    //test
    if (mousePressed) {
      //  //user.redrop();
      user.changeGrav(0.65);
    }
    //test
  }
  //GAME STATE //


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

    /*
    //menu button on Menu
     fill(34, 141, 204);
     strokeWeight(12);
     stroke(34, 141, 204);
     strokeJoin(ROUND);
     rect(width/1.7-20, height/9.5, 60, 40);
     fill(255);
     textSize(25);
     text("'E'", width/1.7+15, height/9.5+30);
     //menu button on Menu  
     */
  }
  //MENU STATE //

  //LAYER 2 MENU //
  if (menu == 2 && start == 0 && menu2 == 1){
  background(205,5,0);
  }
  //LAYER 2 MENU //

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
}

//Draw Ends//



void colorChange() {
  if (mousePressed)
  {
    objColNew =color(random(200), 205, 50);
    user.changeCol(objColNew);
    objCol = objColNew;
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

if( menu == 1 && key == 'c' ){
 menu = 2;
 menu2 = 1;
}
  if (menu == 0 && key == 'm') {
    user = new User(objCol, width-width/5, height/2-60, 80, 0.65, 1.5);
    menu =1;
    start =0;
    //  game = 0;
  }
  if (menu == 1 && key == 'e' || menu == 2 && key == 'e') {
    user = new User(objCol, userX, userY, 100, 0.65, 1.5);
    menu = 0;
    start = 1;
  }
}