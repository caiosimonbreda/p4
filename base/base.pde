import controlP5.*;

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
// Placeholders are viable for now
// Functionality over trim
//
//170, 205, 245

ControlP5 cp5;

PImage madlad;
PImage daysky;

String playername;

void setup(){
  size(1920, 1080);
  shapeMode(CENTER);
  smooth(8);
  
  madlad = loadImage("madman.png");
  daysky = loadImage("sky.png");
  
  cp5 = new ControlP5(this);
  
  cp5
  .addTextfield("nameinput")
  .setColorBackground(color(255)) 
  .setPosition((width/2)-200, (height/2)-50).setSize(400, 100)
  .setAutoClear(false)
  .setColorForeground(color(0))
  .setColorActive(color(0))
  .setFont(createFont("arial",24))
  .setCaptionLabel("")
  .setColor(color(0));
  
  cp5
  .addBang("SavePlayerName")
  .setPosition((width/2)-100, (height/2)+50)
  .setSize(200, 60);
}

void draw() {
  //image(madlad, 0, 0);
  background(daysky);
  
}

void SavePlayerName(){
  playername = cp5.get(Textfield.class, "nameinput").getText();
  print(playername);
   
}
