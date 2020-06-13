import peasy.*;

Sphere sp1 = new Sphere(200, 50, 00, 0, 0, 1,  0.04, 1.70, 1.70, 1, 1, 1, 1, 0.01);
Sphere sp2 = new Sphere(200, 50, 100, 0, 0, 1.16667, 0.3, 0.3, 0.3, 0, 1,1, 1, 0.01);
PeasyCam cam;

void setup(){
  size(600, 600,P3D);
  cam = new PeasyCam(this, width/2, height/2, 0, 1000);
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/2);
  
  sp1.display();
  //sp2.display();
}
