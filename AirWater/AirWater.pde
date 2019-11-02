
import processing.serial.*;

Serial myPort;  // Create object from Serial class
//Bubbles[] bubbles = new Bubbles[20] ;
int myRecievedVal;      // Data received from the serial port
PImage bubbleImg;
PImage waterCImg;

int time = millis();
float x;
float y;
float speedX = random(-0.4, 0.4);
float speedY = random(-0.4, 0.4);
float opacity = 255;

boolean bubbleNew = false;
boolean finished = false;
ArrayList<Bubble> bubbles;
float grow = 0;
float t_time;










void setup() 
{

  size(800, 800);
  //size(1000, 600);
  myPort = new Serial(this, "/dev/tty.usbmodem1411", 9600); //1411

  //bubbleImg = loadImage("Air-+-Water-Bubble.png");
  bubbleImg = loadImage("Air-+-Water-Bubble.png");
  waterCImg  = loadImage("WaterColourSplat.png");


  //for(int i = 0; i < bubbles.length; i++) {
  //   bubbles[i] = new Bubbles();

  // }

  bubbles = new ArrayList<Bubble>();
  bubbles.add(new Bubble());
  t_time = millis();
}
//PVector wind = new PVector(0.1,0.1);

void draw()
{
  background(255); 

  if ( myPort.available() > 0) {  // If my data is available,
    myRecievedVal = myPort.read();         // read it and store it in myRecievedVal
  }
  //for (int i = bubbles.size()-1; i >= 0; i--) { 
  //  // An ArrayList doesn't know what it is storing so we have to cast the object coming out
  //  Bubble bubble = bubbles.get(i);
  //  bubble.display();
  //  bubble.move();
  //}
  //Let the bubble grow here
  if (myRecievedVal == 1) {
    //display the ball 
    //bubbleNew = true;
    //for (int i = 0; i<bubbles.size(); i++) { 
    for (int i = bubbles.size()-1; i >= 0; i--) { 

      // An ArrayList doesn't know what it is storing so we have to cast the object coming out
      Bubble bubble = bubbles.get(i);
      bubble.display();
      bubbleNew=true;
    }
  } 
  //move the ball and have it splat
  //ellipse(width/2+x, height/2+y, grow, grow);
  else {
    for (int i = bubbles.size()-1; i >= 0; i--) { 
      //for (int i = 0; i<bubbles.size();i++) { 
      // An ArrayList doesn't know what it is storing so we have to cast the object coming out
      Bubble bubble = bubbles.get(i);
      bubble.move();
      bubble.stay();
      bubbleNew = true;
    }
    if (bubbleNew == true) {
    
    //omgIcannot
      
    }
  }
}



//if(time >= 1000 && myRecievedVal != 1) {
//        bubbles.add(new Bubble());

//} 
//if (bubbleNew == true) {

//       bubbles.add(new Bubble());
//       finished = true;
//     }


//     if (bubble.finished()) {
//       // Items can be deleted with remove()
//       // bubbles.remove(i);
//       bubbles.remove(i);
//       leaveWaterMark();
//     }
