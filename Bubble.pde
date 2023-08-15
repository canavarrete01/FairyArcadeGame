class Bubble {
  
  float x, y, size, speedX, depth, start,a;
  
  //PVector speed;
  
  
  Bubble() {
    size = 60.0;
    x = random(width-size*3, width+400);;
    y = random(0+size/2, height-size*1.2);
    speedX = random(-8.25,-14.0);
    depth = random(.01, .04);
    start = y;   
    a = random(20,70);
    
   
  } 

  
  void move() {
    
    x += speedX;
    y = a*sin(depth*(x))+start;
    
      
  }
  
  
  void display() {
    
    fill(#5B3C6F ,175); //#4D6237, green color
    stroke(#4D6237);
    ellipse(x, y, size, size);
    fill(#FFFFFF,215);
    arc(x, y, size*7/8, size*7/8, PI, PI+PI/2, CHORD);
    
 
    
    
  }
}
