class Ring {
  PVector pos;
  PVector dir;
  PVector colors;
  float intensite;
  float rotation = 0;
  float acceleration = 0.01;
   float extern_radius;
   float intern_radius;
   float size = 5;
   float nb_lines;
   float nb_triangle_by_lines;
   
   Ring (float x, float y, float z,float r1, float r2, float dirX, float dirY, float dirZ, float r, float g, float b, float intensite_){
     pos = new PVector(x, y, z);
     dir = new PVector(dirX, dirY, dirZ);
     colors = new PVector(r, g, b);
     intensite = intensite_;
     extern_radius = r1;
     intern_radius = r2;
     nb_lines = ((r2 / size) * 2) - 2;

     nb_triangle_by_lines = PI * 2 * extern_radius / size;
   }
   
   void show(float rotating){
       rotation += rotating;
       float angle_extern = rotation;
       float angle_intern = 0.0;
       float degre_angle_intern = 360.0 / nb_lines;
       noFill();
       stroke(colors.x, colors.y, colors.z, intensite);
       for (int i = 0; i < nb_lines; ++i)
       {
           beginShape(TRIANGLE_STRIP);
           for(int j = 0; j < 91; ++j) {
             float y = intern_radius * sin(2 * PI * angle_intern / 360);
             float radius = extern_radius - (intern_radius * cos(2 * PI * angle_intern / 360));
             float x = radius * cos(2 * PI * angle_extern / 360);
             float z = radius * sin(2 * PI * angle_extern / 360);
             vertex(x + pos.x , y + pos.y, z + pos.z);
             y = intern_radius * sin(2 * PI * (angle_intern + degre_angle_intern) / 360);
             radius = extern_radius - (intern_radius * cos(2 * PI * (angle_intern + degre_angle_intern) / 360));
             x = radius * cos(2 * PI * angle_extern / 360);
             z = radius * sin(2 * PI * angle_extern / 360);
             vertex(x + pos.x, y + pos.y, z + pos.z);

             angle_extern += 4;
           }
           angle_intern = (angle_intern + degre_angle_intern);
           endShape();
       }
   }
}
