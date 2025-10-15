Car[] bob = new Car[201];

void setup(){
  size(700,700);
  for (int i = 0; i<= 200; i++) {
    bob[i] = new Car();
  }
}

void draw(){
  background(255);
  for (int i = 0; i<= 200; i++) {
    bob[i].move();
    bob[i].show();
  }
}

class Car{
  color myC;
  float myX, myY, myXspeed;
  
  Car(){
    myC = color((int)(Math.random()*255));
    myX = 0;
    myY = (float)Math.random()*700;
    myXspeed = (float)Math.random() * 3;
  }
  
  void show(){
   rectMode(CENTER);
   fill(myC);
   rect(myX, myY, 200, 10);
  }
  
  void move(){
   myXspeed = (int)Math.abs((myY - mouseY) * 0.05);
   myX += myXspeed;
   int y = (int)Math.abs(myY - mouseY);
   int x = 200 + y;
   if(myX > x)
     myX %= x;
  }
}
