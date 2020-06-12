import peasy.*;

Ring ring = new Ring(200, 20);

PeasyCam cam;

void setup(){
  size(600, 600, P3D);
  
  cam = new PeasyCam(this, width/2, height/2, 0, 500);
}

void draw(){
  background(0);
  translate(width/2, height / 2);
  ring.show();
}
