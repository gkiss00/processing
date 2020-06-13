import peasy.*;
import processing.sound.*;

PeasyCam cam;
AudioIn input;
Amplitude analyzer;

AudioSample speaker;

Parasyte p1;
Ring r1 = new Ring(0,-200,0 ,400, 40, 0, 1, 0, 255, 0, 0, 100);

void setup() {
  size(800, 800, P3D);
  lights();
  cam = new PeasyCam(this, 0, 0, 0, 800);
  
  input = new AudioIn(this, 0);
  input.start();
  analyzer = new Amplitude(this);
  analyzer.input(input);
  
  p1 = new Parasyte(200,50, 0,0,0, 10, 4);
}

void draw(){
  background(0);
  float vol = analyzer.analyze();
  p1.display(vol * 14);
  r1.show(5);
}
