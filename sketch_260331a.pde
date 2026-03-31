// checkpoint 2 rectangle button======================
color lightBeige = #FFD78F;
color blue = #3061E3;
color red = #DA2528;
color green = #319938;

// selection
color selectedColour;


void setup(){
  size(600, 600);
  background(lightBeige);
  strokeWeight(5);
  stroke(0);
  selectedColour = blue;
} //end of setup---------------

void draw(){
  fill(selectedColour);
  stroke(0);
  rect(100, 50, 400, 300);

  //button
  select(50, 450, blue);

  select(250, 450, red);

  select(450, 450, green);
  
}

void select(int x, int y, color c) {
  if (mouseX > x && mouseX < x + 100 && mouseY > y && mouseY < y + 100) {
    stroke(255);
  } else {
    stroke(0);
  }
  fill(c);
  square(x, y, 100);
}

void mouseReleased(){
  if (mouseX > 50 && mouseX < 150 && mouseY > 450 && mouseY < 550){
    selectedColour = blue;
  }
  if (mouseX > 250 && mouseX < 350 && mouseY > 450 && mouseY < 550){
    selectedColour = red;
  }
  if (mouseX > 450 && mouseX < 550 && mouseY > 450 && mouseY < 550){
    selectedColour = green;
  }
}
