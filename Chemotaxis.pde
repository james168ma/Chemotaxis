Prey[] preyColony = new Prey[15];
Predator[] predators = new Predator[15];
int playerKillCount = 0;
int deathTotal = 0;
boolean gameOver = false;
void setup() {
  size(1000, 700);
  frameRate(60);
  background(0);
  for (int i = 0; i < preyColony.length; i++) 
    preyColony[i] = new Prey((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  for (int i = 0; i < predators.length; i++) 
    predators[i] = new Predator();
}

void draw() {
  fill(0, 0, 0, 30);
  noStroke();
  rect(0, 0, 1000, 700);
  for(int i = 0; i < predators.length; i++) {
    predators[i].show();
    predators[i].move();
    if(predators[i].signal == true) {
      background(0, 255, 0);//FOR CROSSHAIRS
      fill(255);
      noStroke();
      rect(predators[i].myX - 1, predators[i].myY - 40, 3, 15);
      rect(predators[i].myX - 1, predators[i].myY + 25, 3, 15);
      rect(predators[i].myX - 40, predators[i].myY - 1, 15, 3);
      rect(predators[i].myX + 25, predators[i].myY - 1, 15, 3);
      playerKillCount ++;
      predators[i].signal = false;
    }
  }
  for(int i = 0; i < preyColony.length; i++) {
    preyColony[i].show();
    preyColony[i].move();
    if(preyColony[i].signal == true) {
      /*noStroke();                  //FOR PACMAN TO SHOW UP
      fill(238, 255, 54);
      arc(preyColony[i].myX, preyColony[i].myY, 50, 50, PI/4, 7*PI/4);*/
      /*fill(255, 0, 0);             //FOR EXPLOSION
      ellipse(preyColony[i].myX, preyColony[i].myY, 50, 50);
      for(int x = 0; x < 1001; x += 20) {
        fill(preyColony[i].myR, preyColony[i].myG, preyColony[i].myB);
        ellipse(x, preyColony[i].myY, 10, 10);
      }
      for(int y = 0; y < 701; y += 20) {
        ellipse(preyColony[i].myX, y, 10, 10);
      }*/
      background(245, 0, 0);  //FOR CROSSHAIRS
      fill(255);
      noStroke();
      rect(preyColony[i].myX - 1, preyColony[i].myY - 40, 3, 15);
      rect(preyColony[i].myX - 1, preyColony[i].myY + 25, 3, 15);
      rect(preyColony[i].myX - 40, preyColony[i].myY - 1, 15, 3);
      rect(preyColony[i].myX + 25, preyColony[i].myY - 1, 15, 3);
      deathTotal ++;
      preyColony[i].signal = false;
    }   
  }
  if(mousePressed == true) {
      fill(255);
      noStroke();
      rect(mouseX - 1, mouseY - 40, 3, 15);
      rect(mouseX - 1, mouseY + 25, 3, 15);
      rect(mouseX - 40, mouseY - 1, 15, 3);
      rect(mouseX + 25, mouseY - 1, 15, 3);
      ellipse(mouseX, mouseY, 2, 2);
   } else {
      fill(255);
      noStroke();
      rect(mouseX - 1, mouseY - 30, 3, 15);
      rect(mouseX - 1, mouseY + 15, 3, 15);
      rect(mouseX - 30, mouseY - 1, 15, 3);
      rect(mouseX + 15, mouseY - 1, 15, 3);
   }
   if(deathTotal == preyColony.length) {
     gameOver = true;
     textSize(30);
     text("GAME OVER", 400, 330);
   }
   textSize(12);
   text("kill count: " + playerKillCount, 900, 670);
}

void keyPressed() {  
  for(int i = 0; i < preyColony.length; i++) //TO RESPAWN COLORFUL CIRCLES
    preyColony[i].dead = false;
  for(int i = 0; i < predators.length; i++) //TO RESPAWN RED CIRCLES
    predators[i].dead = false;
  deathTotal = 0;
  playerKillCount = 0;
}

class Prey {  //COLORFUL CIRCLES
  int myX, myY, step, myR, myG, myB;
  boolean dead, signal;

  Prey(int r, int g, int b) {
    myX = (int)(Math.random()*50)*20;
    myY = (int)(Math.random()*35)*20;
    myR = r;
    myG = g;
    myB = b;
    step = 1;
    dead = signal = false;
  }

  void move() {
    if(myX <= 0)
      myX += 20;
    if(myX >= 1000)
      myX -= 20;
    if(myY <= 0)
      myY += 20;
    if(myY >= 700)
      myY -= 20;
    if(step == 1) {
      myX = myX + ((int)(Math.random()*3)-1)*20;
      step = 2;
    }
    else if(step == 2) {
      myY = myY + ((int)(Math.random()*3)-1)*20;
      step = 1;
    }
  }

  void show() {
    if((get(myX, myY) == color(255, 0, 0))&&(dead == false))
      dead = signal = true;
    if(dead == false) {
      stroke(myR, myG, myB);
      strokeWeight(3);
      noFill();
      ellipse(myX, myY, 10, 10);
    }
  }
}

class Predator {  //RED CIRCLES
  int myX, myY, step;
  boolean dead, signal;

  Predator() {
    myX = (int)(Math.random()*50)*20;
    myY = (int)(Math.random()*35)*20;
    step = 1;
    dead = signal = false;
  }

  void move() {
    if(myX <= 0)
      myX += 20;
    if(myX >= 1000)
      myX -= 20;
    if(myY <= 0)
      myY += 20;
    if(myY >= 700)
      myY -= 20;
    if(step == 1) {
      myX = myX + ((int)(Math.random()*3)-1)*20;
      step = 2;
    }
    else if(step == 2) {
      myY = myY + ((int)(Math.random()*3)-1)*20;
      step = 1;
    }
  }

  void show() {
    if((mousePressed == true)&&(((mouseX >= myX - 13)&&(mouseX <= myX + 13))&&((mouseY >= myY - 13)&&(mouseY <= myY +13)))&&(dead == false)&&(gameOver == false))
      dead = signal = true;
    if(dead == false) {
      noStroke();
      fill(255, 0, 0);
      ellipse(myX, myY, 13, 13);
    }
  }
}