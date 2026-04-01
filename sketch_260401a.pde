// checkpoint 3 vertical slider-------------------------

float sliderY;
float r;

void setup() {
  size(600, 600);
  sliderY = 300;
  r = 100;
}

void draw() {
  background(#FFD78F);
  strokeWeight(10);
  line(100, 50, 100, 550);
  circle(100, sliderY, 50);
  strokeWeight(5);
  circle(350, 300, r);
}

void mouseDragged() {
  controlSlider();
}

void mouseReleased() {
  controlSlider();
}

void controlSlider() {
  if (mouseX > 75 && mouseX < 125 && mouseY > 50 && mouseY < 550) {
    sliderY = mouseY;
  }
  r = map(sliderY, 50, 550, 0, 400);
}

 
