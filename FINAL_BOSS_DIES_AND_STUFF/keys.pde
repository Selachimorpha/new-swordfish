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
    PVector puffCenter = new PVector(pufferfishes.loc.x + pufferfishes.sz/4, pufferfishes.loc.y + pufferfishes.sz/4);
    if (abs(swordtip.x - puffCenter.x) < (szx + pufferfishes.sz)/4 && abs(swordtip.y - puffCenter.y) < (szy +pufferfishes.sz)/4 && keyPressed && key == ' ') {
      return true;
    } else {
      return false;
    }
  }

  // getting killed by pufferfish
  boolean die(pufferfish pufferfishes) {
    if (pufferfishes.loc.x - pufferfishes.sz/2 < loc.x + szx/2 && pufferfishes.loc.x + pufferfishes.sz/2 > loc.x && pufferfishes.loc.y + pufferfishes.sz/2 > loc.y + 20 && pufferfishes.loc.y - pufferfishes.sz/2 < loc.y + szy-20) {
      print ("I've been hit!");
      return true;
    } else {
      return false;
    }
  }

  // defeating the boss
  boolean killboss(Boss Bosses) {
    PVector swordtip = new PVector(loc.x + szx, loc.y + 40);
   
    PVector bossCenter = new PVector(Bosses.loc.x + Bosses.sz/2, Bosses.loc.y + Bosses.sz/2);
    if (Bosses.loc.x - Bosses.sz/2 < loc.x + szx && Bosses.loc.x + Bosses.sz/2 > loc.x && Bosses.loc.y + Bosses.sz/2 > loc.y + 20 && Bosses.loc.y - Bosses.sz/2 < loc.y + szy -20){
         println("boss dies");
      return true;
    } else {
      return false;
    }
  }

  //killed by the boss
  boolean bossdeath(Boss Bosses) {
    if (Bosses.loc.x - Bosses.sz/2 < loc.x + szx/2 && Bosses.loc.x + Bosses.sz/2 > loc.x && Bosses.loc.y + Bosses.sz/2 > loc.y + 20 && Bosses.loc.y - Bosses.sz/2 < loc.y + szy -20){
         print ("I've been hit!");
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

