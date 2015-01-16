class Boss {
  PVector loc, vel;
  PImage boss;
  float sz;



  Boss() {
    sz = 100;
    vel= new PVector(random(5), random(5));
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
    if (loc.x + 90 > width) {
      vel.x = -abs(vel.x);
    }
    if (loc.x + 10 < 0) {
      vel.x = abs(vel.x);
    }
    if (loc.y + 90 > height) {
      vel.y = -abs(vel.y);
    }
    if (loc.y + 10  < 0) {
      vel.y = abs(vel.y);
    }
  }
}

