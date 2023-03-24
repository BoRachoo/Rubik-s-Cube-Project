// This code starts the shuffling of the cube by pressing the spacebar.
// Note: Once the unshuffling has been done, A new instance of the solver will need to be created for a new random sequence.
void keyPressed() {
  if (key == ' ') {
    currentMove.start();
    counter = 0;
  }
  // applyMove(key);
}
