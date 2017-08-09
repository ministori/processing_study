import processing.video.*;

Capture cam;
int cellSize = 15;
int cols, rows;

void setup(){  
  size(1280,720);
  cols = width/cellSize;
  rows = height/cellSize;
  cam = new Capture(this, 1280, 720);
  cam.start();
  
  background(0);
}

void draw(){
  
  if( cam.available() ){
    cam.read();
    cam.loadPixels();
    
    for(int i=0; i<cols; i++){
      for(int j=0; j<rows; j++){
        
        int x = i * cellSize;
        int y = j * cellSize;
        int loc = (cam.width-x-1) + y*cam.width;
        
        float r = red(cam.pixels[loc]);
        float g = green(cam.pixels[loc]);
        float b = blue(cam.pixels[loc]);
        
        color c = color(r, g, b);
        
        pushMatrix();
        
        translate(x+cellSize/2, y+cellSize/2);
        
        rectMode(CENTER);
        fill(c);
        noStroke();
        //rect(0,0,cellSize, cellSize);
        ellipse(0,0,cellSize-5, cellSize-5);
        popMatrix();
        
      }
    }
  }
  
}