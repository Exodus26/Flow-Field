class FlowField {
  PVector [][] field;
  int cols, rows, scl;
  float xstart, ystart, xoff, yoff;

  float inc = 0.1;
  float zoff = random(10);

  FlowField(int a) {
    scl = a;
    cols = int(width/scl);
    rows = int(height/scl);

    field = new PVector[cols][rows];
    init();
  }

  void init() {
    xstart = random(10);
    ystart = random(10);

    xoff = xstart;
    for (int i = 0; i < cols; i++) {
      yoff = ystart;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        field[i][j] = new PVector (-cos(theta), -sin(theta));

        yoff += inc;
      }
      xoff += inc;
    }
  }

  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/scl, 0, cols-1));
    int row = int(constrain(lookup.y/scl, 0, rows-1));
    return field[column][row];
  }

  void shift(float amount) {

    xoff = xstart;
    for (int i = 0; i < cols; i++) {
      yoff = ystart;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xoff, yoff, zoff), 0, 1, 0, TWO_PI);
        field[i][j] = new PVector (cos(theta), sin(theta));

        yoff += inc;
      }
      xoff += inc;
    }
    zoff += amount;
  }
}
