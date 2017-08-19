float[] x = new float[100];
float[] y = new float[100];
int i;
float[] vx = new float[100];
float[] vy = new float[100];

void setup(){
  fullScreen();
  background(100);
  
  for(int i=0; i<x.length; i++){
    x[i] = random(width);
    y[i] = random(height);
    vx[i] = random(-10,10);
    vy[i] = random(-10,10);
  }
}

void draw(){
 
  fill(255,255,255,10);
  rect(0,0,width,height);
  noStroke();
  
  for(int i=0; i<x.length; i++){
    fill(255,0,0);
    rect(x[i],y[i],10,10);
    
    x[i]=x[i] + vx[i];
    y[i]=y[i] + vy[i];
    
    if( x[i]<0 || x[i]+10>width ){vx[i] = vx[i]*-1;}
    if( y[i]<0 || y[i]+10>height ){vy[i] = vy[i]*-1;}
  
  }
}