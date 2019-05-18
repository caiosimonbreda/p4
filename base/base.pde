import controlP5.*;


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

// ---!---!---!---!---!---!---!---!---!---!---!---!---! SAVE PLAYER NAME ---!---!---!---!---!---!---!---!---!---!---!

void SavePlayerName(){
  
  //Saving player name
  playername = cp5.get(Textfield.class, "nameinput").getText();
  
  //ACTIONS TRIGGERED BY SUBMITTING NAME:
  
  //Hide text field and submit button
  cp5.hide();
  
  //Place initial assets
  //--here--
}
