class Planet {
  PVector pos;
  PVector rgb;
  float r;
  float orbit;
  float angle = 0;
  float acceleration;
  boolean circle;
  boolean x = false;
  
  Planet(float r_, float orbit_, float acceleration_, int red, int green, int blue, boolean circle_) {
     pos = new PVector(0, 0, 0);
     r = r_;
     orbit = orbit_;
     acceleration = acceleration_;
     rgb = new PVector(red, green, blue);
     circle = circle_;
  }
  
  Planet(boolean x_,float r_,  float orbit_, float acceleration_, int red, int green, int blue, boolean circle_) {
    x = x_;
     pos = new PVector(0,0,0);
     if (x){
       angle= random(360);
       pos.z = random(100) - 300;
     }
     r = r_;
     orbit = orbit_;
     acceleration = acceleration_;
     rgb = new PVector(red, green, blue);
     circle = circle_;
  }
   
   void show() {
     getNewPos();
     translate(width/2 + pos.x, height/2 + pos.y);
     if (circle)
       showCircle();
     if (x){
        translate(0, 0, pos.z); 
     }
     noStroke();
     fill(rgb.x, rgb.y, rgb.z);
     
     sphere(r);
     if (x){
        translate(0, 0, -pos.z); 
     }
     translate(-(width/2 + pos.x),-( height/2 + pos.y));
  }
  
  void getNewPos(){
    angle += acceleration;
    angle = angle % 360;
    pos.x = sin(angle) * orbit;
    pos.y = cos(angle) * orbit;
    pos.x += acceleration;

  }
  
  void showCircle() {
    noFill();
    
    beginShape();
     for (float i = 0.0; i < 360; ++i){
         stroke(255, (i % 50) + 200, 220);
         vertex(sin(i) * (r + 10), 0, cos(i) * (r + 10));
     }
     endShape();
  }
}
