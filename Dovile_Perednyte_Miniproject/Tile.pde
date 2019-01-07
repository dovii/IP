class TTiles {

  PVector tileloc; // position of the tile (x and y)
  float w; //width of the tile
  float h; //height of the tile
  float hitbox = 3; //size of the hitbox of the tile
  color tileColor;

  boolean tilehit; // tiles hit by the ball. False is "not hit yet" or "untouched", true is "hit"

  TTiles(float tempX, float tempY, float tempW, float tempH) { //Top Tile constructor
    tileloc = new PVector (tempX, tempY);
    w = tempW;
    h = tempH;
    tileColor = color(random(0, 256), random(0, 256), random(0, 256));
    tilehit = false; //the tile has not been hit
  }

  void display() {

    if (!tilehit) // only draw if the tiles haven't been hit (tiles are untouched). That is the case in the beginning.
    {
      fill(tileColor);
      stroke(0);
      rect(tileloc.x, tileloc.y, w, h); //meaning that in the beginning, all the tiles are displayed
    }
  }


  void collide() {
    //if tilehit = false, then it is set to true by the if statements when the conditions are fulfilled
    //if/when tilehit = true, then the rest of the function is not checked and it's only run to that point.
   
    if (tilehit) {       //when the tile gets it by the ball
      return;            //makes sure that the function is stopped from running, so the score doesn't keep going up
    }

    // checks if the ball has hit the top of the tile
    if (ball.ballpos.x + ball.r > tileloc.x && //ball hits the area starting from top left corner of the tile
      ball.ballpos.x - ball.r < tileloc.x + w && //ball hits the area starting from top right corner of the tile
      abs(ball.ballpos.y + ball.r - tileloc.y) < hitbox) { //hitbox on the Y axis

      tilehit = true; //if all of the statemens are fulfilled, the tile has been hit
      ball.bounceUp();
    }


    // checks if the ball has hit the bottom of the tile
    if (ball.ballpos.x + ball.r > tileloc.x && //ball hits the area starting from bottom left corner of the tile
      ball.ballpos.x - ball.r < tileloc.x + w && //ball hits the area starting from bottom right corner of the tile
      abs(ball.ballpos.y - ball.r - tileloc.y - h) < hitbox) { //hitbox on the Y axis

      tilehit = true; //if all of the statemens are fulfilled, the tile has been hit
      ball.bounceDown();
    }


    // checks if the ball has hit the left side of the tile
    if (ball.ballpos.y + ball.r > tileloc.y && //ball hits the area starting from left side of the tile
      ball.ballpos.y - ball.r < tileloc.y + h && //ball hits the area starting from right side of the tile
      abs(ball.ballpos.x + ball.r - tileloc.x) < hitbox) { //hitbox on the X axis

      tilehit = true; //if all of the statemens are fulfilled, the tile has been hit
      ball.bounceLeft();
    }


    // checks if the ball has hit the right side of the tile
    if (ball.ballpos.y + ball.r > tileloc.y && //ball hits the area starting from left side of the tile
      ball.ballpos.y - ball.r < tileloc.y + h && //ball hits the area starting from right side of the tile
      abs(ball.ballpos.x - ball.r - tileloc.x - w) < hitbox) { //hitbox on the X axis

      tilehit = true; //if all of the statemens are fulfilled, the tile has been hit
      ball.bounceRight();
    }


    if (tilehit == true) { //when the tile disappears (gets hit by a ball)
      score+=10;            //player gets 10 points  
      hit_sound.rewind();   //resets the sound so it can play every time it fulfils the if statement
      hit_sound.play();     //the sound plays
    }
  }
}
