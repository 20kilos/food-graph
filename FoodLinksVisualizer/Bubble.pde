class Bubble {
  float x, y;
  float diameter;
  float speed;
  float r, g;
  String name;
  
  // The constructor initializes color and size
  // Location is filled randomly
  Bubble(float r_, float g_, float diameter_, String name_) {
    x = random(width);
    y = random(height);
    r = r_;
    g = g_;
    diameter = diameter_;
    name = name_;
  }
 
  // Display the Bubble
  void display() {
    stroke(0);
    ellipse(x, y, diameter, diameter);
    fill(r, g, 255, 150);
    
    text(name, x, y);
  }
 
  // Move the bubble
  void drift() {
    y += random(-1, 1);
    x += random(-1, 1);
    if (y < -diameter*2) {
      y = height + diameter*2;
    }
  }
}