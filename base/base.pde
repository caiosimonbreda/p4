
// Assets needed:
//
// Background
// House (w/ blank name plaque)
// Scorched house
// Town sign
// Scorched town sign
// Mailbox
// Scorched mailbox
// Shrubs (2 variants)
// Young trees (2 variants)
// Taller trees (2 variants)
// Grown trees (2 variants)
// Scorched trees (2 variants)
// Birds n shit 
// Dialogue boxes, buttons, 
//
//
//
//
//
//




PImage madlad;

void setup(){
  size(1366, 768);
  shapeMode(CENTER);
  smooth(8);
  
  madlad = loadImage("madman.png");
}

void draw() {
  image(madlad, 30, 30);
}
