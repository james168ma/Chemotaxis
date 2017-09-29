Prey[] preyColony = new Prey[100];
Predator[] predators = new Predator[36];
int playerKillCount = 0;
int deathTotal = 0;
int diffIndex = 1;
boolean startScreen = true, gameOver = true;
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
  if(gameOver == false) {   //SHOWING PREDATORS
    for(int i = 0; i < predators.length/diffIndex; i++) {
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
  }
  for(int i = 0; i < preyColony.length; i++) {   //SHOWING PREY
    preyColony[i].show();
    preyColony[i].move();
    if(preyColony[i].signal == true) {
      background(205, 0, 0);  //FOR CROSSHAIRS
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
  if(startScreen == true) {//STARTING SCREEN
    textSize(30);
    fill(255);
    text("CLICK TO CHOOSE DIFFICULTY", 275, 200);
    if((mouseX <= 325 && mouseX >= 275)&&(mouseY <= 300 && mouseY >= 250))
      textSize(45);
    else
      textSize(30);
    text("EZ", 275, 300);
    if((mouseX <= 535 && mouseX >= 475)&&(mouseY <= 300 && mouseY >= 250))
      textSize(45);
    else
      textSize(30);
    text("MED", 475, 300);
    if((mouseX <= 725 && mouseX >= 675)&&(mouseY <= 300 && mouseY >= 250))
      textSize(45);
    else
      textSize(30);
    text("KYS", 675, 300);
      if((mouseX <= 325 && mouseX >= 275)&&(mouseY <= 300 && mouseY >= 250)&&(mousePressed == true)) {
        diffIndex = 3;
        for(int i = 0; i < preyColony.length; i++) //TO RESPAWN COLORFUL CIRCLES
          preyColony[i].dead = false;
        for(int i = 0; i < predators.length/diffIndex; i++) //TO RESPAWN RED CIRCLES
          predators[i].dead = false;
        deathTotal = 0;
        playerKillCount = 0;
        gameOver = startScreen = false;
      }
      if((mouseX <= 535 && mouseX >= 475)&&(mouseY <= 300 && mouseY >= 250)&&(mousePressed == true)) {
        diffIndex = 2;
        for(int i = 0; i < preyColony.length; i++) //TO RESPAWN COLORFUL CIRCLES
          preyColony[i].dead = false;
        for(int i = 0; i < predators.length/diffIndex; i++) //TO RESPAWN RED CIRCLES
          predators[i].dead = false;
        deathTotal = 0;
        playerKillCount = 0;
        gameOver = startScreen = false;
      }
      if((mouseX <= 735 && mouseX >= 675)&&(mouseY <= 300 && mouseY >= 250)&&(mousePressed == true)) {
        diffIndex = 1;
        for(int i = 0; i < preyColony.length; i++) //TO RESPAWN COLORFUL CIRCLES
          preyColony[i].dead = false;
        for(int i = 0; i < predators.length/diffIndex; i++) //TO RESPAWN RED CIRCLES
          predators[i].dead = false;
        deathTotal = 0;
        playerKillCount = 0;
        gameOver = startScreen = false;
      }
  }
  if(mousePressed == true) { //PLAYER'S CROSSHAIRS
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
     startScreen = true;
     gameOver = true;
     textSize(30);
     text("GAME OVER", 400, 430);
     textSize(12);
     //text("Press any key to play again", 405, 450);
   }
   if(playerKillCount == predators.length/diffIndex) {
     startScreen = true;
     gameOver = true;
     textSize(30);
     text("YOU WIN", 430, 430);
     textSize(12);
     //text("Press any key to play again", 420, 450);
   }
   textSize(12);
   text("kill count: " + playerKillCount, 900, 670);
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