float a = 0;
Box b;
ArrayList<Box> boxes = new ArrayList<Box>();

void setup(){
    size(800, 800, P3D);
    b = new Box(0,0,0, 400);
    boxes.add(b);
}

void mousePressed(){
  ArrayList<Box> next = new ArrayList<Box>();
  for (Box tmp : boxes){
    ArrayList<Box> t = tmp.generate();
    next.addAll(t);
  }
  boxes.clear();
  boxes.addAll(next);
}

void draw(){
    background(0);
    stroke(255);
    noFill();
    lights();
    
    translate(width/2, height/2);
    rotateX(a);
    rotateY(a);
    for (Box b : boxes){
      b.show();
    }
    a +=0.01;
}
