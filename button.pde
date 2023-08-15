class Button {
  boolean isPressed;
  PShape b;
  Float x, y;
  Float w, h;
  Boolean isActive = false;
  
  Button(PShape b, float x, float y, float w, float h) {
    this.b = b;
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
    isPressed = false;
  }
  
  void display() {
    //shapeMode(CENTER);
    shape(b, x, y, w ,h);
    //rect(x, y, w, h);
  }

  boolean isPressed() {
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && isActive) {
      return true;
    } else {
      return false;
    }
  }
  
}
