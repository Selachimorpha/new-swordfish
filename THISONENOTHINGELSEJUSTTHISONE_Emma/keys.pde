class Player {
  PVector loc;

  Player() {
    loc = new PVector(0, 3*height/4);
  }

  void display() {

    if (keyPressed && key == ' ') {
      image(sdown, loc.x, loc.y, szx, szy);
    } else {
      image(s, loc.x, loc.y, szx, szy);
    }
  }

  void move() {
    if (keyPressed) {
      if (key == 'd') {
        loc.x += 5;
      }

      if (key == 'a') {
        loc.x -= 5;
      }

      if (key == 'w') {
        loc.y -= 5;
      }

      if (key == 's') {
        loc.y += 5;
      }
    }
  }
  void kill() {
    if (keyPressed) {
      if (key == ' ') {
        if (loc.dist(other.loc) < sz/2 + other.sz/2) {
          {
            vel = PVector.sub(loc, other.loc);
            vel.normalize();
          }
        }
      }
    }
  }
  boolean nextlevel() { 
    if (loc.x > width) {
      loc.x=0;

      return true;
    } else {
      return false;
    }
  }
}

