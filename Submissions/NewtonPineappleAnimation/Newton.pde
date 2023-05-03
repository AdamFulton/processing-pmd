/*
Actor - Example of a thing for COMP1050
 (c) Ansgar 2023
 */

class Newton {

  float x;
  float y;
  float dx = 0;
  float dy = 0;

  float TARGET_SPEED = 4;
  float MAX_RADIUS = 50;

  int frownCounter = 0;
  
  Mouth smile;

  Newton(float xInit, float yInit) {
    x = xInit;
    y = yInit;
    float randomAngle= random(0, 360);
    dx = TARGET_SPEED * sin(radians(randomAngle));
    dy = TARGET_SPEED * cos(radians(randomAngle));
    smile = new Mouth(x,y,MAX_RADIUS);
  }

  void display() {
    noStroke();
    fill(165, 42, 42);
    ellipse(x+MAX_RADIUS/2, y, MAX_RADIUS, 2*MAX_RADIUS);
    ellipse(x-MAX_RADIUS/2, y, MAX_RADIUS, 2*MAX_RADIUS);
    fill(250, 250, 220);
    ellipse(x, y, 1.5*MAX_RADIUS, 2*MAX_RADIUS);
    fill(165, 42, 42);
    ellipse(x, y-1*MAX_RADIUS, MAX_RADIUS, MAX_RADIUS/2);
    smile.display();
  }

  void animate() {
    dx = 0.995 * dx ;
    dy = 0.995 * dy ;

    if ( x > width - MAX_RADIUS && dx>0) {
      dx = -dx;
    }
    if ( x < MAX_RADIUS && dx <0) {
      dx = -dx;
    }
    if ( y > height - MAX_RADIUS && dy > 0) {
      dy = -dy;
    }
    if ( y < MAX_RADIUS && dy < 0) {
      dy = -dy;
    }

    x = x + dx;
    y = y + dy;
    
    smile.move(x,y);
    smile.animate();
  }

  void poke(float mx, float my) {
    if (dist(x, y, mx, my)<= MAX_RADIUS*2) {
      dx = TARGET_SPEED * (mx-x)/dist(x, y, mx, my) ;
      dy = TARGET_SPEED * (my-y)/dist(x, y, mx, my) ;
      smile.frown();
    }
    
  }

  void avoid(Pineapple danger) {
    float distance = dist(danger.x, danger.y, x, y);
    float speed = dist(dx,dy,0,0);
    if (distance <= 3*(danger.MAX_RADIUS + MAX_RADIUS)) {
      speed = (0.95 * speed + TARGET_SPEED*0.05);
      dx = speed * (x-danger.x)/distance;
      dy = speed * (y-danger.y)/distance;
      smile.frown();
    } else {
      dx = 0.995 * dx ;
      dy = 0.995 * dy ;
    }
  }
}
