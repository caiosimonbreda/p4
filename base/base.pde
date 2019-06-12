import controlP5.*;

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

// --- CHOICE VARIABLES
boolean treeChoice = false;

// --- ASSET VARIABLE DECLARATIONS AND THEIR RESPECTIVE PARAMETERS
PImage truck;
Float truckX = 830.0;
Float truckY = 655.0;
Float truckPace = 1.0;
Boolean truckGo = false;
Boolean truckGone = false;


PImage officer;
Float officerX = 650.0;
Float officerY = 1100.0;
Boolean officerCome = false;
Boolean officerGo = false;

PImage daysky;
PImage ground1, ground2, ground3, nostumps1, nostumps2;
PImage cabin;
PImage townsign;
PImage next;



// --- DIALOGUE AND OTHER TEXT-RELATED VARIABLES
int dialogueOpacity;
PImage buffer;
PImage backstory;
PImage dial1; //FOfficer
PImage dial2; //FOfficer
PImage dial3; //FOfficer
PImage dial4; //FOfficer
PImage dial5; //Neighbours
PImage dial6; //Granny
PImage dial7; //Granny
PImage dial8; //Granny
PImage dial9; //Granny
PImage dial10; 
PImage dial11;
PImage dial12;
PImage dial13;
PImage dial14;
PImage dial15;
PImage dial16;
PImage treechoice;
PImage namebox;
PImage start;
PImage yourname;
PImage coinbag;
PImage eucalyptus1;
PImage mix1;
PImage eucalyptus2_1;
PImage eucalyptus2_2;
PImage eucalyptus3_1;
PImage eucalyptus3_2;
PImage mix2_1;
PImage mix2_2;
PImage mix3_1;
PImage mix3_2;

float fadeToBlack;

PImage lesstimber;
PImage pluscash;
PImage neighbours;
float neighboursY = 1100.0;
boolean neighboursCome = false;

PImage granny;
float grannyY = 1100.0;
boolean grannyCome = false;


PImage balloon;
float balloonX = 1600;
float balloonY = 250;
float balloonPace = 0.1;

PImage namesign;
PImage clouds;
float cloudsY = 630;
float cloudsPace = 0.11;
boolean cloudsGoUp = true;

PImage cirrus;
float cirrusX = 705;



// ---!---!---!---!---!---!---!---!---!---!---!---!---!---! SETUP  ---!---!---!---!---!---!---!---!---!---!---!---!---!
void setup(){
  size(1920, 1080);
  smooth(8);
  clickCounter = 0;
  dialogueOpacity = 0;
  parallax = 1080;
  fadeToBlack = 0;
  
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
  nostumps1 = loadImage("nostumps1.png");
  nostumps2 = loadImage("nostumps2.png");
  dial3 = loadImage("ifeuc.png");
  dial4 = loadImage("ifmix.png");
  neighbours = loadImage("neighbours.png");
  dial5 = loadImage("neighbourtalk.png");
  mix1 = loadImage("mix1.png");
  eucalyptus2_1 = loadImage("eucalyptus2_1.png");
  eucalyptus2_2 = loadImage("eucalyptus2_2.png");
  eucalyptus3_1 = loadImage("eucalyptus_3_1.png");
  eucalyptus3_2 = loadImage("eucalyptus_3_2.png");
  mix2_1 = loadImage("mix2_1.png");
  mix2_2 = loadImage("mix2_2.png");
  mix3_1 = loadImage("mix_3_1.png");
  mix3_2 = loadImage("mix_3_2.png");
  granny = loadImage("granny.png");
  dial6 = loadImage("ladyeuc_1.png");
  dial7 = loadImage("ladyeuc_2.png");
  dial8 = loadImage("ladymix_1.png");
  dial9 = loadImage("ladymix_2.png");
    
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



 //---!---!---!---!---!---!---!---!---!---!---!---!---! SAVE PLAYER NAME ---!---!---!---!---!---!---!---!---!---!---!

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
    prestage = false;
    stage0 = true;
    lasttimecheck = millis();

  }

}


// ---!---!---!---!---!---!---!---!---!---!---!---!---!---! DRAW  ---!---!---!---!---!---!---!---!---!---!---!---!---!

