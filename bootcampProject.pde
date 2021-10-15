float x, y;
int q=0, ballCount = 10;
//background
PImage img;
PVector leftEye;
PVector rightEye;
//variables for the details of the snacks
float[] z = new float[ballCount];
float[] t = new float[ballCount];
float[] zSpeed = new float[ballCount];
float[] tSpeed = new float[ballCount];
float[] size = new float[ballCount];
float[] r = new float[ballCount];
float[] g = new float[ballCount];
float[] b = new float[ballCount];


void setup()
{
    size(600, 570);   
    strokeWeight(5);
    stroke(255,128);
    leftEye=  new PVector(width/2-35, height/2-30);
    rightEye= new PVector(width/2+150, height/2-30);
    
    //details of the snacks
    for(int i = 0; i < ballCount; i++){
    z[i] = random(400);
    t[i] = random(400);
    zSpeed[i] = random(-4, 0);
    tSpeed[i] = random(-4, 0);
    size[i] = random(30, 40);
    r[i] = random(255);
    g[i] = random(0);
    b[i] = random(0);
  }    
}
 
void draw() 
{   //background
    img = loadImage("imagine.jpg");   
    image(img, 0, 0);      
    
    // eye movement    
    if (mousePressed) 
      line(pmouseX, pmouseY, mouseX,mouseY);
      
      PVector mouseVector = new PVector(mouseX, mouseY);

      PVector leftPupil = leftEye.copy().add(mouseVector.copy().sub(leftEye).setMag(10));
      PVector rightPupil = rightEye.copy().add(mouseVector.copy().sub(rightEye).setMag(10));
    
    x=random(49);
    y=random(49);
  
    //draw the left eye 
     
    fill(255);
    stroke(21,21,21);
    ellipse( width/2-35, height/2-30, 90, 100);
    
    fill(#7C4922);
    stroke(240,240,240,50);
    ellipse( leftPupil.x , leftPupil.y, 60, 65);
    
    fill(0);
    stroke(62, 45, 45, 50);
    ellipse( leftPupil.x , leftPupil.y, 30, 35);
    
    fill(240,240,240,100);
    noStroke();
    ellipse( leftPupil.x+10 , leftPupil.y+5, 20, 20);
    
   //draw the right eye
    
    fill(255);
    stroke(21,21,21);
    ellipse( width/2+150, height/2-38, 90, 100);
    
    fill(#7C4922);
    stroke(240,240,240,50);
    ellipse( rightPupil.x , rightPupil.y, 60, 65);
    
    fill(0);
    stroke(62, 45, 45, 50);
    ellipse( rightPupil.x , rightPupil.y, 30, 35);
    
    fill(240,240,240,100);
    noStroke();
    ellipse( rightPupil.x+10 , rightPupil.y+10, 20, 20);
    
   // draw the bouncing snacks and check if the time is over or not
    
   if(frameCount/60<20 )   
    {  for(int i = 0; i < ballCount; i++)
        {
          z[i] += zSpeed[i];
          if(z[i] < 0 || z[i] > width)
          zSpeed[i] *= -1;
    
    
          t[i] += tSpeed[i];
          if(t[i] < 0 || t[i] > height)
          tSpeed[i] *= -1;
    
    
          fill(r[i], g[i], b[i]);
          ellipse(z[i], t[i], size[i], size[i]);
         }
    }   
    else
    {
      // if the time is over, show message
      fill(255);
      rect(160,200,300,150);
      fill(0);
      textSize(20);
      text("GAME OVER", 250, 300 );
      text( "You collected "+str(q)+" snacks", 220, 250);
     }
}

//check if the mouse click is on the snack
  
void mouseClicked()
{
  for(int i = 0; i < ballCount; i++)
   { if(dist(mouseX, mouseY, z[i], t[i]) < size[i]  && frameCount/60<20)
       {  q++;   
          fill(255);
          ellipse(z[i], t[i], size[i], size[i]);
        }
   }
}
