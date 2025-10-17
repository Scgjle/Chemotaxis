final int NUM_ELLIPSES = 20;
WigglyEllipse[] ellipses = new WigglyEllipse[NUM_ELLIPSES];

void setup() {
  size(800, 600);
  for (int i = 0; i < NUM_ELLIPSES; i++) {
    ellipses[i] = new WigglyEllipse(width / 2, height / 2, 10);
  }
}

void draw() {
  background(20);
  for (int i = 0; i < NUM_ELLIPSES; i++) {
    ellipses[i].update(mouseX, mouseY);
    ellipses[i].wow((int)(Math.random()*20));
  }
}

void mousePressed() {
  for (int i = 0; i < NUM_ELLIPSES; i++) {
    ellipses[i].shootOut();
  }
}

class WigglyEllipse {
  float x, y;
  float vx = 0, vy = 0;
  float stepSize;
  boolean isShooting = false;

  WigglyEllipse(float startX, float startY, float step) {
    x = startX;
    y = startY;
    stepSize = step;
  }

  void shootOut() {
    float angle = random(TWO_PI);
    float speed = random(3, 8);
    vx = cos(angle) * speed;
    vy = sin(angle) * speed;
    isShooting = true;
  }

  void update(float targetX, float targetY) {
    if (isShooting) {
      x += vx;
      y += vy;
      vx *= 0.98;
      vy *= 0.98;

      // Stop shooting if speed is low
      if (abs(vx) < 0.1 && abs(vy) < 0.1) {
        isShooting = false;
      }
    } else {
      float dx = targetX - x;
      float dy = targetY - y;
      float randX = random(-stepSize, stepSize);
      float randY = random(-stepSize, stepSize);

      if (dx > 0) x += abs(randX);
      else x -= abs(randX);

      if (dy > 0) y += abs(randY);
      else y -= abs(randY);
    }
  }

  void wow(int id) {
    if (isShooting == true) {
      fill((int)(Math.random()*200));
    } else {
      fill(id * 10, 100, 200);
    }
    noStroke();
    ellipse(x, y, 30, 30);
  }
}