void draw() {
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
       balloonPace = balloonPace * 1.01;
     }
     
     if(cirrusX > -400){
        cirrusX -= 0.3;
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
    
    if(clickCounter == 4){
      if(treeChoice){
        buffer  = dial3;
      } else {
        buffer = dial4;
      }
      
      tint(255, dialogueOpacity);
      image(buffer, 585, 315);
      image(next, 1220, 430);
      tint(255, 255);
      
      if(dialogueOpacity < 255){
        dialogueOpacity += 5;
      }
    }
    
    if(clickCounter == 5){
      fill(0, 0, 0, fadeToBlack);
      rect(0, -35, 1920, 1080);
      
      if(fadeToBlack < 255){
        fadeToBlack +=5; 
      }
      
      if(fadeToBlack == 255){
        clickCounter = 0;
        lasttimecheck = millis();
        stage1 = false;
        stage2 = true;
        dialogueOpacity = 0;
      }
      
    }
    
  } //end of stage 1  --- FADE TO BLACK?
  
  // ---!---!---!---!---!---!---!---!---!---!---!---!---!---! STAGE TWO  ---!---!---!---!---!---!---!---!---!---!---!---!---! 2
  if (stage2) {
    
    translate(0, parallax);
    // GROUND & STATIC ASSETS
    tint(255, 160);
    image(clouds, width/2- 295 , cloudsY);
    tint(255, 255);
    image(ground3, -1, 590); //mountain
    image(nostumps2, -1, 910);
    image(cabin, 30, 570);
    image(townsign, 1700, 900);
    
    //TREES
    if(treeChoice){
      image(mix1, 2, 825);
    } else {
      image(eucalyptus1, 2, 825);
    }
    
    image(nostumps1, -1, 987);
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
    
    // --- EXCLUSIVES
    neighbours.resize(230, 205);
    
    if(clickCounter == 0){
      fill(0, 0, 0, fadeToBlack);
      rect(0, -35, 1920, 1080);
    
      if(fadeToBlack > 0){
        fadeToBlack -= 5;
      }
    }
    
    if(clickCounter == 0 && millis() > lasttimecheck + 3000){
      neighboursCome = true;
    }
    if(clickCounter == 0 && neighboursCome && neighboursY > 815){
      neighboursY -= 10;
    }
    image(neighbours, 780, neighboursY);
    
    if(clickCounter == 0 && (millis() > lasttimecheck + 4000)){
      tint(255, dialogueOpacity);
      image(dial5, 585, 229);
      image(next, 1220, 430);
      tint(255, 255);
      
      if(dialogueOpacity < 255){
        dialogueOpacity += 5;
      }
    }
    
    if(clickCounter == 1){
      tint(255, dialogueOpacity);
      image(dial5, 585, 229);
      image(next, 1220, 430);
      
      if(dialogueOpacity > 0){
         dialogueOpacity -= 5;
      }
      
      if(neighboursY < 1100){
        neighboursY += 10;
      }
      
      if(dialogueOpacity <= 5){
         clickCounter++;
         fadeToBlack = 0;
      }
    }
    
    print(clickCounter + "\n");
    print(fadeToBlack + "\n");
    
    if(clickCounter == 2){
      //TAKE CARE OF THE PLANTS HERE
      //print("FELLAS WE'RE IN");
      //fade to black
      if(fadeToBlack < 255.0){
        fadeToBlack += 5.0;
      }
      
      fill(0, 0, 0, fadeToBlack);
      rect(0, -35, 1920, 1080);
            
      if(fadeToBlack == 255){
        dialogueOpacity = 0;
        lasttimecheck = millis();
        stage2 = false;
        stage3 = true;
        clickCounter = 0;
      }
    }
  } //End of stage 2

  // ---!---!---!---!---!---!---!---!---!---!---!---!---!---! STAGE THREE  ---!---!---!---!---!---!---!---!---!---!---!---!---! 3
  if (stage3) {
    translate(0, parallax);
    
    // GROUND & STATIC ASSETS
    tint(255, 160);
    image(clouds, width/2- 295 , cloudsY);
    tint(255, 255);
    image(ground3, -1, 590); //mountain
    //TREES BACK
    if(treeChoice){
      image(mix2_2, 480, 680);
    } else {
      image(eucalyptus2_2, 480, 680);
    }
    image(nostumps2, -1, 910);
    //TREES FRONT
    if(treeChoice){
      image(mix2_1, -20, 170);
    } else {
      image(eucalyptus2_1, -20, 170);
    }
    image(cabin, 30, 570);
    image(townsign, 1700, 900);
    image(nostumps1, -1, 987);
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
    
    //FADE
    if(clickCounter == 0){
      fill(0, 0, 0, fadeToBlack);
      rect(0, -35, 1920, 1080);
    
      if(fadeToBlack > 0){
        fadeToBlack -= 5;
      }
    }
    
    // --- EXCLUSIVES
    
    granny.resize(140, 215);
    
    if(clickCounter == 0 && millis() > lasttimecheck + 3000){
      grannyCome = true;
    }
    if(clickCounter == 0 && grannyCome && grannyY > 815){
      grannyY -= 10;
    }
    image(granny, 780, grannyY);
    


    if(clickCounter == 0 && (millis() > lasttimecheck + 4000)){
      
      tint(255, dialogueOpacity);
      if(treeChoice){
        image(dial6, 585, 320);
      }
      else {
        image(dial8, 585, 320);
      }
      image(next, 1220, 430);
      tint(255, 255);
      
      if(dialogueOpacity < 255){
        dialogueOpacity += 5;
      } 
    }
    
    if(clickCounter == 1){
      tint(255, dialogueOpacity);
      if(treeChoice){
        image(dial6, 585, 320);
      }
      else {
        image(dial8, 585, 320);
      }
      image(next, 1220, 430);
      
      if(dialogueOpacity > 0){
         dialogueOpacity -= 5;
      }
      
      if(dialogueOpacity == 0){
         clickCounter++;
      }
    }
    
    if(clickCounter == 2){
      
      tint(255, dialogueOpacity);
      if(treeChoice){
        image(dial7, 585, 320);
      }
      else {
        image(dial9, 585, 320);
      }
      image(next, 1220, 430);
      tint(255, 255);
      
      if(dialogueOpacity < 255){
        dialogueOpacity += 5;
      } 
    }
    
    if(clickCounter == 3){
       tint(255, dialogueOpacity);
      if(treeChoice){
        image(dial7, 585, 320);
      }
      else {
        image(dial9, 585, 320);
      }
      image(next, 1220, 430);
      tint(255, 255);
      
      if(dialogueOpacity > 0){
         dialogueOpacity -= 5;
      }
      
      if(dialogueOpacity == 0){
         clickCounter++;
      } 
    }
    
    if(clickCounter == 4){
      if(fadeToBlack < 255.0){
        fadeToBlack += 5.0;
      }
      
      fill(0, 0, 0, fadeToBlack);
      rect(0, -35, 1920, 1080);
      
      if(fadeToBlack == 255){
        dialogueOpacity = 0;
        lasttimecheck = millis();
        stage3 = false;
        stage4 = true;
        clickCounter = 0;
      }
    }
    



    
    
    
  } //End of stage 3
  
  // ---!---!---!---!---!---!---!---!---!---!---!---!---!---! STAGE FOUR  ---!---!---!---!---!---!---!---!---!---!---!---!---! 4
  if (stage4) {
    translate(0, parallax);
    
    // GROUND & STATIC ASSETS
    tint(255, 160);
    image(clouds, width/2- 295 , cloudsY);
    tint(255, 255);
    image(ground3, -1, 590); //mountain
    //TREES BACK
    if(treeChoice){
      image(mix3_2, 480, 520);
    } else {
      image(eucalyptus3_2, 480, 520);
    }
    image(nostumps2, -1, 910);
    //TREES FRONT
    if(treeChoice){
      image(mix3_1, -20, 10);
    } else {
      image(eucalyptus3_1, -20, 10);
    }
    image(cabin, 30, 570);
    image(townsign, 1700, 900);    
    image(nostumps1, -1, 987);
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
    
    //FADE
    if(clickCounter == 0){
      fill(0, 0, 0, fadeToBlack);
      rect(0, -35, 1920, 1080);
    
      if(fadeToBlack > 0){
        fadeToBlack -= 5;
      }
    }
    
    // --- EXCLUSIVES

    
    
    
    
  } //End of stage 4

  if (stage5) {
    //Begin stage 5
  } //End of stage 5

  if (stage6) {
    //Begin stage 6
  } //End of stage 6

  if (stage7) {
    //Begin stage 7
  } //End of stage 7
  
}

