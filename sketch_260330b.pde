// checkpoint 1 colour selector=========================

color lightBeige = #FFD78F;
color blue = #3061E3;
color red = #DA2528;
color green = #319938;

// selection
color selectedColour;


void setup() {
  size(600, 600);
  background(lightBeige);
  strokeWeight(3);
  stroke(0);
  selectedColour = blue;
} //setup end------------


void draw() {
  background(lightBeige);
  fill(selectedColour);
  stroke(0);
  rect(100, 50, 400, 300);

  //button
  select(100, 450, 50);
  fill(blue);
  circle(100, 450, 100);

  select(300, 450, 50);
  fill(red);
  circle(300, 450, 100);

  select(500, 450, 50);
  fill(green);
  circle(500, 450, 100);
} // draw end-------------

void select(int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(255);
  } else {
    stroke(0);
  }
}

void mouseReleased() {
  if (dist(100, 450, mouseX, mouseY) < 50) {
    selectedColour = blue;
  }
  if (dist(300, 450, mouseX, mouseY) < 50) {
    selectedColour = red;
  }
  if (dist(500, 450, mouseX, mouseY) < 50) {
    selectedColour = green;
  }
}
