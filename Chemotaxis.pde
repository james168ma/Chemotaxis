Prey[] preyColony;
Predator[] predators = new Predator[10];
int predIndex = 0;
void setup() {
  size(1000, 700);
  background(0);
  preyColony = new Prey[1000];
  for (int i = 0; i < preyColony.length; i++) 
    preyColony[i] = new Prey();
  for (int i = 0; i < predators.length; i++) 
    predators[i] = new Predator();
}

void draw() {
  fill(0, 0, 0, 30);
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
  int myX, myY, size, step;

  Prey() {
    myX = (int)(Math.random()*10)*100;
    myY = (int)(Math.random()*7)*100;
    size = 15;
    step = 1;
  }

  void move() {
    if(step == 1) {
      myX = myX + (int)(Math.random()*31)-15;
      step = 2;
    }
    else if(step == 2) {
      myY = myY + (int)(Math.random()*31)-15;
      step = 1;
    }
  }

  void show() {
    stroke(0, 255, 0);
    strokeWeight(3);
    noFill();
    ellipse(myX, myY, size, size);
  }
}

class Predator {
  int myX, myY, size;

  Predator() {
    myX = (int)(Math.random()*1001);
    myY = (int)(Math.random()*701);
    size = (int)(Math.random()*10)+5;
  }

  void move() {
    myX = myX + (int)(Math.random()*3)-1;
    myY = myY + (int)(Math.random()*3)-1;
  }

  void show() {
    noStroke();
    fill(255, 0, 0);
    ellipse(myX, myY, size, size);
  }
}