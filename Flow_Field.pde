int w, h;

int r, g, b;
float red, green, blue;

float inc = 0.001;
Particle[] particles = new Particle[10000];
FlowField field;

void setup() {
  size(900, 900);
  w = width;
  h = height;
  background(0);
  smooth();
  field = new FlowField(5);

  red = random(50);
  green = random(50);
  blue = random(50);

  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
}
void draw() {
  noStroke();
  fill(0, 5);
  rect(0, 0, width, height);

  red += inc;
  green += inc;
  blue += inc;

  r = int(255*noise(red));
  g = int(255*noise(green));
  b = int(255*noise(blue));

  strokeWeight(1.5);
  //stroke(r, g, b, 150);
  stroke(255,255);
  for (int a = 0; a<particles.length; a++) {
    particles[a].move(field);
  }
  field.shift(0.1);
}
