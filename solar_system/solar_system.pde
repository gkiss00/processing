import peasy.*;

Planet sun = new Planet(50, 0, 0, 255, 255, 0, false);
Planet mercure = new Planet(5, 100, 0.04, 128, 128, 128, false);
Planet venus = new Planet(9, 130, 0.018, 245, 245, 245, false);
Planet terre = new Planet( 8, 160, 0.01, 50, 55, 240, false);
Planet mars = new Planet(6, 200, 0.005, 228, 100, 10, false);
Planet jupiter = new Planet(40, 260, 0.0008, 220, 200, 30, false);
Planet saturn = new Planet(37, 345, 0.0003, 254, 254, 254, true);
Planet uranus = new Planet(20, 450, 0.0001, 58, 145, 186, false);
int nb_stars = 500;
Planet[] stars = new Planet[nb_stars];;



PeasyCam cam;

void setup() {
  size(1000, 1000, P3D);
  cam = new PeasyCam(this, 500, 500, 0, 1000);
  for (int i = 0; i < nb_stars; ++i)
  {
     stars[i] = new Planet(true, 1, random(800), 0.0005, 255, 255, 255, false); 
  }
}

void draw() {
  background(0);
  lights();
  sun.show();
  mercure.show();
  venus.show();
  terre.show();
  mars.show();
  jupiter.show();
  saturn.show();
  uranus.show();
  for (int i = 0; i < nb_stars; ++i)
  {
     stars[i].show();
  }
}
