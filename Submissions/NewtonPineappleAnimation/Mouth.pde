/*
Mouth - Example of a thing for COMP1050
 The fact that the mouth does not have its own x and y position is not ideal,
 but a nice solution would require concepts like push and pop matrixes, or PVectors for which we do not have the time.
 (c) Ansgar 2023
 */

class Mouth {

  float x;
  float y;
  int frownCounter = 0;
  float size;

  Mouth(float initX, float initY, float initSize) {
    // Nothing here
    x = initX;
    y = initY;
    size = initSize;
  }


  void display() {
    stroke(0);
    strokeWeight(3);
    noFill();
    if (frownCounter == 0) {
      arc(x, y, size, size, 0, PI);
    } else {
      arc(x, y+size/2, size, size, PI, 2*PI);
    }
  }
  void move(float newX, float newY) {
    x = newX;
    y = newY;
  }
  void animate() {
    
    if (frownCounter > 0) {
      frownCounter--;
    } else {
      frownCounter = 0;
    }
  }

  void frown() {
    frownCounter = 30;
  }
}
