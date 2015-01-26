//declare class
class Boss {
  //declare variables
  PVector loc, vel;
  PImage boss;
  float sz;


  //initialize variables
  Boss() {
    sz = 300;
    vel= new PVector(random(2), random(2));
    bs = loadImage("Final Boss.png");
    loc = new PVector(random(600, 800), random(20, 600));
  }
  //displaying boss
  void display() {
    imageMode(CENTER);
    image(bs, loc.x, loc.y, sz, sz);
    imageMode(CORNER);
  }
  //moving boss
  void move() {
    loc.add(vel);
  }

  //movement pattern
  void bounce() { 
    if (loc.x + 400 > width) {
      vel.x = -abs(vel.x);
    }
    if (loc.x + 10 < 0) {
      vel.x = abs(vel.x);
    }
    if (loc.y + 400 > height) {
      vel.y = -abs(vel.y);
    }
    if (loc.y + 100 < 0) {
      vel.y = abs(vel.y);
    }
  }
}

