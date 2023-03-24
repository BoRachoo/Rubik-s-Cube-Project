// This block of code is used to make moves on the Z axis. 
void turnZ(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cube qbe = cube[i];
    if (qbe.z == index) {
      // The specific Z axis is targeted by using a 2D matrix so only the blocks that are moving should be targeted.
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qbe.x, qbe.y);
      qbe.update(round(matrix.m02), round(matrix.m12), round(qbe.z));
      qbe.turnFacesZ(dir);
    }
  }
}

// This block of code is used to make moves on the Y axis. 
void turnY(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cube qbe = cube[i];
    if (qbe.y == index) {
      // The specific Y axis is targeted by using a 2D matrix so only the blocks that are moving should be targeted.
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qbe.x, qbe.z);
      qbe.update(round(matrix.m02), qbe.y, round(matrix.m12));
      qbe.turnFacesY(dir);
    }
  }
}

// This block of code is used to make moves on the X axis. 
void turnX(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cube qbe = cube[i];
    if (qbe.x == index) {
      // The specific X axis is targeted by using a 2D matrix so only the blocks that are moving should be targeted.
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qbe.y, qbe.z);
      qbe.update(qbe.x, round(matrix.m02), round(matrix.m12));
      qbe.turnFacesX(dir);
    }
  }
}