// ---!---!---!---!---!---!---!---!---!---!---!---!---!---!---!---! MOUSE CLICKED  ---!---!---!---!---!---!---!---!---!---!---!---!---! 1
void mouseClicked(){
  
  if(stage0 && (mouseX >= 1220 && mouseX <= 1286 && mouseY >= 465 && mouseY <= 525)){
    clickCounter++;
  }
  
  if(stage1 && clickCounter <= 1 && (mouseX >= 1220 && mouseX <= 1286 && mouseY >= 465 && mouseY <= 525)){
    clickCounter++;
  }
  
  if(stage0 && clickCounter >= 1){
    stage0 = false;
    stage1 = true;
    clickCounter = 0;
    dialogueOpacity = 0;
  }
  
  // STAGE ONE 1
  
  if(stage1 && clickCounter == 3 && (mouseX > 735 && mouseX < 1009) && (mouseY > 278 && mouseY < 428)){
    treeChoice = false; //Eucaliptos
    clickCounter++;
  }

  if(stage1 && clickCounter == 3 && (mouseX > 1008 && mouseX < 1218) && (mouseY > 278 && mouseY < 428)){
    treeChoice = true; //Mistura
    clickCounter++;
  }
  
  if(stage1 && clickCounter == 4 && (mouseX >= 1220 && mouseX <= 1286 && mouseY >= 465 && mouseY <= 525)){
    clickCounter++;
  }
  
  // STAGE TWO 2
  
  if(stage2 && clickCounter == 0 && (mouseX >= 1220 && mouseX <= 1286 && mouseY >= 465 && mouseY <= 525)){
    clickCounter++;
  }
  
  // STAGE THREE 3
  
  if(stage3 && clickCounter == 0 && (mouseX >= 1220 && mouseX <= 1286 && mouseY >= 465 && mouseY <= 525)){
     clickCounter++;
  }
  
  if(stage3 && clickCounter == 2 && (mouseX >= 1220 && mouseX <= 1286 && mouseY >= 465 && mouseY <= 525)){
     clickCounter++;
  }
  
  
}
