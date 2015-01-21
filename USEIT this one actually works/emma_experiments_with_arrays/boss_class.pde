class Boss {
  PVector loc, vel;
  PImage boss;
  float sz;



  Boss() {
    sz = 500;
    vel= new PVector(random(2), random(2));
    bs = loadImage("Final Boss.png");
    loc = new PVector(random(20, 600), random(20, 600));
  }
  void display() {
    image(bs, loc.x, loc.y, sz, sz);
  }

  void move() {
    loc.add(vel);
    //    loc.y.add(vel);
    //  vel.add(acc);
  }
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

