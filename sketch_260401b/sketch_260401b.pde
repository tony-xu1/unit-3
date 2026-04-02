// drawing app=================


//colours========================
color red = #FF0000;
color green = #00FF00;
color blue = #0000FF;
color yellow = #FFFF00;
color pink = #FF00FF;
color cyan = #00FFFF;
color black = #000000;
color white = #FFFFFF;

color canvas;
color brush;
float thick;
float sliderX;

void setup() {
  size(1300, 1000);
  background(255);
  canvas = 255;
  sliderX = 150;
}

void draw() {
  fill(#FFD78F);
  stroke(#5F4617);
  strokeWeight(5);
  rect(0, 0, 300, 1000);

  // buttons====================
  brushButton(50, 100, red);
  brushButton(50, 175, green);
  brushButton(50, 250, blue);
  brushButton(50, 325, yellow);
  brushButton(50, 400, pink);
  brushButton(50, 475, cyan);
  brushButton(50, 550, black);
  brushButton(50, 625, white);

  canvasButton(200, 100, red);
  canvasButton(200, 175, green);
  canvasButton(200, 250, blue);
  canvasButton(200, 325, yellow);
  canvasButton(200, 400, pink);
  canvasButton(200, 475, cyan);
  canvasButton(200, 550, black);
  canvasButton(200, 625, white);
  
  eraserButton(50, 775);

  //spectrum=====================
  stroke(20);
  line(50, 725, 250, 725);
  fill(0);
  circle(sliderX, 725, 50);
}

void mouseDragged() {
  if (mouseX > 300) {
    stroke(brush);
    strokeWeight(thick);
    line(pmouseX, pmouseY, mouseX, mouseY);
  } else {
    thicknessSlider();
  }
}


void brushButton(int x, int y, int c) {
  if (mouseX > x && mouseX < x+50 && mouseY > y && mouseY < y+50) {
    stroke(255);
    if (mouseX > x && mouseX < x+50 && mouseY > y && mouseY < y+50 && x < 150) {
      brush = c;
    }
  } else {
    stroke(0);
  }
  fill(c);
  strokeWeight(3);
  square(x, y, 50);
}

void canvasButton(int x, int y, int c) {
  if (mouseX > x && mouseX < x+50 && mouseY > y && mouseY < y+50) {
    stroke(255);
    if (mouseX > x && mouseX < x+50 && mouseY > y && mouseY < y+50 && x > 150) {
      canvas = c;
      if (mousePressed) {
        fill(canvas);
        strokeWeight(0);
        rect(300, -10, 1500, 1500);
      }
    }
  } else {
    stroke(0);
  }
  fill(c);
  strokeWeight(3);
  square(x, y, 50);
}



void mousePressed() {
  thicknessSlider();
}


void thicknessSlider() {
  if (mouseX > 50 && mouseX < 250 && mouseY > 700 && mouseY < 750) {
    sliderX = mouseX;
  }
  thick = map(sliderX, 50, 250, 0, 100);
}


void eraserButton(int x, int y){
 if(dist(x, y, mouseX, mouseY) < 50){
 stroke(255);
}else{
  stroke(0);
}
fill(#F7A5F3);
square(x, y, 50);
}
