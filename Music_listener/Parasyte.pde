class Parasyte {
   float ray;
   int precision;
   PVector pos;
   PVector[][] points;
   float size;
   float speed;
   
   Parasyte(float r, int _precision, float x, float y, float z, float _size, float sp){
      ray = r;
      precision = _precision;
      pos = new PVector(x, y, z);
      points = new PVector[precision + 1][precision + 1];
      size = _size;
      speed = sp;
      
   }
   
   void setAllPoints(float vol){
     vol = pow(2, vol);
     for (int i = 0; i < precision + 1; ++i){
       float lat = map(i, 0, precision, -PI / 2, PI / 2);
       for (int j =0; j < precision + 1; ++j){
         float lon = map(j, 0, precision, -PI, PI);
         float x, y, z;
           if ((i % 2== 0 && j % 2 == 0)){
           x = pos.x + ((ray + vol) * cos(lon) * cos(lat));
           y = pos.y + ((ray + vol) * sin(lon) * cos(lat));
           z = pos.z + ((ray + vol) * sin(lat));
           }else{
             x = pos.x + ((ray - vol) * cos(lon) * cos(lat));
             y = pos.y + ((ray - vol) * sin(lon) * cos(lat));
             z = pos.z + ((ray - vol) * sin(lat));
           }
         points[i][j] = new PVector(x, y, z);
       }
     }
   }
   
   void play(float vol) {
     vol = pow(2, vol);
     for (int i = 0; i < precision; ++i){
       beginShape(TRIANGLE_STRIP);
       for (int j =0; j < precision + 1; ++j){
         if (vol < 40)
         fill((vol * 3) % 255, vol % 40, vol % 40);
         else if (vol < 80)
         fill(0, (vol * 3) % 255, vol % 40);
         else 
         fill(0, vol % 40, (vol * 3) % 255);
         noStroke();
         //noFill();
         stroke(255, 0, 0);
         PVector v1 = points[i][j];
         vertex(v1.x, v1.y, v1.z);
         PVector v2 = points[i + 1][j];
         vertex(v2.x, v2.y, v2.z);
       }
       endShape();
     }
   }
   
   void display(float vol) {
     setAllPoints(vol);
     play(vol);
     //setAllPoints(0);
   }
}
