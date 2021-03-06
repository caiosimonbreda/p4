import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class base extends PApplet {



// --- INITIALIZE CONTROLP5 VARIABLE FOR INITIAL FORM
ControlP5 cp5;

// PROJECT-WIDE CLICK COUNTER (RESET AT EACH STAGE)
int clickCounter;

// --- PROJECT FONTS

// --- ECONOMICS/MONETARY SYSTEM
int wallet = 1000;

// --- TIMER VARIABLES
float lasttimecheck;
float timeinterval;
float parallax;

// --- PLAYER NAME
String playername;

// --- STAGE VARIABLES
boolean prestage = true;
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
Float truckX = 830.0f;
Float truckY = 655.0f;
Float truckPace = 1.0f;
Boolean truckGo = false;
Boolean truckGone = false;


PImage officer;
Float officerX = 650.0f;
Float officerY = 1100.0f;
Boolean officerCome = false;
Boolean officerGo = false;

PImage daysky;
PImage ground1, ground2, ground3;
PImage cabin;
PImage townsign;
PImage next;



// --- DIALOGUE AND OTHER TEXT-RELATED VARIABLES
int dialogueOpacity;
PImage buffer;
PImage backstory;
PImage dial1;
PImage dial2;
PImage treechoice;
PImage namebox;
PImage start;
PImage yourname;
PImage coinbag;
PImage eucalyptus1;

PImage lesstimber;
PImage pluscash;
PImage balloon;
float balloonX = 1600;
float balloonY = 250;
float balloonPace = 0.1f;

PImage namesign;
PImage clouds;
float cloudsY = 630;
float cloudsPace = 0.11f;
boolean cloudsGoUp = true;

PImage cirrus;
float cirrusX = 705;



// ---!---!---!---!---!---!---!---!---!---!---!---!---!---! SETUP  ---!---!---!---!---!---!---!---!---!---!---!---!---!
public void setup(){
  
  
  clickCounter = 0;
  dialogueOpacity = 0;
  parallax = 1080;
  
  // --- LOAD ASSET IMAGES INTO VARIABLES
  truck = loadImage("truck.png");
  daysky = loadImage("sky.png");
  cabin = loadImage("cabin.png");
  townsign = loadImage("townsign.png");
  ground1 = loadImage("plano1.png");
  ground2 = loadImage("plano2.png");
  ground3 = loadImage("plano3.png");
  officer = loadImage("officer.png");
  backstory = loadImage("backstory.png");
  next = loadImage("next.png");
  dial1 = loadImage("dial1.png");
  dial2 = loadImage("dial2.png");
  treechoice = loadImage("treechoice.png");
  namebox = loadImage("namebox.png");
  start = loadImage("start.png");
  yourname = loadImage("yourname.png");
  coinbag = loadImage("coinbag.png");
  lesstimber = loadImage("lesstimber.png");
  pluscash = loadImage("pluscash.png");
  balloon = loadImage("balloon.png");
  clouds = loadImage("clouds.png");
  cirrus = loadImage("cirrus.png");
  namesign = loadImage("namesign.png");
  eucalyptus1 = loadImage("eucalyptus1.png");
  
  // --- CtrlP5 INITIALIZATION
  cp5 = new ControlP5(this);
  
  // --- TEXTFIELD PARAMETERS
  cp5
  .addTextfield("nameinput")
  .setColorBackground(color(255, 1)) 
  .setPosition((width/2)-160, (height/2)-120).setSize(320, 100)
  .setAutoClear(false)
  .setCaptionLabel(" ")
  .setColorForeground(color(0, 1))
  .setColorActive(color(0, 1))
  .setFont(createFont("comic sans ms",28))
  .setCaptionLabel("")
  .setColor(color(0));
  
  // --- START BUTTON PARAMETERS
  cp5
  .setColorActive(color(255, 1))
  .addBang("SavePlayerName")
  .setCaptionLabel(" ")
  .setColorBackground(color(255, 1))
  .setPosition((width/2) - 82, (height/2) + 1)
  .setColorForeground(color(255, 1))
  .setSize(164, 77);
}



// ---!---!---!---!---!---!---!---!---!---!---!---!---! SAVE PLAYER NAME ---!---!---!---!---!---!---!---!---!---!---!

public void SavePlayerName(){

  String namebuffer = cp5.get(Textfield.class, "nameinput").getText();
  
  //Verify if name isn't empty
  
  if(namebuffer != ""){
    //save player name to playername variable
    playername = cp5.get(Textfield.class, "nameinput").getText();
  
    //ACTIONS TRIGGERED BY SUBMITTING NAME:
    
    //Hide text field and submit button
    cp5.hide();
    
    //Start drawing stage #0
    prestage = false;
    stage0 = true;
    lasttimecheck = millis();

  }

}


// ---!---!---!---!---!---!---!---!---!---!---!---!---!---! DRAW  ---!---!---!---!---!---!---!---!---!---!---!---!---!

public void draw() {
  // --- DRAW BACKGROUND
  background(daysky);
  
  //Clouds movement (Y axis)
    if(cloudsGoUp){
      if(cloudsY >= 620){
        cloudsY -= cloudsPace;
      } else {
        cloudsGoUp = false;
      }
    } else {
      if(cloudsY < 640){
        cloudsY += cloudsPace;
      } else {
        cloudsGoUp = true;
      }
    }
  
  // ---!---!---!---!---!---!---!---!---!---!---!---!---! STAGE MINUS ONE  ---!---!---!---!---!---!---!---!---!---!---!---!---! -1
  if(prestage){
     image(namebox, (width/2) - 205, (height/2) - 125);
     image(start, (width/2) - 82, (height/2) + 1);
     image(yourname, (width/2 - 106), (height/2) - 180);
     
     tint(255, 150);
     image(cirrus, cirrusX , 0);
     tint(255, 255);
     
     image(balloon, balloonX, balloonY);
     
     if(balloonX <= 1920 || balloonY > 0){
       balloonX += balloonPace;
       balloonY -= balloonPace;
       balloonPace = balloonPace * 1.01f;
     }
     
     if(cirrusX > -400){
        cirrusX -= 0.3f;
     }
     
  }
 
 
  
  // ---!---!---!---!---!---!---!---!---!---!---!---!---! STAGE ZERO  ---!---!---!---!---!---!---!---!---!---!---!---!---! 0
  if(stage0){
    // GROUND & STATIC ASSETS
    if(parallax > 35){
       parallax -= 10;
    }
    
    
    
    translate(0, parallax);
    
    tint(255, 160);
    image(clouds, width/2- 295 , cloudsY);
    tint(255, 255);
    image(ground3, -1, 590);
    image(ground2, -1, 880);
    image(cabin, 30, 570);
    image(townsign, 1700, 900);
    image(ground1, -1, 925);
    image(namesign, 250, 740);
    
    textAlign(CENTER, CENTER);
    playername = playername.toUpperCase();
    fill(76, 48, 15);
    textFont(createFont("mv boli", 28));
    text(playername, 325, 770);
    
    
    // TEXT - BACKSTORY
    //textFont(createFont("arial",24));
    tint(255, dialogueOpacity);
    
    image(backstory, 570, 200);
    image(next, 1220, 430);
    
    tint(255, 255);
    
    // !--- FOREGROUND ---!
    
    // TRUCK
    image(truck, truckX, truckY);
    
    if(millis() > lasttimecheck + 1000){
      truckGo = true;
    }
    
    if(truckGo && (truckX <= 1920)){
      truckX += truckPace;
      truckPace += truckPace/24;
      if(dialogueOpacity <= 255){
        dialogueOpacity += 5;
      }
    }
  }
  
  // ---!---!---!---!---!---!---!---!---!---!---!---!---! STAGE ONE  ---!---!---!---!---!---!---!---!---!---!---!---!---! 1
  if(stage1){
    translate(0, parallax);
    // GROUND & STATIC ASSETS
    tint(255, 160);
    image(clouds, width/2- 295 , cloudsY);
    tint(255, 255);
    image(ground3, -1, 590);
    image(ground2, -1, 880);
    image(cabin, 30, 570);
    image(townsign, 1700, 900);
    image(ground1, -1, 925);
    image(namesign, 250, 740);
    
    textAlign(CENTER, CENTER);
    playername = playername.toUpperCase();
    fill(76, 48, 15);
    textFont(createFont("mv boli", 28));
    text(playername, 325, 770);
    
    
    // WALLET
    textFont(createFont("arial", 36));
    tint(255, dialogueOpacity);
    image(coinbag, 20, 20);
    fill(120, 80, 15, dialogueOpacity);
    text(wallet, 172, 72);
    fill(252, 212, 50, dialogueOpacity);
    text(wallet, 170, 70);
    tint(255, 255);
   
    
    // OFFICER
    image(officer, officerX, officerY);
    
    //print(clickCounter + "\n");
    
    if(officerY >= 800){
      officerY -= 6;        
    }
    if(officerY <= 800){
      
      if(clickCounter == 0){
        buffer = dial1;
      } else if (clickCounter == 1){
        buffer = dial2;
      }
      
      if(clickCounter <= 2){
        tint(255, dialogueOpacity);
        image(buffer, 585, 229);
        image(next, 1220, 430);
        tint(255, 255);
      }


      if(dialogueOpacity <= 255 && clickCounter < 2){
        dialogueOpacity += 5;
      }
    }

    if(clickCounter == 2){
      if(dialogueOpacity > 0){
        dialogueOpacity -= 5;
      }
    }
    
    if(clickCounter == 2 && dialogueOpacity == 0){
      clickCounter++;
    }
    
    if(clickCounter == 3){
      tint(255, dialogueOpacity);
      image(treechoice, 680, 230);
      tint(255, 255);
      
      if(dialogueOpacity < 255){
        dialogueOpacity += 5;
      }
    }
 
  } //end of stage 1

  if (stage2) {
    //Begin stage two
  }
  
}

// ---!---!---!---!---!---!---!---!---!---!---!---!---!---!---!---! MOUSE CLICKED  ---!---!---!---!---!---!---!---!---!---!---!---!---! 1
public void mouseClicked(){
  
  if(stage0 && (mouseX >= 1220 && mouseX <= 1286 && mouseY >= 430 && mouseY <= 490)){
    clickCounter++;
  }
  
  if(stage1 && clickCounter <= 1 && (mouseX >= 1220 && mouseX <= 1286 && mouseY >= 430 && mouseY <= 490)){
    clickCounter++;
  }
  
  if(stage0 && clickCounter >= 1){
    stage0 = false;
    stage1 = true;
    clickCounter = 0;
    dialogueOpacity = 0;
  }
  
  if(stage1 && clickCounter == 2){
    //draw trees
  }
  
}
  public void settings() {  size(1920, 1080);  smooth(8); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "base" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
