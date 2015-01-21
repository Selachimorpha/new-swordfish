class Player {
  PVector loc;
  float szx, szy;
  Player() {
    loc = new PVector(0, 3*height/4);
    szx = 200;
    szy = 100;
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
  boolean kill(pufferfish pufferfishes) {
    if (loc.dist(pufferfishes.loc) < szx/2 + pufferfishes.sz/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean die(pufferfish pufferfishes) {
    if (loc. dist(pufferfishes.loc) < szx/4 + pufferfishes.sz/4) {
      return true;
    } else {
      return false;
    }
  }

  boolean killboss(Boss Bosses) {
   if (loc.dist(Bosses.loc) < szx ) {
         println("boss dies");
      return true;
   } else {
      return false;
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

