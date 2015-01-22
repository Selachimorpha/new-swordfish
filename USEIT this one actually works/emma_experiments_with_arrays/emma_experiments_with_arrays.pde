
ArrayList<pufferfish> pufferfishes = new ArrayList<pufferfish>();
ArrayList<Boss> Bosses = new ArrayList<Boss>();
//declare variables
//swordfish
PImage s;
PImage sdown;
//pufferfish
PImage pf;
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
//background 1
PImage oceanmenu;
//background level 1
PImage bruce;
//background level 2
PImage school;
//life of character
float life = 3;
//background level 3
PImage spongebob;
//background final level
PImage finish;
//boss
PImage bs;
//
Boss bss;
Player swordfish;
int max;
void setup() {
  colorMode(HSB, 360, 100, 100);
  size(1000, 625);
  s = loadImage("swordfish.png");
  sdown = loadImage("swordfish down.png");
  pf = loadImage("pufferfish.png");
  oceanmenu = loadImage("ocean menu.jpg");
  bruce = loadImage("nemo-shark.jpg");
  school = loadImage("FishSchool.jpg");
  spongebob = loadImage("spongebobstreet.png");
  finish = loadImage("barracuda.jpg");
  bs = loadImage("Final Boss.png");

  swordfish=new Player();
  bss = new Boss();
  Bosses.add(bss);
}
void draw() {

  background(oceanmenu);
  fill(0);
  // level 1
  if (running == 0) {
    if (mouseX < width/2+60 && mouseX > width/2-50 && mouseY > 500 && mouseY < 550 && mousePressed) {
      running = 1;
    }
  } 
  if (running == 1) {
    background(bruce);
    textSize(60);
    text("Level 1", 100, 100);
    if (pufferfishes.size() < 1) {
      pufferfishes.add(new pufferfish(200, 200));
      pufferfishes.add(new pufferfish(200, 200));
      pufferfishes.add(new pufferfish(200, 200));
    }  
    for (int i = 0; i < pufferfishes.size (); i++) 
    {
      pufferfish p = pufferfishes.get(i);
      p.display();
      p.move();
      p.bounce();
      if (swordfish.kill(p) && keyPressed && key == ' ') {
        println("kill!!!");
        pufferfishes.remove(i);
      }
      if (swordfish.die(p)) {
        life = 0;
      }
      if (pufferfishes.size() == 0) {
        running = 2;
      }
    }
    swordfish.display();
    swordfish.move();
  }


  //level 2
  if (swordfish.nextlevel() == true) {
    running= 2;
  }
  if (running == 2) {

    background(school);
    textSize(60);
    text("Level 2", 50, 100);
    if (pufferfishes.size() < 1) {
      pufferfishes.add(new pufferfish(200, 200));
      pufferfishes.add(new pufferfish(200, 200));
      pufferfishes.add(new pufferfish(200, 200));
      pufferfishes.add(new pufferfish(200, 200));      
      pufferfishes.add(new pufferfish(200, 200));
    }
    for (int i = 0; i < pufferfishes.size (); i++) 
    {
      pufferfish p = pufferfishes.get(i);
      p.display();
      p.move();
      p.bounce();
      if (swordfish.kill(p) && keyPressed && key == ' ') {
        println("kill!!!");
        pufferfishes.remove(i);
      } else if (swordfish.kill(p)) {
        life = 0;
      }
      if (pufferfishes.size() == 0) {
        running = 3;
      }
    }
    swordfish.display();
    swordfish.move();
  }



  // level 3
  if (swordfish.nextlevel() == true) {
    running = 3;
  }
  if (running == 3) {
    background(spongebob);
    textSize(60);
    text("Level 3", 50, 100);
    if (pufferfishes.size() < 1) {
      pufferfishes.add(new pufferfish(200, 200));
      pufferfishes.add(new pufferfish(200, 200));
      pufferfishes.add(new pufferfish(200, 200));
      pufferfishes.add(new pufferfish(200, 200));      
      pufferfishes.add(new pufferfish(200, 200));      
      pufferfishes.add(new pufferfish(200, 200));      
      pufferfishes.add(new pufferfish(200, 200));
    }
    for (int i = 0; i < pufferfishes.size (); i++) 
    {
      pufferfish p = pufferfishes.get(i);
      p.display();
      p.move();
      p.bounce();
      if (swordfish.kill(p) && keyPressed && key == ' ') {
        println("kill!!!");
        pufferfishes.remove(i);
      }
      if (pufferfishes.size() == 0) {
        running = 4;
      }
    }
    swordfish.display();
    swordfish.move();
  } 

  if (swordfish.nextlevel() == true) {
    running = 4;
  } else if (running == 4) {
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
    
    if (mouseX < width/2-150 && mouseX > width/2-350 && mouseY > height/2+100 && mouseY < height/2+150 && mousePressed) {
      running = 5;
    }
    if (mouseX < width/2+350 && mouseX > width/2+150 && mouseY > height/2+100 && mouseY < height/2+150 && mousePressed) {
      running = 5;
    }
  } else if (running == 5) {
    background(finish);
    textSize(60);
    text("Final Level", 50, 100);
    //bss.display();
    //bss.move();
    //bss.bounce();
    swordfish.display();
    swordfish.move();
    if ( swordfish.loc.x > width) {
      println("someone wimped out");
      life = 0;
    }
    if(Bosses.size() > 0)
    {
      Boss b = Bosses.get(0);
      b.display();
      b.move();
      b.bounce();
      if (swordfish.killboss(bss) && keyPressed && key == ' ') {
        println("kill!!!");
        Bosses.remove(0);
      }
    }
  }


  //ways to die
  if (swordfish.loc.y > height||swordfish.loc.y<0-100||swordfish.loc.x<0-200) {
    println("went off the bottom of the screen");
    life = 0;
  }
  //death screen
  if (life==0) { 

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
    max=3;

    //retry button
    if (mouseX < width/2+50 && mouseX > width/2-50 && mouseY > 500 && mouseY < 550 && mousePressed) {
      life = 3;
      running = 1;
    }
  }


  //test to kill self
  if (keyPressed) {
    if (key == 'l') {
      life = 0;
    }
  }
  //winner screen
  //  if (life==6) { 
  //
  //    background(#0710F0);        
  //    swordfish.loc.y=3*height/4;
  //    swordfish.loc.x=0;
  //    textSize(36);                                                
  //    text("CONGRATULATIONS!", width/3, height/2);                 
  //    textSize(18);                                                
  //    text("You have won ", width/3+110, height/2+40);
  //    fill(0);
  //    rect(width/2-50, 500, 100, 50); 
  //    fill(#FFFFFF);
  //    textSize(38);
  //    text("Retry", width/2-45, 540);
  //    max=3;
  //  }
}

