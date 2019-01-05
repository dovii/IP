class Flower {

  float r; // radius of the flower
  int n_petals;
  float x; 
  float y;
  int petalColor; 
  int xspeed; // x coordinate of flower movement
  int yspeed;// y coordinate of flower movement


  Flower(float temp_r, int temp_n_petals, float temp_x, float temp_y, int temp_petalColor, int temp_xspeed, int temp_yspeed) { //placeholders

    r=temp_r;
    n_petals = temp_n_petals;
    x=temp_x;
    y=temp_y;
    petalColor=temp_petalColor;
    xspeed=temp_xspeed;
    yspeed=temp_yspeed;
  }


  void display() {
    float flowerX;
    float flowerY;

    fill(#4C5BB7);
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {
      flowerX=x + r*cos(i);
      flowerY=y + r*sin(i);
      ellipse(flowerX, flowerY, r, r);
    }

    fill(200, 0, 0);
    ellipse(x, y, r*1.2, r*1.2);
  }


  void move() {
    x += xspeed; //the movement of flower on X coordinate increases according to the xspeed
    y += yspeed; //the movement of flower on X coordinate increases according to the yspeed
  }

  void bounce() {
    float d = dist(myFlower1.x, myFlower1.y, myFlower2.x, myFlower2.y); //distance between both radius of the flowers. 

    if (x > width - r || x < r || d < myFlower1.r + myFlower2.r) { //changes X direction if: the flower reaches border, x=0 , touches another flower (distance between both radius is negative). Minus the radius of the flower so it stays in frame.
      xspeed = xspeed * -1;  
    }

    if (y > height - r|| y < r || d < myFlower1.r + myFlower2.r) { //changes Y direction if: the flower reaches border, y=0, touches another flower (distance between both radius is negative). Minus the radius of the flower so it stays in frame.
      yspeed = yspeed * -1;
    }
  }
}
