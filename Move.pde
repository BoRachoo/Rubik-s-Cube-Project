// Move class requires each axis and the angle float because each turn is a 0 to 90 degree angle
class Move {
  float angle = 0;
  int x = 0;
  int y = 0;
  int z = 0;
  int dir;
  boolean animating = false;
  boolean finished = false;
// Direction is needed to know what direction the rotation is being made in
  Move(int x, int y, int z, int dir) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.dir = dir;
  }

  Move copy() {
    return new Move(x, y, z, dir);
  }

  void reverse() {
    dir *= -1;
  }
// this code triggers the animations start and ensures that the value of angle is 0 before a turn is made
  void start() {
    animating = true;
    finished = false;
    this.angle = 0;
  }

  boolean finished() {
    return finished;
  }
// this is used to update the animations current state from animating to finished.
  void update() {
    if (animating) {
      angle += dir * speed;
      if (abs(angle) > HALF_PI) {
        angle = 0;
        animating = false;
        finished = true;
        if (abs(z) > 0) {
          turnZ(z, dir);
        } else if (abs(x) > 0) {
          turnX(x, dir);
        } else if (abs(y) > 0) {
          turnY(y, dir);
        }
      }
    }
  }
}
