import peasy.*;

PeasyCam cam;

Planet sun = new Planet(0, 0, 0, 50, 50, 0, 0, 255, 255, 0, false);
Planet mercure = new Planet(0, 0, 0, 5, 20, 100, 4, 128, 128, 128, false);
Planet venus = new Planet(0, 0, 0, 9, 30, 130, 1.8, 245, 245 ,245, false);
Planet terre = new Planet(0, 0, 0, 8, 25, 160, 1, 50, 55, 245, false);
Planet mars = new Planet(0, 0, 0, 6, 20, 200, 0.5, 228, 100, 10, false);
Planet jupiter = new Planet(0, 0, 0, 40, 50, 260, 0.08, 220, 200, 30, false);
Planet saturn = new Planet(0, 0, 0, 37, 50, 365, 0.03, 254, 254, 254, true);
Planet uranus = new Planet(0, 0, 0, 20, 20, 480, 0.01, 58, 145, 186, false);

Planet[] stars;

int nb= 1000;

void setup() {
  size(1000, 1000, P3D);
  cam = new PeasyCam(this, 0, 0, 0, 1000);
  stars = new Planet[nb];
  for (int i = 0; i < nb ; ++i){
    stars[i] = new Planet(random(width) - (width / 2) , random(width) - (width / 2), random(width) - (width / 2), 4, 4, random(width), 0.1, 255, 255, 255, false);
  }
}

void draw(){
  background(0);
  
  for (int i = 0; i < nb; ++i){
    stars[i].display();
  }
  sun.display();
  mercure.display();
  venus.display();
  terre.display();
  mars.display();
  jupiter.display();
  saturn.display();
  uranus.display();
  
  noFill();
  stroke(255);

  
}
