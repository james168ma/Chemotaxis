Prey[] preyColony;
void setup() {
  size(1000, 700);
  preyColony = new Prey[1000];
  for (int i = 0; i < preyColony.length; i++) {
    preyColony[i] = new Prey();
  }
}

void draw() {
  background(0);
  for(int i = 0; i < preyColony.length; i++)
  {
    preyColony[i].show();
    preyColony[i].move();
  }
}

class Prey {
  int myX, myY, g, size;

  Prey() {
    myX = (int)(Math.random()*1001);
    myY = (int)(Math.random()*701);
    g = (int)(Math.random()*156)+100;
    size = (int)(Math.random()*10)+5;
  }

  void move() {
    myX = myX + (int)(Math.random()*3)-1;
    myY = myY + (int)(Math.random()*3)-1;
  }

  void show() {
    noStroke();
    fill(0, g, 0);
    ellipse(myX, myY, size, size);
  }
}

class Predator {
  int myX, myY, r, size;

  Predator() {
    myX = (int)(Math.random()*1001);
    myY = (int)(Math.random()*701);
    r = (int)(Math.random()*156)+100;
    size = (int)(Math.random()*10)+5;
  }

  void move() {
    myX = myX + (int)(Math.random()*3)-1;
    myY = myY + (int)(Math.random()*3)-1;
  }

  void show() {
    noStroke();
    fill(r, 0, 0);
    ellipse(myX, myY, size, size);
  }
}