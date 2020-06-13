class Sphere {
   float ray;
   int precision;
   PVector pos;
   PVector[][] points;
   float m1;
   float r1_n1;
   float r1_n2;
   float r1_n3;
   float m2;
   float r2_n1;
   float r2_n2;
   float r2_n3;
   float speed;
   float color_speed = 0;
   float m = 0;
   
   Sphere(float r, int _precision, float x, float y, float z,float _m1,  float rn1, float rn2, float rn3, float _m2, float rn4, float rn5, float rn6, float sp){
      ray = r;
      precision = _precision;
      pos = new PVector(x, y, z);
      points = new PVector[precision + 1][precision + 1];
      m1 = _m1;
      r1_n1 = rn1;
      r1_n2 = rn2;
      r1_n3 = rn3;
      m2 = _m2;
      r2_n1 = rn4;
      r2_n2 = rn5;
      r2_n3 = rn6;
      speed = sp;
   }
   
   void getAllPoints(){
     for (int i = 0; i < precision + 1; ++i){
       float lat = map(i, 0, precision, -PI / 2, PI / 2);
       for (int j =0; j < precision + 1; ++j){
         float lon = map(j, 0, precision, -PI, PI);
         float r1 = superShape(lon, m,r1_n1, r1_n2, r1_n3);
         float r2 = superShape(lat, m, r2_n1, r2_n2,r2_n3);
         float x = pos.x + (ray * r1 * cos(lon) * r2 * cos(lat));
         float y = pos.y + (ray * r1 * sin(lon) * r2 * cos(lat));
         float z = pos.z + (ray * r2 * sin(lat) * r2);
         points[i][j] = new PVector(x, y, z);
       }
     }
   }
   
   void display() {
     m +=speed;
     getAllPoints();
     colorMode(HSB, 100);
     for (int i = 0; i < precision; ++i){
       float hu = map(i, 0, precision, 0, 255 * 6);
       beginShape(TRIANGLE_STRIP);
       for (int j =0; j < precision + 1; ++j){
         fill((hu) % 255, 255, 255);
         noStroke();
         //stroke(255);
         //noFill();
         PVector v1 = points[i][j];
         vertex(v1.x, v1.y, v1.z);
         PVector v2 = points[i + 1][j];
         vertex(v2.x, v2.y, v2.z);
       }
       endShape();
     }
     color_speed += 1;
   }
   
   
   
   float superShape(float theta, float m, float n1, float n2, float n3){
     float a = 1;
     float b = 1;
     float r;
     
     float tmp1 = pow(abs((1/a) * cos(m * theta / 4)), n2);
     tmp1 += pow(abs((1/b) * sin(m * theta / 4)), n3);
     r = pow(tmp1, (-1/n1));
     return (r);
   }
}
