/* A simple animation of Isaac Newton, avoidng a pineapple.
 Ansgar 2023
 */

Newton isaac;
Pineapple fruit;

void setup() {
  size(800, 800);
  isaac = new Newton(600, 600);
  fruit = new Pineapple(200, 200);
}


void draw() {
  background(200, 250, 100);
  isaac.display();
  isaac.animate();
  isaac.avoid(fruit);
  fruit.display();
  fruit.animate();
}

void mousePressed() {
  isaac.poke(mouseX, mouseY);
  fruit.tick(mouseX, mouseY);
}
