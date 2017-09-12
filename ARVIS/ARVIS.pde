import controlP5.*;
//import processing.io.*;
 
ControlP5 cp5;
int i=2,m=0;
int st[]={0,0,0,0,0,0,0};
String name="code";

int a[]={0,0,0,0,0,0}; //analog pins array
int d[]={0,0,0,0,0,0}; //digital pins array
Textfield abc;
Textfield[] tf=new Textfield[100];
String[] j= new String[18];
String textValue = "";

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
 
Checkbox[] boxes = new Checkbox[12];
 PImage bg;


void setup() 
{
  //size(852,480);
  
  size(2704,1704);
  noStroke();
 
  
  //background(75,216,173);
  bg = loadImage("green.jpg");
background(bg);
  
 // PFont font = createFont("arial", 20);
 
  cp5 = new ControlP5(this);
  

fill(254,142,75);
textSize(22);
text("Project Name: ",x,y);

 cp5.addTextfield("ENTER THE NAME OF FILE")
    .setPosition(x+170,y-30)
      .setSize(200, 40)
        .setFont(createFont("arial", 20))
          .setAutoClear(false)
            ;            
              
             

fill(254,142,75);
textSize(22);
text("Baud Rate  ",x,y+90);   

 cp5.addTextfield("ENTER BAUD RATE")
    .setPosition(x+170,y+60)
      .setSize(200, 40)
       .setFont(createFont("arial", 20))
          .setAutoClear(false)
            ;     
 
 
fill(254,142,75);
textSize(22);
text("DESCRIPTION:",x+500,y);   

abc= cp5.addTextfield("Enter data to be displayed in comments")
    .setPosition(x+670,y-30)
      .setSize(650,40)
       .setFont(createFont("arial",20))
          .setAutoClear(false)
          ;  
          
   
     //j[i++]="int sample=0;";
     //j[i++]="void setup()";
     // j[i++]="{";
     // j[i++]="Serial.begin(9600);";
     // j[i++]="pinMode(2,INPUT);";
     // j[i++]="pinMode(3,INPUT);";
     // j[i++]="pinMode(4,INPUT);";
     // j[i++]="pinMode(5,INPUT);";
     // j[i++]="pinMode(6,INPUT);";
     // j[i++]="pinMode(7,INPUT);";
     
     // j[i++]="}";
     
  // j[i++]="void loop()";
     // j[i++]="{";
      
   
fill(242,220,94);
textSize(22);
text("DIGITAL",x,y+190);     

fill(181,230,29);
textSize(22);
text("D0",x,y+220);   

fill(181,230,29);
textSize(22);
text("D1",x,y+265);   


fill(181,230,29);
textSize(22);
text("D2",x,y+310);   

fill(181,230,29);
textSize(22);
text("D3",x,y+355);   

fill(181,230,29);
textSize(22);
text("D4",x,y+400);   

fill(181,230,29);
textSize(22);
text("D5",x,y+445);   


fill(242,220,94);
textSize(22);
text("ANALOG",x+155,y+190);    



fill(181,230,29);
textSize(22);
text("A0",x+155,y+220);   


fill(181,230,29);
textSize(22);
text("A1",x+155,y+265);   


fill(181,230,29);
textSize(22);
text("A2",x+155,y+310);   

fill(181,230,29);
textSize(22);
text("A3",x+155,y+355);   

fill(181,230,29);
textSize(22);
text("A4",x+155,y+400);   

fill(181,230,29);
textSize(22);
text("A5",x+155,y+445);   

              
fill(242,220,94);
textSize(22);
text("AMPLIFIER GAIN",x+310,y+190); 





 cp5.addTextfield("gain-1")
    .setPosition(x+310,y+200)
      .setSize(100,20)
        .setFont(createFont("arial", 15))
          .setAutoClear(false)
            ;            
              
 

cp5.addTextfield("gain-2")
    .setPosition(x+310,y+245)
      .setSize(100, 20)
        .setFont(createFont("arial",15))
          .setAutoClear(false)
            ;      





cp5.addTextfield("gain-3")
    .setPosition(x+310,y+290)
      .setSize(100, 20)
        .setFont(createFont("arial",15))
          .setAutoClear(false)
            ;     



cp5.addTextfield("gain-4")
    .setPosition(x+310,y+335)
      .setSize(100, 20)
        .setFont(createFont("arial",15))
          .setAutoClear(false)
            ;  




cp5.addTextfield("gain-5")
    .setPosition(x+310,y+380)
      .setSize(100, 20)
        .setFont(createFont("arial",15))
          .setAutoClear(false)
            ;  





cp5.addTextfield("gain-6")
    .setPosition(x+310,y+425)
      .setSize(100, 20)
        .setFont(createFont("arial",15))
          .setAutoClear(false)
            ;  
            
 
            
//checkboxes

for(int i=0; i<boxes.length; i++)
{
  if(i<6) 
 boxes[i] = new Checkbox(x+70,y+203+i*45);
  else
   boxes[i] = new Checkbox(x+225,y+203+(i-6)*45);
    
    
    
}

  

}





void draw() 
{  
j= new String[18];  
  
  j[i++]="int sample=0;";
     j[i++]="void setup()";
      j[i++]="{";
      j[i++]="Serial.begin(9600);";
      j[i++]="pinMode(2,INPUT);";
      j[i++]="pinMode(3,INPUT);";
      j[i++]="pinMode(4,INPUT);";
      j[i++]="pinMode(5,INPUT);";
      j[i++]="pinMode(6,INPUT);";
      j[i++]="pinMode(7,INPUT);";
     
      j[i++]="}";
     
   j[i++]="void loop()";
      j[i++]="{";
  
   for(int i=0; i< boxes.length; i++)
  {
    boxes[i].render();
    if(boxes[i].b)
    {
    if(i<6)
    {
     d[i]=1; 
     
    }
    else
    {
      a[i-6]=1;
     }    
  }
  else
  {
  if(i<6)
    {
     d[i]=0; 
    }
    else
    {
      a[i-6]=0;
     }    
  
  
  }
  
  
  
  }
  

  
   
    j[i]="sample=";

 if(d[5]==1)
 {     
   j[i]+="32*digitalRead(7)";
     j[i]+="32*digitalRead(7)+";
     }
 
 if(d[4]==1)
 {  j[i]+="16*digitalRead(6)+";
     }
     
 if(d[3]==1)
 {  j[i]+="8*digitalRead(5)+";
     }  
     
 if(d[2]==1)
 {  j[i]+="4*digitalRead(4)+";
     } 

    
 if(d[1]==1)
 {  j[i]+="2*digitalRead(3)+";
     } 
     
 if(d[0]==1)
 {  j[i]+="digitalRead(2)";
     } 


j[i]+=";";
     






i=i+1;

j[i++]="Serial.write(sample);";

j[i]="}";


j[16]="//";
j[17]="//";
i=0; 

 saveStrings(name+".ino",j); 
 
 
 
 
 
}
  
     
    void controlEvent(ControlEvent theEvent)
{
  if (theEvent.isAssignableFrom(Textfield.class))
  {
    println("controlEvent: accessing a string from controller '"
      +theEvent.getName()+"': "
      +theEvent.getStringValue()
      );
          
         name=theEvent.getStringValue();
         
   
 

}

}


void mousePressed()
{
  for(int i=0; i< boxes.length; i++)
  {
    boxes[i].click();
  }
}     
     
     