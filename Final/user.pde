
class User {
  color c;
  float xPos;
  float yPos;
  int   size;
  float gravity;
  float speed;
  float gravNew;

  float xposition;
  float yposition;
  float size2;

  User(color tC, float tXpos, float tYpos, int tSize, float tGravity, float tSpeed) {
    c=tC;
    xPos    = tXpos;
    yPos    = tYpos;
    size    = tSize;
    gravity = tGravity;
    speed   = tSpeed;
  }
  void gravity() {
    yPos = yPos + speed;
    speed = speed + gravity;
  }
  void display() {
    noStroke();
    fill(c);
    rect(xPos-size/2, yPos, size, size);
    if (userImg !=null) {
        image(userImg, xPos-size/2,yPos,size,size);
      }
  }
  void displayOnCustom(float txposition, float typosition, float tsize2){
    xposition = txposition;
    yposition = typosition;
    size2 = tsize2;
    noStroke();
    fill(c);
    rect(xposition, yposition, size2, size2);
    if (userImg !=null) {
        image(userImg, xposition,yposition,size2,size2);
      }
    
    
  }
  void handler() {
    if ((speed < 0.1) && ( yPos+size > ground.yLine)) {
      speed = 0;
      gravity = 0;
    } else if ( yPos+size >ground.yLine) {
      speed = speed * -.754; //BOUNCINESS Closer to -1.0 constant bouncing, 0 is no bounce.
    }
  }
  void changeGrav ( float tGravNew ) {
    gravNew = tGravNew;
    gravity = gravNew;
  }
  void changeCol(color colorChange) {
    color colorChnge = colorChange;
    c = colorChnge;
  }
  void jump ( float tSpd ) {
    float spd = tSpd;
    speed = spd;
    gravity = gravNew;
  }
  void redrop() {
    yPos = 50;
    speed = 1.5;
    gravity = .65;
  }
}