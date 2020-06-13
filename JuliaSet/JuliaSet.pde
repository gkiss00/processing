float c_real = 0;
float c_imag= 0;

float nb = 0;
float[] tmp1 = new float[10];
float[] tmp2 = new float[10];

float z_real = 0;
float z_imag = 0;

void setup(){
  size(600, 600);
  colorMode(RGB, 1);
  fillTMP();
}

void fillTMP(){
  tmp1[0] = 0.0;
  tmp2[0] = 0.8;
  tmp1[1] = 0.37;
  tmp2[1] = 0.1;
  tmp1[2] = 0.355;
  tmp2[2] = 0.355;
  tmp1[3] = -0.54;
  tmp2[3] = 0.54;
  tmp1[4] = -0.4;
  tmp2[4] = -0.59;
  tmp1[5] = 0.34;
  tmp2[5] = -0.05;
  tmp1[6] = 0;
  tmp2[6] = 0.8;
  tmp1[7] = 0.37;
  tmp2[7] = 0.1;
  tmp1[8] = -0.54;
  tmp2[8] = 0.54;
  tmp1[9] = -0.4;
  tmp2[9] = -0.59;
}

void draw() {
  background(0);
  loadPixels();
  
  float w = 5.0;
  float h = 5.0;
  
  float xmin = -w/2; // -2.5
  float ymin = -h/2; // -2.5
  
  int maxiterations = 400;
  float xmax = xmin + w; // 2.5
  float ymax = ymin + h; // 2.5
  
  float dx = (xmax - xmin) / width; // 5 / 600
  float dy = (ymax - ymin) / height; // 5 / 600
  
  float y = ymin; // -2.5
  for (int i = 0 ;i < width; ++i){
    float x = xmin; // -2.5
    for (int j = 0; j < height; ++j){
      float a = x;
      float b = y;
      int n = 0;
      while (n < maxiterations){
        float aa = a * a;
        float bb = b * b;
        float twoab = 2.0 * a * b;
        
        a = aa - bb + tmp1[(int)nb];
        b = twoab + tmp2[(int)nb];
        if (aa * aa + bb * bb > 16.0)
          break;
        ++n;
      }
      if (n == maxiterations){
          
      }else{
        pixels[i + j*width] = color(sqrt(float(n) / maxiterations));
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
  println(frameRate);
}

void mousePressed() {
  ++nb;
  nb = nb % 10;
}
