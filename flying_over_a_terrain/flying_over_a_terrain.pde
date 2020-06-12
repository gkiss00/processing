int w = 2000;
int h = 1600;
int scl = 20;
int cols = w / scl;
int rows = h / scl;
float[][] terrain;

float flying = 0;


void setup() {
  size(600, 600, P3D);
  terrain= new float[cols][rows];
  
  float yoff = 0;
  for (int y = 0; y < rows; ++y){
    float xoff = 0;
    for (int x = 0; x < cols; ++x){
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -150, 150);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
}

void draw() {
  background(0);
  
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  
  flying -= 0.05;
  
  float yoff = flying;
  for (int y = 0; y < rows; ++y){
    float xoff = 0;
    for (int x = 0; x < cols; ++x){
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -150, 150);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  
  noFill();
  stroke(255);
  for (int y = 0; y < rows - 1; ++y){
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; ++x){
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y + 1]);
    }
    endShape();
  }
}
