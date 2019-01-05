size(400,500);
background(#90FAFF); // bg


fill(#986911);
rect(80, 200, 250, 200); //base


fill(#E01010);
triangle(80, 200, 330, 200, 200, 75); //roof


fill(#18B95A);
rect(0,400,1000,200); //grass/ground


fill(#1BB8BF);
rect(110, 230, 50, 50); //window 1
line(135,230,135,280);
line(110,255,160,255);


fill(#1BB8BF);
rect(250, 230, 50, 50); //window 2
line(275,230,275,280);
line(250,255,300,255);

fill(#E4A0FF);
rect(170, 300, 70, 100); //door
fill(#C953AC);
ellipse(183, 355, 10, 10);


fill(0, 102, 153); //text
textSize(32);
text("This is a house",20,40);
