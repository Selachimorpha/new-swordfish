//declare class
class pufferfish {
  //declare varibles
  PVector loc, vel;
  float sz;
  PImage puffer;

  // pufferfish enemies
  //initialize variables
  pufferfish(float x, float y) {
    sz = 100;
    vel= new PVector(random(5), random(5));
    puffer = loadImage("pufferfish.png");
    loc = new PVector(random(500, width - sz/2), random(20, 600));
  }
  //displaying the pufferfish
  void display() {
    imageMode(CENTER);
    image(puffer, loc.x, loc.y, sz, sz);
    imageMode(CORNER);
  }
  //moving the pufferfish
  void move() {
    loc.add(vel);
  }

  //movement pattern

  void bounce() { 
    if (loc.x + sz/2 > width) {
      vel.x = -abs(vel.x);
    }
    if (loc.x - sz/2 < 0) {
      vel.x = abs(vel.x);
    }
    if (loc.y + sz/2 > height) {
      vel.y = -abs(vel.y);
    }
    if (loc.y - sz/2 < 0) {
      vel.y = abs(vel.y);
    }
  }
  //pufferfish colliding with each other
  void collideWith(pufferfish other) {
    if (loc.dist(other.loc) < sz/2 + other.sz/2) {
      {
        vel = PVector.sub(loc, other.loc);
        vel.normalize();
      }
    }
  }
}

