class Flower {

  float r=40; // radius of the flower
  int n_petals = 7; //number of petals
  float x; //x coordinate of the flower
  float y; //y coordinate of the flower


  Flower(float temp_x, float temp_y) { //placeholders
    x=temp_x;
    y=temp_y;
  }


  void display() {
    float flowerX; //X coordinate of flower's petals
    float flowerY; //Y coordinate of flower's petals

    fill(#4C5BB7);
    for (float i=0; i<PI*2; i+=2*PI/n_petals) { //making the flower's petals
      flowerX=x + r*cos(i);
      flowerY=y + r*sin(i);
      ellipse(flowerX, flowerY, r, r);
    }

    fill(200, 0, 0);
    ellipse(x, y, r*1.2, r*1.2);
  }
}
