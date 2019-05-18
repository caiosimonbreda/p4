import controlP5.*;

// --- INITIALIZE CONTROLP5 VARIABLE FOR INITIAL FORM
ControlP5 cp5;

// --- PROJECT FONTS


// --- TIMER VARIABLES
float lasttimecheck;
float timeinterval;

// --- PLAYER NAME
String playername;

// --- STAGE VARIABLES
Boolean stage0 = false;
Boolean stage1 = false;
Boolean stage2 = false;
Boolean stage3 = false;
Boolean stage4 = false;
Boolean stage5 = false;
Boolean stage6 = false;
Boolean stage7 = false;

// --- ASSET VARIABLE DECLARATIONS AND THEIR RESPECTIVE PARAMETERS
PImage truck;
Float truckX = 830.0;
Float truckY = 655.0;
Float truckPace = 1.0;
Boolean truckGo = false;
Boolean truckGone = false;

PImage daysky;
PImage ground1, ground2, ground3;

// --- DIALOGUE AND OTHER STRING VARIABLES
String dial1 = "After almost a decade, you come back to visit your old childhood home; only to find it in a dreadful condition - cracked walls, broken roof tiles and rotting door frames: In order to be able to afford the costs of restoring it, you decided on selling all of that timber growing around your land. ";



// ---!---!---!---!---!---!---!---!---!---!---!---!---!---! SETUP  ---!---!---!---!---!---!---!---!---!---!---!---!---!
void setup(){
  size(1920, 1080);
  smooth(8);

  
  // --- LOAD ASSET IMAGES INTO VARIABLES
  truck = loadImage("truck.png");
  daysky = loadImage("sky.png");
  ground1 = loadImage("plano1.png");
  ground2 = loadImage("plano2.png");
  ground3 = loadImage("plano3.png");
  
  // --- CtrlP5 INITIALIZATION
  cp5 = new ControlP5(this);
  
  // --- TEXTFIELD PARAMETERS
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
  
  // --- START BUTTON PARAMETERS
  cp5
  .addBang("SavePlayerName")
  .setPosition((width/2)-100, (height/2)+50)
  .setSize(200, 60);
}



// ---!---!---!---!---!---!---!---!---!---!---!---!---! SAVE PLAYER NAME ---!---!---!---!---!---!---!---!---!---!---!

void SavePlayerName(){

  String namebuffer = cp5.get(Textfield.class, "nameinput").getText();
  
  //Verify if name isn't empty
  
  if(namebuffer != ""){
    //save player name to playername variable
    playername = cp5.get(Textfield.class, "nameinput").getText();
  
    //ACTIONS TRIGGERED BY SUBMITTING NAME:
    
    //Hide text field and submit button
    cp5.hide();
    
    //Start drawing stage #0
    stage0 = true;
    lasttimecheck = millis();

  }

}


// ---!---!---!---!---!---!---!---!---!---!---!---!---!---! DRAW  ---!---!---!---!---!---!---!---!---!---!---!---!---!

void draw() {
  //image(madlad, 0, 0);
  background(daysky);
  
  if(stage0){
    // GROUND
    image(ground3, -1, 590);
    image(ground2, -1, 880);
    image(ground1, -1, 925);
    
    // TEXT - BACKSTORY
    textFont(createFont("arial",24));
    text(dial1, 845, 700, 400, 200);
    
    // !--- FOREGROUND ---!
    
    // TRUCK
    image(truck, truckX, truckY);
    
    if(millis() > lasttimecheck + 3000){
      truckGone = true;
    }
    
    if(truckGone){
      truckX += truckPace;
      truckPace += truckPace/24;
      print(millis());
      print("\n");
    }



  }
}
