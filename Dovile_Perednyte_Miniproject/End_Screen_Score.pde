//The tab has been made to store the needed self-defined functions
//That includes the game stages (start, main, end) and their displays as well as score count function.


boolean gameStage = false; //begins at starting game screen

float titleTextX = 160, titleTextY = 200; //startgame title text position
float instrTextX = 310, instrTextY = 270; //startgame instructions text position
float arrowTextX = 80, arrowTextY = 300;  //startgame arrow keys explanation text position
float pressTextX = 175, pressTextY = 450; //startgame begin text position

float yourScoreX = 180, yourScoreY = 250; //end score text's position
float endScoreX=460; //losing end score text's position 
float winScoreX = 200, winScoreY = 310; //winning end score text's position

float scoreX, scoreY, scoreH=40; //bottom score bar's position while playing
float scoreTextX = 290, scoreCountX = 370, scoreTextH = 10;//position of the bottom text displaying the score while playing


void score() { //bottom score bar and score visual display

  noStroke();
  fill(#82DB86);
  rect(scoreX, height-scoreH, width, scoreH); //Y coordinate is the height minus height of the rectangle, so it can always be at the bottom of the screen
  fill(#646464);
  textSize(26);

  text("Score: ", scoreTextX, height-scoreTextH);
  text(score, scoreCountX, height-scoreTextH); //bottom score text display position
}


void mousePressed() { // if we are on the initial/startgame stage when clicked, starts the game screen
  if (gameStage == false) {
    startGame();
  }
}


void startGame() { //triggers the main game screen when mouse is clicked
  gameStage=true;
}



void startscreen() { //display/visuals of the start screen with the text
  background(#94D691);
  fill(255);
  textSize(50);
  text("BREAKOUT GAME", titleTextX, titleTextY); //title text


  fill(#484848);
  textSize(18);
  text("Instructions:", instrTextX, instrTextY); //instructions text


  fill(#484848);
  textSize(24);
  text("Use left and right arrow keys to control the paddle", arrowTextX, arrowTextY); //arrow keys text


  fill(#C60404);
  textSize(28); 
  text("PRESS ANYWHERE TO BEGIN", pressTextX, pressTextY); //"begin" text
}


void endscreen() { //end screen function

  //end screen if the player loses
  if (ball.ballpos.y >= height-scoreH) { //if the ball hits the top of the bottom score box
    bg_music.pause(); //the music stops playing

    background(#EDABA0);
    fill(0);
    textSize(46);
    text("Your score: ", yourScoreX, yourScoreY);
    fill(#D81818);
    text(score, endScoreX, yourScoreY); //displays final score

    noLoop();
  }

  //end screen if the player reaches the max score and as a result wins the game
  else if (score == TTiles_total * 10) {  //calculates the max score you can get, one tile gives +10 score
    bg_music.pause(); //the music stops playing

    background(#A0EDA3);
    fill(0);
    textSize(42);
    text("Congratulations!", yourScoreX, yourScoreY);

    fill(0);
    textSize(34);
    fill (#18D622);
    text("You won the game", winScoreX, winScoreX);   

    noLoop();
  }
}
