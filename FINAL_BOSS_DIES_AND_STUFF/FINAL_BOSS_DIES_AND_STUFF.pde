//Enemies
ArrayList<pufferfish> pufferfishes = new ArrayList<pufferfish>();
ArrayList<Boss> Bosses = new ArrayList<Boss>();

Gball[] g = new Gball[50];

//declare variables

//swordfish
PImage s;
PImage sdown;

//pufferfish
PImage pf;

//shrimp
PImage sp;

//location of swordfish
PVector loc;

//size of swordfish
float szx;
float szy;
int shape = 1;

//speed
float speedx;
float speedy;

//changes level
int running = 0;

//backgrounds
PImage oceanmenu;
PImage bruce;
PImage school;
PImage spongebob;
PImage finish;

//life of character
float life = 3;

//boss
PImage bs;
Boss bss;

//player character
Player swordfish;

//endspawn stops spawning pufferfish once they are dead
int endspawn;


void setup() {

  //various setup items
  colorMode(HSB, 360, 100, 100);
  size(1000, 625);

  //loading images
  sp = loadImage("shrimp.png");
  s = loadImage("swordfish.png");
  sdown = loadImage("swordfish down.png");
  pf = loadImage("pufferfish.png");
  oceanmenu = loadImage("ocean menu.jpg");
  bruce = loadImage("nemo-shark.jpg");
  school = loadImage("FishSchool.jpg");
  spongebob = loadImage("spongebobstreet.png");
  finish = loadImage("barracuda.jpg");
  bs = loadImage("Final Boss.png");

  //initialize
  endspawn=0;

  //inserting classes
  swordfish=new Player();
  bss = new Boss();
  Bosses.add(bss);

  for (int i = 0; i < g.length; i++) {
    g[i] = new Gball();
  }
}

