import peasy.*;

Ring ring1 = new Ring(0,-200,0 ,400, 40, 0, 1, 0, 255, 255, 255, 100);
Ring ring2 = new Ring(0,0,0 ,400, 40, 0, 1, 0, 255, 255, 255, 100);
Ring ring3 = new Ring(0,200,0 ,400, 40, 0, 1, 0, 255, 255, 255, 100);

PeasyCam cam;

void setup(){
  size(900, 900, P3D);
  
  cam = new PeasyCam(this, width/2, height/2, 0, 1000);
}

void draw(){
  background(0);
  translate(width/2, height / 2);
  ring1.show(0.5);
  ring2.show(0);
  ring3.show(-0.5);
}
