class Ring {
   float extern_radius;
   float intern_radius;
   float size = 5;
   float nb_lines;
   float nb_triangle_by_lines;
   
   Ring (float r1, float r2){
     extern_radius = r1;
     intern_radius = r2;
     nb_lines = ((r2 / size) * 2);

     nb_triangle_by_lines = PI * 2 * extern_radius / size;
   }
   
   void show(){
     float angle_extern = 0.0;
       float angle_intern = 90.0;
       float degre_angle_intern = 360.0 / nb_lines;
       float degre_angle_extern = 1;
       noFill();
       stroke(255, 255, 255);
       
       for (int i = 0; i < nb_lines - 1; ++i)
       {
           beginShape();
           for(int j = 0; j < 360; ++j) {
             float y = intern_radius * sin(angle_intern);
             float radius = extern_radius - (intern_radius * cos(angle_intern));
             float x = radius * cos(angle_extern);
             float z = radius * sin(angle_extern);
             vertex(x, y, z);
             y = intern_radius * sin((angle_intern + degre_angle_intern) % 360);
             radius = extern_radius - (intern_radius * cos((angle_intern + degre_angle_intern) % 360));
             x = radius * cos(angle_extern);
             z = radius * sin(angle_extern);
             vertex(x, y, z);
             angle_extern = (angle_extern + (degre_angle_extern * 1)) % 360;
           }
           angle_intern = (angle_intern + degre_angle_intern) % 360;
           endShape();
       }
       
   }
}
