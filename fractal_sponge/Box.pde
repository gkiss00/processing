class Box {
   PVector pos;
   float r;
   
   Box (float x, float y, float z, float ra){
     pos = new PVector(x, y, z);
     r = ra;
   }
   
   ArrayList<Box> generate(){
     ArrayList<Box> next = new ArrayList<Box>();
     
     for (int i = -1; i < 2; ++i){
      for (int j = -1; j < 2; ++j){
        for (int k = -1; k < 2; ++k){
          
          int sum = abs(i) + abs(j) + abs(k);
          float newR = r/3;
          if (sum > 1){
            Box tmp = new Box(pos.x + i*newR, pos.y+ j*newR, pos.z+ k*newR, newR);
            next.add(tmp);
          }
        }
      }
    }
    return (next);
   }
   
   void show(){
     pushMatrix();
     translate(pos.x, pos.y, pos.z);
     fill(255);
     box(r);
     popMatrix();
   }
}
