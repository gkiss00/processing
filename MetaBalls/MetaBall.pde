class MetaBall {
  PVector pos;
  PVector vel;
  float ray;
  
  MetaBall() {
    pos = new PVector(random(width), random(height));
    vel = new PVector(random(10), random(10));
    ray = random(20, 40);
  }
  
  void update(){
    pos.x += vel.x;
    pos.y += vel.y;
    if (pos.x > width || pos.x < 0)
      vel.x *= -1;
    if (pos.y > height || pos.y < 0)
      vel.y *= -1;
  }
}
