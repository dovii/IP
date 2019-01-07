class BBall
{
  PVector ballpos; // position of the ball (x and y)
  PVector ballvel; // speed/velocity/direction of movement of the ball (xspeed and yspeed)
  float r; //radius of the ball

  BBall(float tempX, float tempY, float tempR, float tempSpeedX, float tempSpeedY) { //Bouncing Ball constructor
    ballpos = new PVector (tempX, tempY);
    ballvel = new PVector (tempSpeedX, tempSpeedY);
    r = tempR;
  }


  void display() { //displays the ball
    stroke(0);
    fill(255, 0, 0);
    ellipse(ballpos.x, ballpos.y, r, r);
  }


  void movement() //gives the ball movement speed on X and Y axis
  {
    ballpos.add(ballvel); //same as x+=xspeed and y+=yspeed


    //if statements to check if the ball hits left or right wall, top of the screen or top tiles to bounce off
    //not applicable for the the floor, because in that case the game is over

    if (ballpos.x < r) { //ball bounces right if its xpos is smaller than its radius (the ball's side hits the left wall)
      bounceRight();
    }


    if (ballpos.x > width - r) { //ball bounces left if its xpos is bigger than the width minus its radius (the ball's side hits the right wall)
      bounceLeft();
    }


    if (ballpos.y < r) { //ball bounces down if its ypos is smaller than its radius (the ball's side hits the top wall or collides with a tile)
      bounceDown();
    }


    // the ball bounces up only if it hits the paddle if all of these statements are fulfilled:
    if (ballpos.y + r > PPaddle_Y && //the ball is above of the paddle / hits the top of it (the ball can't hit the bottom side of the paddle)
      ballpos.x + r > paddle.paddlepos.x && //the ball hits the area starting from the right corner of the paddle
      ballpos.x - r < paddle.paddlepos.x + PPaddle_W) { //the ball hits the area starting from the left corner of the paddle

      bounceUp();
    }
  }


  //bounce functions, when the ball has to bounce in different directions (left, right, up, down)

  void bounceLeft() {
    ballvel.x = -abs(ballvel.x);  //The x gets an opposite value as it hits the right wall/tile. Starts with +x, ends in -x after the bounce
  }

  void bounceRight() {
    ballvel.x = abs(ballvel.x);  //The x gets an opposite value as it hits the left wall/tile. Starts with -x, ends in +x after the bounce
  } 

  void bounceUp() {
    ballvel.y = -abs(ballvel.y); //The y gets an opposite value as it hits the paddle. Starts with +y, ends in -y after the bounce
  }

  void bounceDown() {
    ballvel.y = abs(ballvel.y);  //The y gets an opposite value as it hits the top wall/tile. Starts with +y, ends in -y after the bounce
  }
}
