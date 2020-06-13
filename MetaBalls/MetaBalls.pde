MetaBall[] list;
int nb_balls = 12;

void setup() {
  size(800, 800);
  list = new MetaBall[nb_balls];
  for (int i = 0; i < nb_balls; ++i){
    list[i] = new MetaBall();
  }
}

void draw(){
  background(0);
  loadPixels();
  
  for (int i = 0; i < width; ++i){
    for (int j = 0; j < height; ++j){
      int index = (j * width) + i;
      float sum = 0;
      for (MetaBall b : list){
        float dist = dist(i, j, b.pos.x, b.pos.y);
        sum += 150 * b.ray /(dist);
      }
      pixels[index] = color(sum);
    }
  }
  
  
  updatePixels();
  for (MetaBall b : list){
    b.update();
  }
  println(list[0].pos.x);
}
