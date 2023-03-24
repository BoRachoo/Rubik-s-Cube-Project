// Creating the class cube to hold x, y, z, color and faces matrix.
class Cube {
  PMatrix3D matrix;
  int x = 0;
  int y = 0;
  int z = 0;
  color c;
  Face[] faces = new Face[6];

  Cube(PMatrix3D m, int x, int y, int z) {
    this.matrix = m;
    this.x = x;
    this.y = y;
    this.z = z;
    c = color(255);
    // Assigning the 6 colours to different faces of the cube
    faces[0] = new Face(new PVector(0, 0, -1), color(0, 0, 255)); // Blue
    faces[1] = new Face(new PVector(0, 0, 1), color(0, 255, 0)); // Green
    faces[2] = new Face(new PVector(0, 1, 0), color(255, 255, 255)); // White
    faces[3] = new Face(new PVector(0, -1, 0), color(255, 255, 0)); // Yellow
    faces[4] = new Face(new PVector(1, 0, 0), color(255, 150, 0)); // Orange
    faces[5] = new Face(new PVector(-1, 0, 0), color(255, 0, 0)); // Red
  }
  // These 3 pieces of code allow the faces in the Face tab to be called
  void turnFacesZ(int dir) {
    for (Face f : faces) {
      f.turnZ(dir*HALF_PI); 
    }
  }

  void turnFacesY(int dir) {
    for (Face f : faces) {
      f.turnY(dir*HALF_PI); 
    }
  }

    void turnFacesX(int dir) {
    for (Face f : faces) {
      f.turnX(dir*HALF_PI); 
    }
  }
  
  
  // used to translate moves made to the cube
  void update(int x, int y, int z) {
    matrix.reset(); 
    matrix.translate(x, y, z);
    this.x = x;
    this.y = y;
    this.z = z;
  }

  void show() {
    //fill(c);
    noFill();
    // Color of the seperating lines. 0 = black, 255 = White
    stroke(0);
    // Controls the thickness of the seperating lines. 0.1 seems to be more accurate than other numbers
    strokeWeight(0.1);
    pushMatrix(); // Saves the transformation state
    applyMatrix(matrix);
    box(1);
    for (Face f : faces) {
      f.show();
    }
    popMatrix(); // Restores the transformation state
  }
}
