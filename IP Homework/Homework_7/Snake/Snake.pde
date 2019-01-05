int arrnum = 30; //array number 
Flower[] myFlower1 = new Flower[arrnum]; //array of flowers
int[] x = new int[arrnum];
int[] y = new int[arrnum];
int indexpos = 0; //array's index position


void setup() { 
  size(1000, 800);
}

void draw() {
  background(#4D8E51);
  
  x[indexpos] = mouseX; //array of previous mouseX positions
  y[indexpos] = mouseY; //array of previous mouseY positions
  
  indexpos = (indexpos + 1) % arrnum; //makes the shift in array number for x and y (mouseX and mouseY
  
  for (int j=0; j < arrnum; j++){
    int position = (indexpos + j) % arrnum; //makes a shift in the array number for the flower
    
    myFlower1[position] = new Flower (x[position], y[position]); //creates flowers according to their array numbers
    myFlower1[position].display();
  }
} 
