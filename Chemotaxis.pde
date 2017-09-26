Prey[] preyColony;
Predator[] predators = new Predator[10];
int predIndex = 0;
void setup() {
  size(1000, 700);
  frameRate(60);
  background(0);
  preyColony = new Prey[200];
  for (int i = 0; i < preyColony.length; i++) 
    preyColony[i] = new Prey();
  for (int i = 0; i < predators.length; i++) 
    predators[i] = new Predator();
}

void draw() {
  fill(0, 0, 0, 30);
  noStroke();
  rect(0, 0, 1000, 700);
  for(int i = 0; i < preyColony.length; i++)
  {
    preyColony[i].show();
    preyColony[i].move();
  }
  for(int i = 0; i < predators.length; i++)
  {
    predators[i].show();
    predators[i].move();
  }
  
}
class Prey {
  int myX, myY, step;
  boolean dead;

  Prey() {
    myX = (int)(Math.random()*50)*20;
    myY = (int)(Math.random()*35)*20;
    step = 1;
    dead = false;
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
    if(get(myX, myY) != color(0))
    {
      dead = true;
    }
    if(dead == false) {
      stroke(0, 255, 0);
      strokeWeight(3);
      noFill();
      ellipse(myX, myY, 10, 10);
    }
  }
}

class Predator {
  int myX, myY, step;

  Predator() {
    myX = (int)(Math.random()*50)*20;
    myY = (int)(Math.random()*35)*20;
    step = 1;
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
    noStroke();
    fill(255, 0, 0);
    ellipse(myX, myY, 13, 13);
  }
}