import peasy.*;

Ring ring = new Ring(400, 40);

PeasyCam cam;

void setup(){
  size(900, 900, P3D);
  
  cam = new PeasyCam(this, width/2, height/2, 0, 1000);
}

void draw(){
  background(0);
  translate(width/2, height / 2);
  ring.show();
}
