float x, y, speedX, speedY; // ball's coordinates and movement speed  //<>//
float ball = 15; //ball's radius 
float racX=650, racH=150, racW=15; //position of player-controlled right racket
float wallX=50, wallY=0, wallW=25; //position of left AI racket
float faster=1.1; //speed increase
float dirchange = -1; //changes the direction of the movement
float end_scoreW=220, end_scoreH=220; //end score text's position

float recttopR=0, rectbotR=10; //making the top score bar's angles more round
float scoreX=320, scoreY=0, scoreW=80, scoreH=40; //top score bar position

int score; //score count


void setup() {
  size(700, 500);
  reset();
}

void reset() { //begins the game
  fill(255, 0, 0);
  x=width/3;   //ball comes from 1/3 part of the screen
  y=height/3;
  speedX=random(3, 5); //speed starts at a random number between 3 and fine when the game is run
  speedY=random(3, 5);
  score=0; //starts score from 0
}


void draw() {
  background(#FFC4A0);
  
  
  noStroke();
  fill(#9EA9F5);
  rect(scoreX, scoreY ,scoreW , scoreH, recttopR, recttopR, rectbotR, rectbotR);
  fill(0);
  textSize(32);
  text(score, scoreX+20, 34); //score bar and score display


  stroke(#C65450);
  fill(#D84F48);
  ellipse(x, y, ball, ball);               //ball;
  rect(racX, mouseY-racH/2, racW, racH);   //right player's racket
  rect(wallX, y-racH/2, racW, racH);       //left AI racket


  x += speedX; // ball movement on X coordinate
  y += speedY; // ball movement on Y coordinate
  

  if (y>=height || y<ball) { //ball bounces back when hits top or bottom
    speedY*=dirchange;
  }


  if (x>racX && x<width-racW-ball && y>mouseY-racH/2 && y<mouseY+racH/2) { //when the ball hits right/controlled racket
    speedX*=dirchange;  //ball bounces back / changes direction
    speedX*=faster; //ball's speed increases
    score++;  //score increases by one
  }




  if (x<wallX+wallW) { //ball bounces back and its speed increases faster when it hits the left (AI) raracket
    speedX*=dirchange;
    speedX*=faster;
  }



  if (x>width) { //initialises end screen
    background(#9EA9F5);
    fill(0);
    textSize(40);
    text("Your score: ", end_scoreW, end_scoreH); 
    fill(#D81818);
    text(score, end_scoreW+230, end_scoreH);  //displays the final score
    
    fill(0);
    textSize(32);
    text("Click to try again", end_scoreW, end_scoreH+70);   //displays the text of "try again"

  }
}

  void mousePressed() { //resets the game when mouse is pressed
    reset();
  }