void draw() {
  // start screen
  background(oceanmenu);
  fill(#000000);
  textSize(24);
  text("Instructions:  Kill the enemies and move to the right", width/4-60, height/2+165);
  if (running == 0) {
    if (mouseX < width/2+60 && mouseX > width/2-50 && mouseY > 500 && mouseY < 550 && mousePressed  || keyPressed && key == ' ') {
      running = 1;
    }
  } 

  //level 1
  //display of level 1
  if (running == 1) {
    background(bruce);
    textSize(60);
    text("Level 1", 100, 100);

    //inserting enemies
    if (pufferfishes.size() < 1 && running == 1 && endspawn==0) {
      pufferfishes.add(new pufferfish(200, 200));
      pufferfishes.add(new pufferfish(200, 200));
      pufferfishes.add(new pufferfish(200, 200));
    }  

    //displaying and adding enemy movements
    for (int i = 0; i < pufferfishes.size (); i++) {
      pufferfish p = pufferfishes.get(i);
      p.display();
      p.move();
      p.bounce();


      //killing pufferfish
      if (swordfish.kill(p) && keyPressed && key == ' ') {
        println("kill!!!");
        pufferfishes.remove(i);
      }

      //killed by pufferfish
      if (swordfish.die(p)) {
        life = 0;
      }

      //level advance
      if (pufferfishes.size() == 0) {
        endspawn+=1;
      }
    }

    //death for going offscreen
    if (swordfish.loc.x+50>width && pufferfishes.size()>0) {
      life=0;
    }

    //displaying and moving swordfish
    swordfish.display();
    swordfish.move();
  }


  //level 1 to level 2
  if (swordfish.nextlevel() == true) {
    running= 2;
  }

  //level 2
  //display of level 2
  if (running == 2) {
    background(school);
    textSize(60);
    text("Level 2", 50, 100);

    //adding enemies
    if (pufferfishes.size() < 1 && running==2 && endspawn==1) {
      pufferfishes.add(new pufferfish(200, 200));
      pufferfishes.add(new pufferfish(200, 200));
      pufferfishes.add(new pufferfish(200, 200));
      pufferfishes.add(new pufferfish(200, 200));      
      pufferfishes.add(new pufferfish(200, 200));
    }

    //displaying and adding enemy movements
    for (int i = 0; i < pufferfishes.size (); i++) 
    {
      pufferfish p = pufferfishes.get(i);
      p.display();
      p.move();
      p.bounce();

      //killing enemies
      if (swordfish.kill(p) && keyPressed && key == ' ') {
        println("kill!!!");
        pufferfishes.remove(i);
      }

      //killed by enemies
      else if (swordfish.die(p)) {
        life = 0;
      }

      //level advance
      if (pufferfishes.size() == 0) {
        endspawn+=1;
      }
    }

    //death for going offscreen
    if (swordfish.loc.x+50>width && pufferfishes.size()>0) {
      life=0;
    }

    //displaying and movind swordfish
    swordfish.display();
    swordfish.move();
  }

  // level 3
  if (swordfish.nextlevel() == true) {
    running = 3;
  }

  //displaying level three
  if (running == 3) {
    background(spongebob);
    textSize(60);
    text("Level 3", 50, 100);

    //adding enemies
    if (pufferfishes.size() < 1 && running==3 && endspawn==2) {
      pufferfishes.add(new pufferfish(200, 200));
      pufferfishes.add(new pufferfish(200, 200));
      pufferfishes.add(new pufferfish(200, 200));
      pufferfishes.add(new pufferfish(200, 200));      
      pufferfishes.add(new pufferfish(200, 200));      
      pufferfishes.add(new pufferfish(200, 200));      
      pufferfishes.add(new pufferfish(200, 200));
    }

    //displaying and adding enemy movements
    for (int i = 0; i < pufferfishes.size (); i++) 
    {
      pufferfish p = pufferfishes.get(i);
      p.display();
      p.move();
      p.bounce();

      //killing enemies
      if (swordfish.kill(p) && keyPressed && key == ' ') {
        println("kill!!!");
        pufferfishes.remove(i);

        //getting killed by enemies
      } else if (swordfish.die(p)) {
        life = 0;
      }

      //level advance
      if (pufferfishes.size() == 0) {
        endspawn+=1;
      }
    }

    //death for going offscreen
    if (swordfish.loc.x+50>width && pufferfishes.size()>0) {
      life=0;
    }

    //displaying and moving swordfish
    swordfish.display();
    swordfish.move();
  } 

  //boss warning screen
  if (swordfish.nextlevel() == true) {
    running = 4;
  } else if (running == 4) {

    //display, color, and text
    background(#000000);
    fill(#FFFFFF);
    textSize(40);
    text("The final boss lays ahead, he is very dangerous....", 25, height/3);
    text("Would you like to continue?", width/2-285, height/3+40);
    rect(width/2-350, height/2+100, 200, 50);
    textSize(20);
    fill(#000000);
    text("Not really but I will", width/2-345, height/2+130);
    fill(#FFFFFF);
    rect(width/2+150, height/2+100, 200, 50);
    fill(#000000);
    text("Of course!!!", width/2+185, height/2+130);

    //buttons to advance the screen
    if (mouseX < width/2-150 && mouseX > width/2-350 && mouseY > height/2+100 && mouseY < height/2+150 && mousePressed) {
      running = 5;
    }
    if (mouseX < width/2+350 && mouseX > width/2+150 && mouseY > height/2+100 && mouseY < height/2+150 && mousePressed) {
      running = 5;
    }
  } 

  //final boss
  else if (running == 5) {

    //display level
    background(finish);
    textSize(60);
    text("Final Level", 50, 100);

    //moving and displaying swordfish
    swordfish.display();
    swordfish.move();

    //death by leaving the screen
    if ( swordfish.loc.x > width) {
      println("someone wimped out");
      life = 0;
    }

    //displaying and moving the boss
    if (Bosses.size() > 0)
    {
      Boss b = Bosses.get(0);
      b.display();
      b.move();
      b.bounce();

      //killing the boss
      if (swordfish.killboss(bss) && keyPressed && key == ' ') {
        println("kill!!!");
        Bosses.remove(0);
        life=6;
      }
      if (swordfish.bossdeath(bss) == true) {
        life = 0;
      }
    }
  }




//death by leaving the screen
if (swordfish.loc.y > height||swordfish.loc.y<0-100||swordfish.loc.x<0-200) {
  println("went off the bottom of the screen");
  life = 0;
}

//death screen
if (life==0) { 

  //displaying death screen
  background(#0710F0);        
  swordfish.loc.y=3*height/4;
  swordfish.loc.x=0;
  textSize(36);                                                
  text("CONGRATULATIONS!", width/3, height/2);                 
  textSize(18);                                                
  text("You have died ", width/3+110, height/2+40);
  fill(0);
  rect(width/2-50, 500, 100, 50); 
  fill(#FFFFFF);
  textSize(38);
  text("Retry", width/2-45, 540);
  endspawn=0;

  //retry button
  if (mouseX < width/2+50 && mouseX > width/2-50 && mouseY > 500 && mouseY < 550 && mousePressed) {
    life = 3;
    running = 1;
    pufferfishes = new ArrayList<pufferfish>();
  }
}

//winner screen
if (life==6) { 

  //displaying winner screen
  background(#0710F0);        
  swordfish.loc.y=3*height/4;
  swordfish.loc.x=0;
  textSize(36);                                                
  text("CONGRATULATIONS!", width/3, height/2);                 
  textSize(18);                                                
  text("You have won ", width/3+110, height/2+40);
  fill(0);
  rect(width/2-50, 500, 100, 50); 
  fill(#FFFFFF);
  textSize(16);
  text("Play Again", width/2-45, 540);

  //adding shrimp
  for (int i = 0; i < g.length; i++) {
    g[i].display();
    g[i].move();
    g[i].bounce();
    for (int j = 0; j<g.length; j++) {
      if (i!=j) {
        g[i].collideWith(g[j]);
      }
    }
  }
  println("SHRIMP FOR ALL!!!!!!SHRIMP FOR ALL!!!!!!SHRIMP FOR ALL!!!!!!");


  //play again button
  if (mouseX < width/2+50 && mouseX > width/2-50 && mouseY > 500 && mouseY < 550 && mousePressed) {
    life = 3;
    running = 1;
  }
}

//boss screen test key
if (key == 'l') {
  running =  5;
}
}
