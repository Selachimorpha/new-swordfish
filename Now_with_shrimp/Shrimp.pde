class Gball {
  float sz;
  PVector loc, vel;

  Gball() {
    sz = 100;
    loc = new PVector(width/2, height/2);
    vel = PVector.random2D();
  }
  void display() {
    image(sp, loc.x, loc.y, sz, sz);
  }  
  void move() {
    loc.add(vel);
  }
  void bounce() {
    if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
      vel.x *= -1;
    }
    if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
      vel.y *= -1;
    }
  }

  void collideWith(Gball Other) {
    if (loc.dist(Other.loc) < sz/2 + Other.sz/2) {
      vel = PVector.sub(loc, Other.loc);
      vel.normalize();
      // vel.setMag(speed);
    }
  }
}

