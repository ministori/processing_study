int index = 0;
int clickPosX;
int clickPosY;
int dragWidth;
int dragHeight;
int[] boxWidth = new int[100];
int[] boxHeight = new int[100];
float[] x = new float[100];
float[] y = new float[100];
float[] vx = new float[100];
float[] vy = new float[100];
int[] red = new int[100];
int[] green = new int[100];
int[] blue = new int[100];
boolean draw = false;


void setup(){
  fullScreen();
  noStroke();
  
  for(int i=0; i<x.length; i++){
    vx[i] = random(-10,10);
    vy[i] = random(-10,10);
    red[i] = int( random(0,255) );
    green[i] = int( random(0,255) );
    blue[i] = int( random(0,255) );
  }
}

void draw(){
  if( draw ){
    fill(255,255,255,10);
    rect(0,0, width, height);
    
    for(int i=0; i<x.length; i++){
      
      fill(red[i],green[i],blue[i]);
      ellipse(x[i], y[i], boxWidth[i], boxHeight[i]);
      
      x[i] = x[i] + vx[i];
      y[i] = y[i] + vy[i];
      
      if( x[i] < 0 || x[i] + boxWidth[i] > width ){ vx[i] = vx[i] * -1; }
      if( y[i] < 0 || y[i] + boxHeight[i] > height ){ vy[i] = vy[i] * -1; }
      
    }
   
  }
}

void mousePressed(){
  //draw = false;
  clickPosX = mouseX;
  clickPosY = mouseY;
}

void mouseDragged(){
  dragWidth = mouseX - clickPosX;
  dragHeight = mouseY - clickPosY;
  fill(0);
  ellipse(clickPosX, clickPosY, dragWidth, dragHeight);
}

void mouseReleased(){
  x[index] = clickPosX;
  y[index] = clickPosY;
  boxWidth[index] = dragWidth;
  boxHeight[index] = dragHeight;
  draw = true;
  index++;
}