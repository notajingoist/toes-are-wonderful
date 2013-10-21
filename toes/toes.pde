import ddf.minim.*;

Minim minim;
AudioPlayer heehee;
AudioPlayer haha;
AudioInput input;

PShape foot;
PShape nails;
PShape feather;

void setup() {
  size(1280, 2400);
  background(255);
  smooth();
  noStroke();
  frameRate(30);

  foot = loadShape("foot.svg");
  nails = loadShape("nails.svg");
  feather = loadShape("feather.svg");

  minim = new Minim(this);
  heehee = minim.loadFile("heeheelong.wav");
}

boolean sketchFullScreen() {
  return true;
}

public int sketchWidth() {
  return displayWidth;
}

public int sketchHeight() {
  return displayHeight;
}

public String sketchRenderer() {
  return P3D;
}

void draw() {
  background(255);
  fill(255, 0, 0);

  float centerX = width/2 - (foot.width/2);
  float bottomY = height - foot.height + 40;

  float footX; 
  float footY;

  float featherX = mouseX - feather.width + 30;
  float featherY = mouseY - feather.height + 50;

  if ((mouseX < (centerX + foot.width/2 + feather.width + 100)) 
    && (mouseX > (centerX - foot.width/2 + feather.width))
    && (mouseY > (height - foot.height + 100))
    && (mouseY < height)) {
    footX = centerX + random(-10, 10);
    footY = bottomY + random(-5, 5);
    
    heehee.play();
  } 
  else {
    footX = centerX;
    footY = bottomY;
    heehee.pause();
  }
  
  shape(foot, footX, footY, foot.width, foot.height);
  shape(nails, footX, footY, nails.width, nails.height);
  shape(feather, featherX, featherY, feather.width, feather.height);
}

void stop() {
  heehee.close();
  haha.close();
  input.close();
  minim.stop();

  super.stop();
}

