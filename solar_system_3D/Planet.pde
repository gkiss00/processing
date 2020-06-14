class Planet {
   float ray;
   int precision;
   PVector[][] points;
   float speed;
   float orbit;
   PVector colors;
   float angle = 0;
   boolean ring;
   
   Planet(float r, int _precision, float _orbit, float _speed, float red, float green, float blue, boolean _ring){
      ray = r;
      precision = _precision;
      points = new PVector[precision + 1][precision + 1];
      orbit = _orbit;
      speed = _speed;
      colors = new PVector(red, green, blue);
      ring = _ring;
   }
   
   void setAllPoints(){
     for (int i = 0; i < precision + 1; ++i){
       float lat = map(i, 0, precision, -PI / 2, PI / 2);
       for (int j =0; j < precision + 1; ++j){
         float lon = map(j, 0, precision, -PI, PI);
         float xr, yr, zr;
         xr = orbit * cos(2 * PI * angle / 360);
         yr = 0;
         zr = orbit * sin(2 * PI * angle / 360);
         float x, y, z;
         x = xr + ((ray) * cos(lon) * cos(lat));
         y = yr + ((ray) * sin(lon) * cos(lat));
         z = zr + ((ray) * sin(lat));
         points[i][j] = new PVector(x, y, z);
       }
     }
   }
   
   void play() {
     colorMode(RGB);
     fill(colors.x, colors.y, colors.z);
     
     stroke(colors.x / 1.1, colors.y / 1.1, colors.z / 1.1);

     for (int i = 0; i < precision; ++i){
       beginShape(TRIANGLE_STRIP);
       for (int j =0; j < precision + 1; ++j){
         PVector v1 = points[i][j];
         vertex(v1.x, v1.y, v1.z);
         PVector v2 = points[i + 1][j];
         vertex(v2.x, v2.y, v2.z);
       }
       endShape();
     }
     if (ring)
       setRing();
   }
   
   void setRing(){
     colorMode(RGB);
     
     float xr, yr, zr;
     xr = orbit * cos(2 * PI * angle / 360);
     yr = 0;
     zr = orbit * sin(2 * PI * angle / 360);
     for (int nb_circle = 1; nb_circle < 10; ++nb_circle){
       float ratio = (nb_circle / 3);
       fill(colors.x / ratio, colors.y / ratio, colors.z / ratio);
       stroke(colors.x / 1.1 / ratio, colors.z / 1.1 / ratio, colors.z / 1.1 / ratio);
       beginShape(TRIANGLE_STRIP);
       for (int i = 0; i < 361; ++i){
         float x, y, z;
         x = xr  + ((ray + 5 + nb_circle) * cos(2 * PI  * i / 360));

           y = map((cos(2 * PI  * i / 360)) , -1, 1, 18, -18);

         z = zr + ((ray + 5 + nb_circle) * sin(2 * PI  * i / 360));
         vertex(x, y, z);
       }
       endShape();
     }
   }
   
   void display() {
     setAllPoints();
     play();
     angle += speed;
   }
}
