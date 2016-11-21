
class User {
  color c;
  float xPos;
  float yPos;
  int   size;
  float gravity;
  float speed;
  float gravNew;

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