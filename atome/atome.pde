import peasy.*;

PeasyCam cam;

Sphere sp = new Sphere(16);

void setup() {
  size(1000, 1000, P3D);
  
  cam = new PeasyCam(this, width/2, height/2, 0, 1000);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  sp.show();
}
