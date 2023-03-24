import peasy.*;

// PeasyCam is required as it grants visual observation of the cube
PeasyCam cam;

// Controls the speed of the rotations.
float speed = 0.05;
// This controls the size of the cube. Note: changing from 3 will break the code 
// as this was designed for a rubik's cube which is a 3x3x3 cube
int dim = 3;
Cube[] cube = new Cube[dim*dim*dim];

// List of every move that can be done.
Move[] allMoves = new Move[] {
  new Move(0, 1, 0, 1), 
  new Move(0, 1, 0, -1), 
  new Move(0, -1, 0, 1), 
  new Move(0, -1, 0, -1), 
  new Move(1, 0, 0, 1), 
  new Move(1, 0, 0, -1), 
  new Move(-1, 0, 0, 1), 
  new Move(-1, 0, 0, -1), 
  new Move(0, 0, 1, 1), 
  new Move(0, 0, 1, -1), 
  new Move(0, 0, -1, 1), 
  new Move(0, 0, -1, -1) 
};
// Creating the sequence array
ArrayList<Move> sequence = new ArrayList<Move>();
int counter = 0;

boolean started = false;

Move currentMove;

// This block of code creates the cube within the code as well as the peasycam that will be used to visually view the cube
void setup() {
  size(600, 600, P3D);
  //fullScreen(P3D);
  cam = new PeasyCam(this, 400);
  int index = 0;
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[index] = new Cube(matrix, x, y, z);
        index++;
      }
    }
  }
// Number of moves made when shuffling. Currently 25.
  for (int i = 0; i < 25; i++) {
    // this code selects a random move from the allMove array and adds it to the sequence
    int r = int(random(allMoves.length));
    Move m = allMoves[r];
    sequence.add(m);
  }

  currentMove = sequence.get(counter);

// This code takes the moves stored in sequence and reverses it.
  for (int i = sequence.size()-1; i >= 0; i--) {
    Move nextMove = sequence.get(i).copy();
    nextMove.reverse();
    sequence.add(nextMove);
  }

}
// This code just adds a counter to show the amount of moves that were made
void draw() {
  background(51); 

  cam.beginHUD();
  fill(255);
  textSize(32);
  text(counter, 100, 100);
  cam.endHUD();

  rotateX(-0.5);
  rotateY(0.4);
  rotateZ(0.1);



  currentMove.update();
  if (currentMove.finished()) {
    if (counter < sequence.size()-1) {
      counter++;
      currentMove = sequence.get(counter);
      currentMove.start();
    }
  }
// Creates the cube within a 3D space to be viewed with peasycam
  scale(50);
  for (int i = 0; i < cube.length; i++) {
    push();
    // Changed the cube in order to match the moves made
    if (abs(cube[i].z) > 0 && cube[i].z == currentMove.z) {
      rotateZ(currentMove.angle);
    } else if (abs(cube[i].x) > 0 && cube[i].x == currentMove.x) {
      rotateX(currentMove.angle);
    } else if (abs(cube[i].y) > 0 && cube[i].y ==currentMove.y) {
      rotateY(-currentMove.angle);
    }   
    cube[i].show();
    pop();
  }
}
