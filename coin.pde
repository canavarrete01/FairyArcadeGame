class Coin {
  
  PShape coin;
  float x, y,size,speed;
  
  //PVector speed;
  
  
  Coin() {
    size = 30;
    speed = 8;
    x = random(width-size, width+400);;
    y = random(0+size, height-size);
    coin = loadShape("coin.svg");
    
   
  } 

  
  void move() {
    x -= speed;
    
      
  }
  
  
  void display() {
     
     shapeMode(CENTER);
     shape(coin, x, y, size, size);
    
 
    
    
  }
}
