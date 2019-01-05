class Ball{
  
   float x; //x coordinate of the balls
   float y; //y coordinate of the balls
   float r; //radius of the balls
   float speed = random(2,5); //fall speed of the balls
   
     Ball(float tempX, float tempY, float tempR){ //ball constructor
     x = tempX;
     y = tempY;
     r = tempR;
     }

   void display(){
     noStroke();
     fill(0,0,255);
     ellipse (x, y, r, r);    
   }
   
   
   void fall() {
     speed += 0.005; //the fall speed slowly increases to make it more difficult
     y += speed;           

     
     if (y > height-1){    //a new line of balls spawn when the previous one reaches the bottom of the screen
     x = random(0, width);
     y = -y;      
     
   } 
   }
   

}
