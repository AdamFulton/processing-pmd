/*
Thing - Example of a thing for COMP1050
 (c) Ansgar 2023
 */
class Pineapple {
  float x;
  float y;
  float dx;
  float dy;
  color myColor;
  float pulse = 0;
  float MAX_RADIUS = 25;
  float SPEED = 5.0;

  Pineapple(float xInit, float yInit) {
    x = xInit;
    y = yInit;

    myColor = color(160, 42, 42);
    float randomAngle= random(0, 360);
    dx = SPEED * sin(radians(randomAngle));
    dy = SPEED * cos(radians(randomAngle));
  }



  void animate() {
    pulse = (pulse + 10)%360;

    if (x + MAX_RADIUS < 0 && dx < 0) {
      x = width + MAX_RADIUS;
    }
    if (y + MAX_RADIUS < 0 && dy < 0) {
      y = height + MAX_RADIUS;
    }
    if (x - MAX_RADIUS > width && dx > 0) {
      x = - MAX_RADIUS;
    }
    if (y - MAX_RADIUS > height && dy > 0) {
      y = - MAX_RADIUS;
    }

    x = x + dx;
    y = y + dy;
  }

  void display() {
    float radius = (MAX_RADIUS + sin(radians(pulse))* MAX_RADIUS)/2;

    noStroke();
    fill(myColor, 50);
    ellipse(x, y, MAX_RADIUS, 2*MAX_RADIUS);
    fill(myColor, 150);
    stroke(myColor, 255);
    strokeWeight(MAX_RADIUS/10);
    ellipse(x, y, radius, 2*radius);
    noStroke();
    fill(0, 250, 0,150);
    triangle(x-MAX_RADIUS/2, y-1.1*MAX_RADIUS, x+MAX_RADIUS/2, y-1.1*MAX_RADIUS, x, y-MAX_RADIUS/2);
  }


  void tick(float mx, float my) {
    if (dist(x, y, mx, my)<= 2*MAX_RADIUS) {
      float randomAngle= random(0, 360);
      dx = SPEED * sin(radians(randomAngle));
      dy = SPEED * cos(radians(randomAngle));
    }
  }
}
