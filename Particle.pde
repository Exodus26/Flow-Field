class Particle {
  float xvel, yvel, maxvel, xacc, yacc, maxacc;

  PVector lastposition, position, velocity, acceleration;
  Particle() {
    maxvel = 3;
    this.position = new PVector (int(random(width)), int(random(height)));
    this.velocity = new PVector (random(maxvel)-maxvel/2, random(maxvel)-maxvel/2);
  }
  void move(FlowField field) {
    this.lastposition = this.position;
    this.position = PVector.add(this.position,this.velocity);
    this.acceleration = field.lookup(position).mult(2);
    this.velocity = PVector.add(this.velocity,this.acceleration);
    this.velocity.limit(maxvel);
    //point(position.x, position.y);
    line(this.position.x, this.position.y, this.lastposition.x, this.lastposition.y);

    if (this.position.x < 0) {
      this.position.x += width;
    } else if (this.position.x > width) { 
      this.position.x -= width;
    }
    if (this.position.y < 0) {
      this.position.y += height;
    } else if (this.position.y > height) { 
      this.position.y -= height;
    }
  }
}
