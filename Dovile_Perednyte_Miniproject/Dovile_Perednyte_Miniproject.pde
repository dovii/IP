BBall ball; //BouncingBall class
PPaddle paddle; //PlayerPaddle class
TTiles[] tiles; //TopTiles array

import ddf.minim.*; //using the minim sound library as due to its better compatibility with Processing
Minim minim; //initiating minim library class
AudioPlayer hit_sound; //loading the classes used for sound with minim library
AudioPlayer bg_music;
PImage img; //initiates the pre-defined Processing class - PImage

int row_total = 7; //number of rows for the tiles
int columns_total = 12; //number of columns for the tiles
int TTiles_total = row_total * columns_total; //calculates the total number of tiles

int score; //score counter

//Top Tile's parameters - Y (10, so it spawns away from the corner of the screen), width, height
float TTiles_Y = 10;
float TTiles_W = 60;
float TTiles_H = 20;
int anum = 0;  //tiles array number / index position


//Bouncing Ball's parameters - random X, random Y positions, radius, movement speed
float BBall_X = random(200, 500);
float BBall_Y = random(300, 500);
float BBall_R = 14;
float BBall_Speed = 5;


//Player Paddle's parameters - X, Y, width, height, movement speed
float PPaddle_X = 200;
float PPaddle_Y = 530;
float PPaddle_W = 100;
float PPaddle_H = 15;
float PPaddle_Speed = 5;


void setup() {

  size(740, 600);

  img=loadImage("bg-image.jpg"); //loading the background image

  minim = new Minim(this);
  hit_sound = minim.loadFile("hit_sound.wav");    //loading the hit sound file
  bg_music = minim.loadFile("bg_music.mp3");    //loading the background music file
  bg_music.loop();     //the background music plays again (loops) when/if it ends


  // Spawns bouncing ball, player paddle and array of tiles
  ball = new BBall(BBall_X, BBall_Y, BBall_R, BBall_Speed, -BBall_Speed); //y speed is negative because the ball goes up when it spawns
  paddle = new PPaddle(PPaddle_X, PPaddle_Y, PPaddle_W, PPaddle_H, PPaddle_Speed);

  tiles = new TTiles[TTiles_total];


  //declares the position of all of the tiles, initialises the array to show every single tile from the array
  //Puts the array tiles in a position of a 7 x 12 block, later the tiles class takes up the "spots" that are drawn/located by this array for loop.
  for (int row = 0; row < row_total; row++) {  //draws up to 7 rows of tiles

    float TTiles_X = 10; // tiles spawn at X=10 position (not at the corner of the screen)
    for (int column = 0; column < columns_total; column++) { //draws up to 12 columns of tiles

      tiles[anum] = new TTiles(TTiles_X, TTiles_Y, TTiles_W, TTiles_H); 
      anum++;
      TTiles_X += TTiles_W; //the new tile's x position changes - goes right according to the tile's width
    }

    TTiles_Y += TTiles_H; //the new tile's y position changes - goes down according to the tile's height
  }
}

void draw() {

  if (gameStage == 0) { //displays a start screen (stage 0 is startgame screen)
    startscreen();
  } else if (gameStage == 1) { //displays the main game screen (stage 1 is main gameplay screen)
    maingameStage();
  } else if (gameStage == 2) { //displays the end screen (stage 2 is endgame screen)
    endscreen();
  }
}


void maingameStage() { //the main game screen

  image(img, 0, 0);
  img.resize(width, height); //loads the background image and resizes it to fit the screen

  score(); //initiates the score counting function

  ball.display();    //displays the ball that bounces off the paddle and hits tiles
  paddle.display();  //displays the player-controlled paddle

  ball.movement();   //initialises uncontrolled ball movement
  paddle.movement(); //allows the paddle move with arrow keys (left and right)


  for (int i = 0; i < tiles.length; i++) { 
    tiles[i].display(); //displays the tiles
    tiles[i].collide(); //initiates the tiles' collision function
  }

  endscreen();   //calls the end screen function if the player wins or losses
}
