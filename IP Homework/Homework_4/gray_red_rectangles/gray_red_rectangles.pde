int stepX=60; //distance of X between rectangles //<>//
int stepY=40; //distance of Y between rectangles


void setup() {
  size(600, 400);

    for (int i = 0; i<height; i+=stepY) {  // Y starting position for for the rectangles
    for (int j = 0; j<width; j+=stepX) {   // X starting position for the rectangles
      
    fill(random(255)); //fills the rectangles a random shade of grey
    rect(j, i, stepX, stepY); //draws (grey) rectangles according to information/spacing from the loop
    }
  }
}


void draw() {
}


void mousePressed() {
  int rectX= (mouseX/stepX) * stepX; //calculates so that the mouse pos is in the X center of the grey rectangle 
  int rectY= (mouseY/stepY) * stepY; //calculates so that the mouse pos is in the Y center of the grey rectangle
  
  fill(random(255), 0, 0);
  rect(rectX, rectY, stepX, stepY); //draws new red rectangles over the old grey ones when clicked

}
