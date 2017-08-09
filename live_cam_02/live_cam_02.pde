import processing.video.*;

Capture cam;

void setup(){  
  size(320,240);
  cam = new Capture(this, 1280, 720);
  cam.start();
}

void draw(){
  
  if( cam.available() ){
    
    cam.read();
    image(cam, 0, 0, width, height);
    
    int brightX = 0;
    int brightY = 0;
    float brightValue = 0;
    
    cam.loadPixels();
    
    int index = 0;
    for(int y=0; y<cam.height; y++){
      for(int x=0; x<cam.width; x++){
        
        int pixelValue = cam.pixels[index];
        float pixelBrightness = brightness(pixelValue);
        
        print(brightValue + "\n");
        
        if(pixelBrightness>brightValue){
          brightValue = pixelBrightness;
          brightY = y;
          brightX = x;
        }
        
        index++;
        
      }
      
      noStroke();
      fill(230, 100, 0);
      ellipse(brightX, brightY, 70, 70);
    }
  }
  
}