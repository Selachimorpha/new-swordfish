class pufferfish {
  PVector loc, vel;
  float sz;
  PImage puffer;

// pufferfish enemies

  pufferfish(float x, float y) {
    sz = 100;
    //    loc=new PVector(random(20, 600), random(20, 600));
    vel= new PVector(random(5), random(5));
    puffer = loadImage("pufferfish.png");
    loc = new PVector(random(500, width + sz/2), random(20, 600));
  }
  void display() {
    imageMode(CENTER);
   ellipse(loc.x,loc.y,sz+10,sz+10);
    image(puffer, loc.x, loc.y, sz, sz);
    imageMode(CORNER);
  }
  void move() {
    loc.add(vel);
    //    loc.y.add(vel);
    //  vel.add(acc);
  }
  
  //movement pattern
  
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
  void collideWith(pufferfish other) {
    if (loc.dist(other.loc) < sz/2 + other.sz/2) {
      {
        vel = PVector.sub(loc, other.loc);
        vel.normalize();
      }
    }
  }
}

