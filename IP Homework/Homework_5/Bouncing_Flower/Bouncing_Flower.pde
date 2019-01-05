Flower myFlower1;
Flower myFlower2;


  int _r1=60; // radius of the flower
  int _petals=7; // number of flower petals
  float _x=width;
  float _y=height;
  int _petalColor=#FFA000;
  int _xspeed = 10; // x coordinate of flower movement
  int _yspeed = 10; // y coordinate of flower movement 

void setup(){
  size (1200,800);
 myFlower1 = new Flower(_r1, _petals, _x, _y, _petalColor, _xspeed, _yspeed);
 
 //2nd flower is slightly faster and starts from different position
 myFlower2 = new Flower(_r1, _petals, _x+random(200,500), _y+random(200,500), _petalColor, _xspeed+4, _yspeed+4); 
}

void draw(){
  background(#43AF76);
  myFlower1.display();
  myFlower1.move();
  myFlower1.bounce();
  
  myFlower2.display();
  myFlower2.move();
  myFlower2.bounce();
  
  
  
}
