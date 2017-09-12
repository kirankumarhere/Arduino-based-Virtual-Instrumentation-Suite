import processing.serial.*;


Serial myPort;  // Create object from Serial class
 int inByte,analog;
 int[] values,v2;
 int zoom=1;
 int i=0,j;
 int a[]={0,0,0,0,0,0}; //analog pins array
int d[]={0,0,0,0,0,0}; //digital pins array
int x=20,y=50;

class Checkbox 
{
  int x, y;
  boolean b;
  Checkbox(int _x, int _y)
  {
    x = _x;
    y = _y;
    b = false;
  }
  void render(){
    stroke(255);
    fill(isOver()?128:64);
    rect(x, y, 20, 20);
    if(b){
      line(x, y, x+20, y+20);
      line(x, y+20, x+20, y);
    }
  }
  void click(){
    if(isOver()){
      b=!b;
    }
  }
  boolean isOver(){
    return(mouseX>x&&mouseX<x+20&&mouseY>y&&mouseY<y+20);
  }
}
 
Checkbox[] boxes = new Checkbox[8];





void setup() 
{
   background(0);
 // size(1280, 480);
  size(1800,680);
  // Open the port that the board is connected to and use the same speed (9600 bps)
  print(Serial.list()[0]);
  myPort = new Serial(this, Serial.list()[0], 9600);
  
  
  values = new int[480];
  
  v2 = new int[480];
  
  
for(j=0; j< boxes.length;j++)
{
  if(j==7)
  boxes[j] = new Checkbox(1275,450);
  else
boxes[j] = new Checkbox(75 + 200 * j, 100);


  }





}

int getY(int val) 
{
  return (int)(height - val / 1023.0f * (height - 1));
}

void pushValue(int value)
{
  
  
  
  values[i]=value;
i=(i+1)%values.length;

}

void pushValue1(int value)
{
  
  
  
  v2[i]=value;
i=(i+1)%v2.length;

}


void keyReleased() 
{
  if(zoom<=4)
   zoom=zoom*2;
  else
  zoom=1;
   
}


void drawLines() 
{
  stroke(255);
  
  int displayWidth = values.length/zoom;
  //int displayWidth = (int) (width);
  
  int k = values.length - displayWidth;
  
  int x0 = 0;
  int y0 = getY(values[k]);
  for (int i=1; i<displayWidth; i++) 
  {
    k++;
    int x1 = (int) (i * ((width-1) / (displayWidth-1)));
    int y1 = getY(values[k])-250;
    line(x0, y0, x1, y1);
    x0 = x1;
    y0 = y1;
  } 
}


void drawLines1() 
{
  stroke(255);
  
  int displayWidth = v2.length/zoom;
  //int displayWidth = (int) (width);
  
  int k = v2.length - displayWidth;
  
  int x0 = 0;
  int y0 = getY(v2[k]);
  for (int i=1; i<displayWidth; i++) 
  {
    k++;
    int x1 = (int) (i * ((width-1) / (displayWidth-1)));
    int y1 = getY(v2[k]);
    line(x0, y0, x1, y1);
    x0 = x1;
    y0 = y1;
  } 
}


void drawGrid() 
{
  stroke(255,255, 0);
  line(0,(height/2-80), width,(height/2-80));
}

void drawGrid1() 
{
  stroke(255,255, 0);
  line(0,(height/2-80), width,(height/2-80));
}

void draw()
{
  background(0);
  drawGrid();
  
fill(242,220,94);
textSize(28);
text("OSCILLOSCOPE",580,50);   
  
fill(242,220,94);
textSize(22);
text("LOGIC HIGH",x,y+190);     
  
fill(255,255,255);
textSize(22);
text("LOGIC LOW",x,y+420);   
  

fill(181,230,29);
textSize(20);
text("Digital\npin-"+2,53,150);


fill(181,230,29);
textSize(20);
text("Digital\npin-"+3,253,150);


fill(181,230,29);
textSize(20);
text("Digital\npin-"+4,453,150);

fill(181,230,29);
textSize(20);
text("Digital\npin-"+5,653,150);

fill(181,230,29);
textSize(20);
text("Digital\npin-"+6,853,150);

fill(181,230,29);
textSize(20);
text("Digital\npin-"+7,1053,150);

fill(181,230,29);
textSize(20);
text("CLEAR",1253,150);
//text("Analog\n  pin",1253,150);


  
  while (myPort.available()>0) 
  {
    while(boolean(myPort.read()));
    analog = myPort.read();
    inByte = myPort.read();
    print("byte value: ");
    println(inByte);
    
     
     if(a[0]==1)
      {pushValue(0);
      pushValue1(0);
     }
     else if(d[0]==1)
     {pushValue(int(inByte&(00000001))*255);
       print("d[0]: ");
       println(int(inByte&(00000001))*255);
        
     }
     else if(d[1]==1)
     {pushValue(int(inByte&(0x2))*127);
      print("d[1]: ");
       println(int(inByte&(0x2))*127);
      }
     else if(d[2]==1)
     {
     pushValue(int(inByte&(0x4))*63);
      print("d[2]: ");
       println(int(inByte&(0x4))*63);
       
   }
     else if(d[3]==1)
    { pushValue(int(inByte&(0x8))*31);
 print("d[3]: ");
       println(int(inByte&(0x8))*31);
     
    }
    
     else if(d[4]==1)
    { pushValue(int(inByte&(0x10))*15);
   print("d[4]: ");
       println(int(inByte&(0x10))*15);
      }
      
      else if(d[5]==1)
     {pushValue(int(inByte&(0x20))*7);
     print("d[5]: ");
       println(int(inByte&(0x20))*7);
       
   }
  
   else 
   {
     }
     
     if((a[1]==1)&&(a[0]==0))
      pushValue1(analog);
      else
      {
      }
     
     
  }
if(myPort.available() < 0)
print("missing");

//if(d[1]==1||d[0]==1)
drawLines();
drawLines1();

 for(j=0; j< boxes.length; j++)
  {
    boxes[j].render();
    if(boxes[j].b)
    {
    if(j<6)
    {
     d[j]=1; 
     
    }
    else
    {
      a[j-6]=1;
     }    
  }
  else
  {
  if(j<6)
    {
     d[j]=0; 
    }
    else
    {
      a[j-6]=0;
     }    
  
  
  }
  
  
  
  }
  



 
}



void mousePressed()
{
  for(int i=0; i< boxes.length; i++)
  {
    boxes[i].click();
  }
}     
     
    