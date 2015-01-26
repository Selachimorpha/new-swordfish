//declare claa
class Gball {
  //delcare variables
  float sz;
  PVector loc, vel;

  //initialize variables
  Gball() {
    sz = 100;
    loc = new PVector(width/2, height/2);
    vel = PVector.random2D();
  }
  //display of shrimp
  void display() {
    image(sp, loc.x, loc.y, sz, sz);
  }
  //movement of shrimp  
  void move() {
    loc.add(vel);
  }
  void bounce() {
    if (loc.x + sz > width || loc.x < 0) {
      vel.x *= -1;
    }
    if (loc.y + sz > height || loc.y < 0) {
      vel.y *= -1;
    }
  }
  //colliding with the other shrimp
  void collideWith(Gball Other) {
    if (loc.dist(Other.loc) < sz/2 + Other.sz/2) {
      vel = PVector.sub(loc, Other.loc);
      vel.normalize();
      // vel.setMag(speed);
    }
  }
}

