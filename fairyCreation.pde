class fairyCreation {
  float x, y;
  float vx, vy;
  float centerX, centerY;
  float size;
  String fairyNum;
  int numFrames = 3;
  PImage[] fairy = new PImage[numFrames];
  


  fairyCreation(String fairyNum, float x, float y, float vx, float vy) {
    this.x = x; // x position
    this.y = y; // y position
    this.vx = vx; //velocity x axis
    this.vy = vy; //velocity y axis
    this.fairyNum = fairyNum;
    size = 80;
    for (int i = 0; i < fairy.length; i++) {
      String imageName = fairyNum + "-" + nf(i+1) + ".png";
      fairy[i] = loadImage(imageName);
      //s = image(fairy[i].height;
    }
  }

  void applyForces(float fy) {
    vy=16;
    vy = vy*(1-fy); //updating the force
    y -= -vy;
    if (y >= (height - size-15)) {
       y = (height - size-15);
    }
  }

  void changeFairy(String fairyNum){
    this.fairyNum = fairyNum;
    size = 80;
    for (int i = 0; i < fairy.length; i++) {
      String imageName = fairyNum+ "-" + nf(i+1) + ".png";
      fairy[i] = loadImage(imageName);
    }
    
  }
  
  
  void display() {
    shapeMode(CENTER);
    int frame = (frameCount) % numFrames;
    if (frame == 0 ){
      frame = numFrames;
     }
     

    centerX = x + size/2;
    centerY = y + size/2;
    image(fairy[frame-1], x, y, size, size);

    
    }
     
  
  void jump() {
    //this.y -= 10 ; //updating the force
    vy=41;
    y -= vy;
    
    if (y < (0)) {
       y = 0;
    }
  }
  
 
  
}
