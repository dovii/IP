int rectX=200; //rectangle's X position
int rectY=200; //rectangle's Y position
int rectS=200; //recangle's size (both width and height)
float speed=random(2,5);   //speed of the movement
int direction=-1;  //the direction of movement

void setup(){
  size(800,500);
}

void draw(){
  background(#78D0D8);
  
  fill(#F1B2FF);
  rect(rectX,rectY,rectS,rectS); //draws the pink rectangle

  
rectX+=speed; //movement of the rectangle

if(rectX>width-rectS){  //if x coordinate of rect is bigger than width minus rectangle's size
  speed*=direction;     //the rectangle changes direction (speed becomes -5)
  }
  
  if(rectX<0){          //if rectangle's X coordinate is smaller than 0
    speed*=direction;   //the rectangle changes direction (speed becomes 5)
  }
}
