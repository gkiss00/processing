class Sphere {
  float nb_electrons;
  float nb_couches;
  float noyeau = 20;
  float ray;
  float diam;
  
  ArrayList<PVector> electrons = new ArrayList<PVector>();
  float[] couches;
  
  Sphere(float nb_electrons_){
    nb_electrons = nb_electrons_;
    
    configCouches(nb_electrons);
  }
  
  void configCouches(float nb_electrons_) {
    nb_couches = 0;
    int i = 1;
    float save = nb_electrons_;
    while (nb_electrons_ > 0){
      nb_couches++;
      nb_electrons_ -= 2 * (pow(i, 2));
      ++i;
    }
    nb_electrons_ = save;
    couches = new float[(int)nb_couches];
    while (nb_electrons_ > 0){
      nb_couches++;
      nb_electrons_ -= 2 * (pow(i, 2));
      ++i;
    }
    ray = noyeau;
    float size = 20;
    for (int i = 0; i < nb_couches; ++i){
      ray += size;
      couches[i] = ray;
      size += 10;
    }
    ray += 10;
    diam = 2 * ray;
  }
  
  void show(){
    
    noFill();
    stroke(255, 0, 0, 50);
    sphere(2 * ray);
    
    fill(255, 0, 0);
    sphere(noyeau);
    
    addElectrons();

  }
  
  void addElectrons() {
    stroke(255);
    fill(255, 255, 255);
    for (PVector e: electrons)
    {
      point(e.x, e.y, e.z);
    }
  }
  
}
