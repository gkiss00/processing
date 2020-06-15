import peasy.*;
PeasyCam cam;

int start = 0;

ArrayList<Integer> primes = new ArrayList<Integer>();

void setup() {
   size(1000, 1000, P3D);
   cam = new PeasyCam(this, 0, 0, 0, 1000);
}

void draw() {
  background(0);

  if (isPrime(start));
    primes.add(start);
  for (int i = 0; i <primes.size(); ++i){
    Float x, y;
    x = primes.get(i) * cos(2 * PI * (primes.get(i) * 360 / (2 * PI)) / 360);
    y = primes.get(i) * sin(2 * PI * (primes.get(i) * 360 / (2 * PI)) / 360);
    noFill();
    stroke(255);
    point(x, y, 0);
  }
  ++start;
}

boolean isPrime(int nb) {
  if (nb == 2)
    return(true);
  if (nb % 2 == 0)
    return (false);
  for (int i = 2; i < nb; ++i){
    if (nb%i == 0)
      return(false);
  }
  return(true);
}
