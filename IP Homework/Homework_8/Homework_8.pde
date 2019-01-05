float r = 0; //radius/length of the "turn" on to the polar coordinate system
float theta = 5; //the theta (angle) of the turn in the polar coordinate system
float t; //time interval, used with Perlin Noise
int particleRadius = 30; //the size/radius of the particles 
float blue = 20; //particles' colour, shade of blue

void setup() {
    size(800, 800);
    background(#CECECE);
}

void draw() {
    float x = r * cos(theta); //getting the X coordinate from the polar coordinate system with r and theta
    float y = r * sin(theta); //getting the Y coordinate from the polar coordinate system with r and theta


    fill(0, 0, blue);
    noStroke();
    
    //ellipse is drawn in the center of the screen, the particles gradually get bigger and smaller following the Perlin Noise 
    ellipse(x+width/2, y+height/2, noise(r)*particleRadius, noise(r)*particleRadius);
   

    r += 0.5; //gradually increases the radius of the "turn"
    theta += 0.1; //the theta angle increases
    
    t += 0.01; 
    blue += noise(t)/2;  //the colour becomes lighter following the increasing noise value over time
    
}
