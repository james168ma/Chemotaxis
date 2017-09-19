void setup() {
  size(500, 500);
}

void draw() {
  
}

class Bacteria {
  int myX;
  int myY;
  int bacColor;
  
  Bacteria() {
    myX = myY = 250;
    bacColor = (int)(Math.random()*256);
  }
}