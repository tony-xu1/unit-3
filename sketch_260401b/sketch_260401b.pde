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

PImage sanic;
boolean sanicOn;

void setup() {
  size(1300, 1000);
  background(255);
  canvas = 255;
  sliderX = 150;
  sanic = loadImage("sanic.png");
  sanicOn = false;
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

  eraserButton(75, 800);

  sanicStamp(50, 850);

  //spectrum=====================
  stroke(20);
  line(50, 725, 250, 725);
  fill(0);
  circle(sliderX, 725, 50);
}

void mouseDragged() {
  if (mouseX > 300 && sanicOn == false) {
    stroke(brush);
    strokeWeight(thick);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (sanicOn == true && mouseX > 300) {
    image(sanic, mouseX - 50, mouseY - 50, 100, 100);
  } else {
    thicknessSlider();
  }
}


void brushButton(int x, int y, int c) {
  if (mouseX > x && mouseX < x+50 && mouseY > y && mouseY < y+50) {
    stroke(255);
    if (mouseX > x && mouseX < x+50 && mouseY > y && mouseY < y+50 && x < 150 && mousePressed) {
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
      if (mousePressed) {
        canvas = c;
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

void mouseReleased() {
  if (sanicOn == true && mouseX > 300) {
    image(sanic, mouseX - 50, mouseY - 50, 100, 100);
  }
    if (mouseX > 50 && mouseX < 100 && mouseY > 850 && mouseY < 900) {
    sanicOn = !sanicOn;
  }
}

void mousePressed() {
  thicknessSlider();
  
  if (mouseX > 300 && sanicOn == false) {
    stroke(brush);
    strokeWeight(thick);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (sanicOn == true && mouseX > 300) {
    image(sanic, mouseX - 50, mouseY - 50, 100, 100);
  }
}


void thicknessSlider() {
  if (mouseX > 50 && mouseX < 250 && mouseY > 700 && mouseY < 750) {
    sliderX = mouseX;
  }
  thick = map(sliderX, 50, 250, 0, 100);
}


void eraserButton(int x, int y) {
  if (dist(x, y, mouseX, mouseY) < 25) {
    stroke(255);
  } else {
    stroke(0);
  }
  if (mousePressed && dist(x, y, mouseX, mouseY) < 25) {
    brush = canvas;
  }
  fill(#F7A5F3);
  circle(x, y, 50);
}

void sanicStamp(int x, int y) {
  if (mouseX > x && mouseX < x + 50 && mouseY > y && mouseY < y + 50 && sanicOn == false) {
    stroke(255);
  } else {
    stroke(0);
  }  if (sanicOn == true) {
    stroke(green);
  }
  fill(255);
  square(x, y, 50);
  image(sanic, x, y, 50, 50);
}
