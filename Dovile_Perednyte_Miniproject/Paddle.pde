class PPaddle {

  PVector paddlepos; // position of the paddle (x and y)
  float w; //width of the paddle
  float h; //height of the paddle
  float speed; // X speed of the paddle as it only moves on the X axis


  PPaddle(float tempX, float tempY, float tempW, float tempH, float tempSpeed) { //Player Paddle constructor
    paddlepos = new PVector (tempX, tempY);
    w = tempW;
    h = tempH;
    speed = tempSpeed;
  }


  void display() { //displays/draws the paddle

    stroke(0);
    fill(#A0BDED);
    rect(paddlepos.x, paddlepos.y, w, h);
  }

  void movement() {

    if (keyPressed && keyCode == RIGHT) { //the paddle moves to the right when the right arrow key is pressed
      paddlepos.x += speed;
    }

    if (keyPressed && keyCode == LEFT) { //the paddle moves to the left when the left arrow key is pressed
      paddlepos.x -= speed;
    }

    // The constrain() function puts a value between two limits (in this case, between both sides of the screen)
    // It is done so the Paddle doesn't go out of screen boundaries
    paddlepos.x = constrain(paddlepos.x, 0, width - w);
  }
}
