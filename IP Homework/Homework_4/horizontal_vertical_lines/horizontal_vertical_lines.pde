int x; //the beginning X coordinate of the line
int y; //the beginning Y coordinate of the line
int endX=800; //the ending X coordinate of the line
int endY=800; //the ending Y coordinate of the line
int d=60; //distance between the lines

void setup(){
size(500,500);
background(125);

//HORIZONTAL LINES
 for (int stepY = 0; stepY < endY; stepY+=d) { //gives a position with spacing
    stroke(#FFFFFF);
    line(x, stepY, endX, stepY); //draws a line according to the given position


//VERTICAL LINES
 for (int stepX = 0; stepX < endX; stepX+=d) { //gives a position with spacing
    stroke(#7EFF48);
    line(stepX, y, stepX, endY); //draws a line according to the given position
    
 }
}
}
