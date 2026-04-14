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

//colour and thickness variables-----------
color canvas;
color brush;
float thick;
float sliderX;

//stamp variables-------------------
PImage sanic;
boolean sanicOn;
PImage shadough;
boolean shadoughOn;

void setup() {
  size(1300, 1000);
  background(255);
  canvas = 255;
  sliderX = 150;
  sanic = loadImage("sanic.png");
  sanicOn = false;
  shadough = loadImage("shadough.png");
  shadoughOn = false;
  surface.setTitle("Drawing App");
  PImage icon = loadImage("sanic.png");
  surface.setIcon(icon);
}//setup end---------------------------

void saveImage(File f) {
  if (f != null) {
    PImage canvas = get( 300, 0, width, height);
    canvas.save(f.getAbsolutePath());
  }
}//save image function-----------------------

void openImage (File f) {
  if (f != null) {
    int n =0;
    while (n < 10) {
      PImage pic = loadImage(f.getPath());
      image(pic, 300, 0);
      n = n+1;
    }
  }
}//load image function---------------------------


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
  //brush colour buttons-----------------------

  canvasButton(200, 100, red);
  canvasButton(200, 175, green);
  canvasButton(200, 250, blue);
  canvasButton(200, 325, yellow);
  canvasButton(200, 400, pink);
  canvasButton(200, 475, cyan);
  canvasButton(200, 550, black);
  canvasButton(200, 625, white);
  //canvas colour/clear buttons---------------------

  eraserButton(75, 800);
  //eraser button----------------------

  sanicStamp(50, 850);
  shadoughStamp(175, 850);
  //stamp buttons---------------------------

  saveButton(50, 925);
  loadButton(175, 925);
  //save & load buttons-----------------

  fill(0);
  textSize(15);
  text("Brush Colours", 52, 60, 75, 100);
  text("Canvas Colours/Clear", 200, 60, 90, 100);
  textSize(30);
  text("Eraser", 130, 790, 100, 100);
  text("Drawing  App", 70, 20, 300, 100);
  textSize(12);
  text("Thickness Slider", 110, 760, 100, 100);
  // text for UI----------------------------


  //spectrum=====================
  stroke(20);
  line(50, 725, 250, 725);
  fill(0);
  circle(sliderX, 725, 50);
}//draw end-----------------------------------

void mouseDragged() {
  if (mouseX > 300 && sanicOn == false && shadoughOn == false) {
    stroke(brush);
    strokeWeight(thick);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (sanicOn == true && shadoughOn == false && mouseX > 300) {
    image(sanic, mouseX - 50, mouseY - 50, 100, 100);
  }
  if (shadoughOn == true && sanicOn == false && mouseX > 300) {
    image(shadough, mouseX - 50, mouseY - 50, 100, 100);
  } else {
    thicknessSlider();
  }
}//drawing & stamps----------------------------------


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
}//brush colour function-----------------------------

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
}//canvas colour function--------------------------------

void mouseReleased() {
  if (mouseX > 50 && mouseX < 100 && mouseY > 850 && mouseY < 900 && shadoughOn == false) {
    sanicOn = !sanicOn;
  }
  if (mouseX > 175 && mouseX < 225 && mouseY > 850 && mouseY < 900 && sanicOn == false) {
    shadoughOn = !shadoughOn;
  }
  if (mouseX > 50 && mouseX < 100 && mouseY > 850 && mouseY < 900 && shadoughOn == true) {
    sanicOn = !sanicOn;
    shadoughOn = !shadoughOn;
  }
  if (mouseX > 175 && mouseX < 225 && mouseY > 850 && mouseY < 900 && sanicOn == true) {
    shadoughOn = !shadoughOn;
    sanicOn = !sanicOn;
  }//stamp boolean function----------------------------------
  if (mouseX > 50 && mouseX < 100 && mouseY > 925 && mouseY < 975) {
    selectOutput("Choose a name for your drawing!", "saveImage");
  }
  if (mouseX > 175 && mouseX < 225 && mouseY > 925 && mouseY < 975) {
    selectInput("Choose image you would like to load!", "openImage");
  }
}//save and load button functions----------------------------------

void mousePressed() {
  thicknessSlider();

  if (mouseX > 300 && sanicOn == false && shadoughOn == false) {
    stroke(brush);
    strokeWeight(thick);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (sanicOn == true && shadoughOn == false && mouseX > 300) {
    image(sanic, mouseX - 50, mouseY - 50, 100, 100);
  }
  if (shadoughOn == true && sanicOn == false && mouseX > 300) {
    image(shadough, mouseX - 50, mouseY - 50, 100, 100);
  }
}


void thicknessSlider() {
  if (mouseX > 50 && mouseX < 250 && mouseY > 700 && mouseY < 750) {
    sliderX = mouseX;
  }
  thick = map(sliderX, 50, 250, 0, 75);
}//slider function-----------------------------------------------


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
}//eraser function-----------------------------------------

void sanicStamp(int x, int y) {
  if (mouseX > x && mouseX < x + 50 && mouseY > y && mouseY < y + 50 && sanicOn == false) {
    stroke(255);
  } else {
    stroke(0);
  }
  if (sanicOn == true) {
    stroke(green);
  }
  fill(255);
  square(x, y, 50);
  image(sanic, x, y, 50, 50);
}//sanic stamp--------------------------------


void shadoughStamp(int x, int y) {
  if (mouseX > x && mouseX < x + 50 && mouseY > y && mouseY < y + 50 && shadoughOn == false) {
    stroke(255);
  } else {
    stroke(0);
  }
  if (shadoughOn == true) {
    stroke(green);
  }
  fill(255);
  square(x, y, 50);
  image(shadough, x, y, 50, 50);
}//shadow stamp--------------------------------

void saveButton(int x, int y) {
  if (mouseX > x && mouseX < x + 50 && mouseY > y && mouseY < y + 50) {
    stroke(255);
  } else {
    stroke(0);
  }
  fill(155);
  square(x, y, 50);
  fill(0);
  text("SAVE", x + 13, y + 27);
}//stamp button--------------------------------


void loadButton(int x, int y) {
  if (mouseX > x && mouseX < x + 50 && mouseY > y && mouseY < y + 50) {
    stroke(255);
  } else {
    stroke(0);
  }
  fill(155);
  square(x, y, 50);
  fill(0);
  text("LOAD", x + 13, y + 27);
}//load button------------------------------------
