class Player {
  PVector loc;
  float szx, szy;
  //life for the boss
  int life;

  Player() {
    loc = new PVector(0, 3*height/4);
    szx = 200;
    szy = 100;
    life = 3;
  }

  void display() {

    //swinging the "sword"
    if (keyPressed && key == ' ') {
      image(sdown, loc.x, loc.y, szx, szy);
    } else {
      image(s, loc.x, loc.y, szx, szy);
    }
  }

  void move() {

    // movement with WASD
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

  //killing pufferfish minions

 boolean kill(pufferfish pufferfishes) {
    PVector swordtip = new PVector(loc.x + szx, loc.y + 40);
    ellipse(swordtip.x, swordtip.y, 30, 30);
    PVector puffCenter = new PVector(pufferfishes.loc.x + pufferfishes.sz/4, pufferfishes.loc.y + pufferfishes.sz/4);
    if (abs(swordtip.x - puffCenter.x) < (szx + pufferfishes.sz)/4 && abs(swordtip.y - puffCenter.y) < (szy +pufferfishes.sz)/4 && keyPressed && key == ' ') {
      return true;
    } else {
      return false;
    }
  }
  // getting killed by pufferfish
  boolean die(pufferfish pufferfishes) {
    if (loc. dist(pufferfishes.loc) < szx/4 + pufferfishes.sz/4) {
      return true;
    } else {
      return false;
    }
  }

  // defeating the boss
  boolean killboss(Boss Bosses) {
    // if (loc.dist(Bosses.loc) < szx ) {
    PVector swordCenter = new PVector(loc.x+szx/2, loc.y+szy/2);
    PVector bossCenter = new PVector(Bosses.loc.x + Bosses.sz/2, Bosses.loc.y + Bosses.sz/2);
    if (abs(swordCenter.x - bossCenter.x) < (szx+Bosses.sz)/2 &&  abs(swordCenter.y - bossCenter.y) < (szy+Bosses.sz)/2) {
      println("boss dies");
      return true;
    } else {
      return false;
    }
  }
  //moving forward in the game
  boolean nextlevel() { 
    if (loc.x > width) {
      loc.x=0;

      return true;
    } else {
      return false;
    }
  }
}

