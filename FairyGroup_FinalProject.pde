import processing.sound.*;
SoundFile bgMusic;
SoundFile sparkle;

Table highScores;


//classes
fairyCreation fair;
ParticleSystem fairyDust;

//images
PImage homeScreen;
PImage gameBackground;
PImage endScreen;
PImage instructions;
PImage musicOptions;
PImage pickFairyScreen;

//buttons shapes
PShape instruct;
PShape music;
PShape off;
PShape on;
PShape returnHome;
PShape scoreBoard;
PShape startGame;
PShape no;
PShape yes;
PShape chooseFairy;

//buttons
Button startButton;
Button nextButton;
Button onButtonBG;
Button offButtonBG;
Button onButtonSFX;
Button offButtonSFX;
Button musicButton;
Button instructionsButton;
Button returnHomeButton;
Button scoreBoardButton;
Button yesButton;
Button noButton;
Button f1;
Button f2;
Button f3;
Button f4;



//hearts
int lives;
PShape heart;
float heartX;

//bubbles
int numBubs = 3;
ArrayList <Bubble> bubs = new ArrayList <Bubble>();

//coins
int numCoins = 2;
ArrayList <Coin> screenCoins = new ArrayList <Coin>();
ArrayList <Coin> collectedCoins = new ArrayList <Coin>();
int collected;

//booleans for buttons
boolean titleScreen = true;
boolean finalScreen = false;
boolean next = false;
boolean returnStart = false;
boolean gameScreen = false;
boolean musicSelection = false;
boolean fairySelection = false;
boolean instructionSelection = false;
boolean scoreBoardSelection = false; //put in scoreboard later
boolean bgSound=true;
boolean sfxSound =true;

//extra
PFont nine;
float gravity = 0.04;
boolean end = false;
PImage foreground;
int groundOffset = 0;
int scrollSpeed = 8;
String fairyNum= "1";




void setup() {
  frameRate(10);
  size(500, 500);
  nine = createFont("nine0.ttf", 20);
  textFont(nine);
  bgMusic = new SoundFile(this, "BarbieFairytopiaSoundtrack.wav");
  sparkle = new SoundFile(this, "SparkleSound.wav");
  highScores = loadTable("highScores.csv", "header");
  
 
  //load in images, load in background
  surface.setResizable(true);
  gameBackground = loadImage("background1.jpg"); //home menu
  surface.setSize(gameBackground.width, gameBackground.height);
  foreground = loadImage("foregrn.png");
  
  
  homeScreen = loadImage("startScreen.png");
  homeScreen.resize(width, height);
  musicOptions = loadImage("musicOptions.png");
  musicOptions.resize(width, height);
  pickFairyScreen = loadImage("pickFairyScreen.png");
  pickFairyScreen.resize(width, height);
  pickFairyScreen = loadImage("pickFairyScreen.png");
  pickFairyScreen.resize(width, height);
  endScreen = loadImage("endScreen.png");
  endScreen.resize(width, height);
  instructions = loadImage("Instructions.png");
  instructions.resize(width, height);
  
  
  
  
  //load in shapes
  heart = loadShape("heartsLives.svg");
  on = loadShape("buttondata/on.svg");
  off = loadShape("buttondata/off.svg");
  music = loadShape("buttondata/music.svg");
  instruct = loadShape("buttondata/instructions.svg");
  returnHome = loadShape("buttondata/returnHome.svg");
  scoreBoard = loadShape("buttondata/scoreBoard.svg");
  startGame = loadShape("buttondata/startGame.svg");
  no = loadShape("buttondata/no.svg");
  yes = loadShape("buttondata/yes.svg");
  chooseFairy = createShape(RECT, 0, 0, 110,145);
  chooseFairy.setFill(color(255,0));
  chooseFairy.setStroke(false);
  
 
  
  //creating the buttons
  shapeMode(CORNER);
  startButton = new Button(startGame, (width/2)-135, (height/2), 250,50);
  musicButton = new Button(music, width/2-135, height/1.5, 70, 40);
  instructionsButton = new Button(instruct, width/2-45, height/1.5, 70, 40);
  scoreBoardButton = new Button(scoreBoard, width/2+45, height/1.5, 70, 40);
  returnHomeButton = new Button(returnHome, width-175, height-75, 100, 50);
  yesButton = new Button(yes, (width/2) - 50, (height/2)+30, 80, 35);
  noButton = new Button(no, (width/2) - 50, (height/2)+ 80, 80, 35);
  nextButton = new Button(startGame,  width/2-75, height-65, 150, 50);
   
  f1 = new Button(chooseFairy,  88, 155, 110, 145);
  f2 = new Button(chooseFairy,  225, 155, 110, 145);
  f3 = new Button(chooseFairy,  365, 155, 110, 145);
  f4 = new Button(chooseFairy,  505, 155, 110, 145);


  onButtonBG = new Button(on, (width/2)-5, 120, 100, 65);
  offButtonBG = new Button(off, (width/2)+105, 120, 100, 65);
  
  onButtonSFX = new Button(on, (width/2)-5, 210, 100, 65);
  offButtonSFX= new Button(off, (width/2)+105, 210, 100, 65);
  
  //creating the fairygame
  fair = new fairyCreation(fairyNum,height/2, width/2, 50, 50);
  fairyDust = new ParticleSystem(new PVector(height/2, width/2));
  
  //load in bubbles
  for (int i = 0; i < numBubs; i++){
     bubs.add(new Bubble());
  }
  for (int i = 0; i < numCoins; i++){
     screenCoins.add(new Coin());
  }
  
  //set variables
  collected = 0;
  lives = 3;
  
  bgMusic.loop();
  
}

