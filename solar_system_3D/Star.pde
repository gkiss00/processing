class Star {
   PVector pos;
   PVector point;
   float speed;
   float orbit;
   float angle = 0;
   
   Star(){
      pos = new PVector(random(width) - (width / 2) , random(width) - (width / 2), random(width) - (width / 2));
      orbit = random(width) - (width / 2);
      speed = 0.1;
   }
   
   void setAllPoints(){
         float x, y, z;
         x = pos.x + (orbit * cos(2 * PI * angle / 360));
         y = pos.y;
         z = pos.z + (orbit * sin(2 * PI * angle / 360));
         point = new PVector(x, y, z);
   }
   
   void play() {
     colorMode(RGB);
     noFill();
     
     stroke(255);

     point(point.x, point.y, point.z);
   }
   
   void display() {
     setAllPoints();
     play();
     angle += speed;
   }
}
