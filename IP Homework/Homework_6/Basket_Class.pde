class Basket{
  
  float x; //X coordinate of the basket
  float y; //Y coordinate of the basket
  float r; //basket's radius
  

  Basket(float tempR){ //basket constructor
    r = tempR;
  }
  
    void movement(float tempX, float tempY) { //the basket can take in mouseX and mouseY as its X and Y values and to not mess up the overlap function
    x = tempX;
    y = tempY;
    }
    
    
    void display(){ //draws the ellipse basket
    fill(#986162);
    ellipse(x, y, r, r); 

    } 
    
          
    boolean overlaps(Ball ball) {
      
 //Measures the distance between the basket and the ball and evaluates if it overlaps (when the distance is smaller than basket's and ball's radiuses combined)
       if ((dist(x, y, ball.x, ball.y)) < r/2 + ball.r/2) { 
      return true;
      
    } else {
      return false;
    }
  } 

  } 
  