void draw() {
  
  
  
  
  if(titleScreen) {
    background((homeScreen));
    startButton.display();
    startButton.isActive = true;
    
    instructionsButton.display();
    instructionsButton.isActive = true;
    
    scoreBoardButton.display();
    scoreBoardButton.isActive = true;
    
    musicButton.display();
    musicButton.isActive = true;
    
    
    onButtonBG.isActive=false;
    offButtonBG.isActive=false;
    onButtonSFX.isActive=false;
    offButtonSFX.isActive=false;
    
  }
  else{
    startButton.isActive = false;
    instructionsButton.isActive = false;
    musicButton.isActive = false;
    scoreBoardButton.isActive = false;
  }  
  
  if(fairySelection) {
    background((pickFairyScreen));  
    //nextButton.display();
    //nextButton.isActive = true;
    
    f1.display();
    f1.isActive = true;
    f2.display();
    f2.isActive = true;
    f3.display();
    f3.isActive = true;
    f4.display();
    f4.isActive = true;
    
  
    
    
    //nextButton.display();
    //nextButton.isActive = true;
    
  }
  
  
  if(musicSelection) {
    background((musicOptions));  
    onButtonBG.display();
    offButtonBG.display();
    onButtonSFX.display();
    offButtonSFX.display();
    
    onButtonBG.isActive=true;
    offButtonBG.isActive=true;
    onButtonSFX.isActive=true;
    offButtonSFX.isActive=true;
    
    returnHomeButton.display();
     
    
  }
  
  if(scoreBoardSelection) {
    background((#F7EDDC)); 
    textSize(height/5);
    text("High Scores!" , width/3.6, height/5+20);
    
    
    float rowHeight = height-height/5+20;
    float rowStart = width/2.5;
    textSize(height/5-40);
    fill(0);
    for (TableRow row : highScores.rows()) {
    text(row.getString("fairyName") + ": " + row.getInt("highScore") , rowStart, rowHeight);
    rowHeight-=height/5-20;
    }
    
     
     
    returnHomeButton.display();
     
  }
  
  if(instructionSelection) {
    background((instructions));  
    returnHomeButton.display();
     
    
  }
  
  if(returnStart) {
    titleScreen = true;
  }
    
    
 
 if(gameScreen) {
   //booleans
   
  background(gameBackground);
  
  //foreground
  groundOffset += scrollSpeed;
  if (groundOffset >= 840) groundOffset = 0;
  //draw ground
  for (int i = 0; i < 11; i++){
    image(foreground, 850 * i - groundOffset, height/5.24);
  }
  //Fairy Dust
  fairyDust.addParticle();
  fairyDust.run(fair.x+fair.size/2.1, fair.y+fair.size*1.14);
  
    //Draw Fairy
    fair.applyForces(gravity);
    fair.display();
    if (keyPressed) {
      if (key == ' ') {
        fair.jump();
      }
    }
   
    
    //draw and regen bubbles
    for (int i = 0; i < bubs.size(); i++){
     bubs.get(i).move();
     bubs.get(i).display();
     if (bubs.get(i).x<0){
        bubs.remove(i);
      }
     
      if (bubs.size()<numBubs){
        bubs.add(new Bubble());
      }
    }
    
    for (int i = 0; i < screenCoins.size(); i++){
     screenCoins.get(i).move();
     screenCoins.get(i).display();
      if (screenCoins.get(i).x<0){
        screenCoins.remove(i);
      }
      if (screenCoins.size() < numCoins){
        screenCoins.add(new Coin());
      }  
      
    }
    
     
    //EDGE DETECTION 
    for (int i = 0; i < screenCoins.size(); i++) {
        if (dist(screenCoins.get(i).x, screenCoins.get(i).y, fair.centerX, fair.centerY) < ((fair.size)/2+ (screenCoins.get(i).size)/2)){
            //collectedCoins.add(screenCoins.get(i));
            collected++;
            screenCoins.remove(i);
            if (collected % 10 == 0){
                  numCoins++;
                  numBubs++;
      }
        }
    }
    for (int i = 0; i < bubs.size(); i++) {
        if (dist(bubs.get(i).x, bubs.get(i).y, fair.centerX, fair.centerY) < ((fair.size)/2+ (bubs.get(i).size)/2)){
            //edge detection works
            lives --;
            bubs.remove(i);     
        }
        if (lives == 0){
          finalScreen = true;
        }
    }
    
    //Progress Box
    fill(#E2DBEF);
    stroke(#F5EDFC);
    rect(width-190,10,160,60,10);
    fill(#664686);
    textSize(25);
    text("Lives:" , width-180, 35);
    heartX= width-115;
    for (int i = 0; i < lives; i++){
      shape(heart, heartX, 30, 25, 25);
      heartX+=30;
    }

    text("Coins Collected:    " + str(collected) , width-180, 60);
  }
  
  shapeMode(CORNER);
  if(finalScreen){
    for (int i = 0; i < bubs.size(); i++){
     bubs.remove(i);
    }
    for (int i = 0; i < screenCoins.size(); i++){
     screenCoins.remove(i);
    }
    
    background(endScreen);
    
    int finalScores = collected;
    
    text("Your Score:   " + str(finalScores) , width/2-56, height/2+13);
    
    for (int i = 0; i < highScores.getRowCount(); i++) {
      
    if (highScores.getInt(i,"fairyNum") == int(fairyNum)){
      
      
   
      if(highScores.getInt(i,"highScore") < finalScores){
        highScores.setInt(i,"highScore", finalScores);
        }
      }
    }
    saveTable(highScores, "highScores.csv");
    loadTable("highScores.csv", "header");
    
    yesButton.display();
    noButton.display();
    noButton.isActive = true;
    yesButton.isActive = true;
    //returnHomeButton.display();
    //returnHomeButton.isActive = true;
  }
  else
    returnHomeButton.isActive = true;
  
    
}
  
  

  
  
  

  
  void mousePressed(){
  
  
  if (startButton.isPressed()) { 
    if (sfxSound){
      sparkle.play();
    }
    
  
    gameScreen = false; 
    titleScreen = false;
    finalScreen = false;
    musicSelection = false;
    fairySelection = true;
    instructionSelection = false;
    scoreBoardSelection = false; 
    startButton.isActive = false;
     
  }
  

  
  if (f1.isPressed()) { 
    if (sfxSound){
      sparkle.play();
    }

    fairyNum = "1";
    fair.changeFairy(fairyNum); 
    gameScreen = true; 
    titleScreen = false;
    finalScreen = false;
    musicSelection = false;
    fairySelection = false;
    instructionSelection = false;
    scoreBoardSelection = false; 
    f1.isActive = false;
    f2.isActive = false;
    f3.isActive = false;
    f4.isActive = false;
    
  }
  if (f2.isPressed()) { 
    if (sfxSound){
      sparkle.play();
    }

    fairyNum = "2";
    fair.changeFairy(fairyNum); 
    gameScreen = true; 
    titleScreen = false;
    finalScreen = false;
    musicSelection = false;
    fairySelection = false;
    instructionSelection = false;
    scoreBoardSelection = false; 
    f1.isActive = false;
    f2.isActive = false;
    f3.isActive = false;
    f4.isActive = false;
  }
  
  if (f3.isPressed()) { 
    if (sfxSound){
      sparkle.play();
    }
    
    fairyNum = "3";
    fair.changeFairy(fairyNum); 
    gameScreen = true; 
    titleScreen = false;
    finalScreen = false;
    musicSelection = false;
    fairySelection = false;
    instructionSelection = false;
    scoreBoardSelection = false; 
    f1.isActive = false;
    f2.isActive = false;
    f3.isActive = false;
    f4.isActive = false;
  }
  
  
 if (f4.isPressed()) { 
    if (sfxSound){
      sparkle.play();
    }

    fairyNum = "4";
    fair.changeFairy(fairyNum); 
    gameScreen = true; 
    titleScreen = false;
    finalScreen = false;
    musicSelection = false;
    fairySelection = false;
    instructionSelection = false;
    scoreBoardSelection = false; 
    f1.isActive = false;
    f2.isActive = false;
    f3.isActive = false;
    f4.isActive = false;
  }
  

  if (scoreBoardButton.isPressed()) {
    if (sfxSound){
      sparkle.play();
      
     highScores.sort("highScore");
    }
    
    finalScreen = false; 
    titleScreen = false;
    gameScreen = false;
    musicSelection = false;
    fairySelection = false;
    instructionSelection = false;
    scoreBoardSelection = true; 
  }

  if (musicButton.isPressed()) {
    if (sfxSound){
      sparkle.play();
    }
 
    titleScreen = false;
    finalScreen = false;
    gameScreen = false;
    musicSelection = true;
    fairySelection = false;
    instructionSelection = false;
    scoreBoardSelection = false; 
  }
  
  if (instructionsButton.isPressed()) {
    if (sfxSound){
      sparkle.play();
    }
     
    titleScreen = false; 
    finalScreen = false;
    gameScreen = false;
    musicSelection = false;
    fairySelection = false;
    instructionSelection = true;
    scoreBoardSelection = false; 
  }
  
  if (returnHomeButton.isPressed()) {
    if (sfxSound){
      sparkle.play();
    }

    titleScreen = true; 
    finalScreen = false;
    gameScreen = false;
    musicSelection = false;
    fairySelection = false;
    instructionSelection = false;
    scoreBoardSelection = false; 
  }
  
  if (onButtonBG.isPressed()) {
    if (sfxSound){
      sparkle.play();
    }
    bgSound = true;
    bgMusic.loop();
    
    //add audio stuff here
  }
  
  if (offButtonBG.isPressed()) {
    if (sfxSound){
      sparkle.play();
    }
    bgSound = false;
    bgMusic.stop();
  }
  
   if (onButtonSFX.isPressed()) {
    sfxSound = true;
    if (sfxSound){
      sparkle.play();
    }

    
    //add audio stuff here
  }
  
  if (offButtonSFX.isPressed()) {
    sfxSound = false;
    if (sfxSound){
      sparkle.play();
    }
    
  }
  
  
  if (yesButton.isPressed()) {

    lives = 3;
    collected = 0;
    numBubs = 3;
    numCoins = 2;
    for (int i = 0; i < numBubs; i++){
     bubs.add(new Bubble());
    }
    for (int i = 0; i < numCoins; i++){
     screenCoins.add(new Coin());
    }

    titleScreen = false; 
    finalScreen = false;
    gameScreen = true;
    musicSelection = false;
    fairySelection = false;
    instructionSelection = false;
    scoreBoardSelection = false; 
    
     yesButton.isActive = false;
     noButton.isActive = false;
  }
  
  if (noButton.isPressed()) {

    lives = 3;
    collected = 0;
    titleScreen = true; 
    finalScreen = false;
    gameScreen = false;
    musicSelection = false;
    fairySelection = false;
    instructionSelection = false;
    scoreBoardSelection = false; 
    
    yesButton.isActive = false;
    noButton.isActive = false;
  }
  
  
 

  }
  
 
