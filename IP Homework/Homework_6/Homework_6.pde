// For this game, I came up with the idea first and then used "Rain Game" by Daniel Shiffman as an example and as a reference to fix errors and issues when doing it myself. 

  Ball balls;  //ball class
  Basket playerbasket; //basket class


  int baskR = 50; //basket's radius
  int score;      //player score
  
  float end_scoreX=150, end_scoreY=310; //end score text's position
float scoreX=450, scoreY, scoreW=100, scoreH=50; //top score bar position
  
  float ballX; //starting X coordinate for the balls
  float ballY = -300; //starting Y coordinate of the balls
  float ballR; //Radius of the falling balls
  
  int anum; //array number

  Ball[] ball = new Ball[20]; //array of falling particles (balls)
 

void setup(){
  size (1000,700);  
  
   
  balls = new Ball(ballX, ballY, ballR);
  playerbasket = new Basket(baskR);

    for (int i=0; i < ball.length ; i++){  //spawns the first line of balls
    
    ballX = random (0, width); //the value of ball's X is random every every time it spawns as it is in a loop
    ballR = random(20, 60);    //the value of ball's radius is random every time as it is in a loop
    
    ball[i] = new Ball(ballX, ballY, ballR);  
    }
}


void draw(){
  
  startGame();
 
}

void startGame(){
  
   background(#B2E7FF);
    
   scoredisplay();
  
    balls.display(); 
    playerbasket.display();
    playerbasket.movement(mouseX, mouseY);  //allows the basket to follow the mouse
    
    
  
   for (anum = 0; anum < ball.length; anum++ ) { //displays the array of balls that fall down
        ball[anum].display();
        ball[anum].fall();



   if (playerbasket.overlaps(ball[anum])){ //if the player hits the ball, the game ends
       noLoop();
       endscreen();
}
  
}

}
void endscreen(){
 
 if (playerbasket.overlaps(ball[anum])){ //if the player hits the ball, the game ends
 
  background(#9EA9F5);
    fill(0);
    textSize(50);
    text("You survived for", end_scoreX, end_scoreY);
     text("seconds", end_scoreX+500, end_scoreY);
    fill(#D81818);
    text(score, end_scoreX+420, end_scoreY); 
      
    }
 }
 
 void scoredisplay(){ //initialises the score count, related to the time the player has survived. 
  
  score = millis() / 1000; // Converts milliseconds to seconds.
  
  //score bar and score visual display
  noStroke();
  fill(#9EA9F5);
  rect(scoreX, scoreY ,scoreW , scoreH);
  fill(0);
  textSize(32);
  text(score, scoreX+30, 34);
}
