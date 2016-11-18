//James W. Berry
/*JW.Berry
 CRAMMED - Puzzle Game
*/

//Objects//
User user;
Ground ground;
PImage title;
//Objects//

color objCol;
float userX;
float userY;

//Stages//
int menu  = 0;
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
  user = new User(objCol, userX, userY, 100, 0.85, 1.5);
  title = loadImage("crammed_logo.png");
}


void draw() {
  //GAME STATE//
  if (menu == 0 && start == 1) {

    ground = new Ground(0, height-80, width, 80);
    background(84, 186, 255);
    user.display();
    user.handler();
    user.gravity();
    ground.display();
    image(title, width/2-100, height/15, /*231*/ (width>>1)+45, 79);
    
    fill(205,5,0);
    strokeWeight(12);
    stroke(205,5,0);
    strokeJoin(ROUND);
    rect(-30,height/11,60,40);
    fill(255);
    textSize(25);
    text("'M'", 0,height/11+30);
    println(user.gravity);
    
    
    //test
    if (mousePressed) {
      //  //user.redrop();
      user.changeGrav(0.65);
    }
    //test



  }
  //GAME STATE //

  if (menu == 1 && start == 0) {
    background(205, 4, 0);
    
    
  }

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

  if (menu == 0 && key == 'm') {
    menu =1;
    start =0;
    //  game = 0;
  }
  if (menu == 1 && key == 'e') {
    menu = 0;
    start = 1;
  }
}