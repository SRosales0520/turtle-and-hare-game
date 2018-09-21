int turtleY = 0;
int turtleRightAndLeft = 1500;
int hareY = 0;
int hareRightAndLeft = 500;
PImage tortoiseimg;
PImage hareimg;
PImage checkerbanner;
String message = "GO!";
boolean messageDisplayed = false;
int startTimeMs;
//time until game starts in milliseconds
final int startDelayMs = 5000;
boolean atStartup = true;

void setup()
{
  size(2000, 1500);
  tortoiseimg = loadImage("tortoise.png");
  hareimg = loadImage("hare.png");
  checkerbanner = loadImage("Checkerboard-banner.jpg");
  imageMode(CENTER);
  textAlign(CENTER);
  //current time in milliseconds
  startTimeMs = millis();
}

void draw()
{
  
  //if in startup time window, show countdown
  if (atStartup)
  {
    //current time in ms
    int curTimeMs = millis();
    //remaining time in startup period
    int startupTimeRemainingMs = startDelayMs - (curTimeMs - startTimeMs);
    startScreen(startupTimeRemainingMs);
    atStartup = startupTimeRemainingMs > 0;
    return;
  }
  background(0);
  text(message, width/2, height/2); 
  image(checkerbanner, 1000, 1450, 2000, 100);
  image(tortoiseimg, turtleRightAndLeft, turtleY);
  image(hareimg, hareRightAndLeft, hareY, 300, 300); 
  
        if (messageDisplayed == false && hareY>1625)
  {
    textSize(100);
   message =  "Hare has won!\nTurtle is a slowpoke!";
   messageDisplayed = true;
  }
      if (messageDisplayed == false && turtleY>1615)
  {
   textSize(200);
   message = " Turtle has won!\nHare is a slow poke!";
   messageDisplayed = true;
  }


}

void keyPressed()
{
  if (key == 's')
  {
   hareY += 15;
  }
  
  if (key == 'k')
  {
   turtleY += 15; 
  }
    if (key == 'j')
  {
   turtleRightAndLeft = turtleRightAndLeft  -15; 
  }
      if (key == 'l')
  {
   turtleRightAndLeft = turtleRightAndLeft  +15; 
  }
      if (key == 'a')
  {
   hareRightAndLeft = hareRightAndLeft  -15; 
  }
      if (key == 'd')
  {
   hareRightAndLeft = hareRightAndLeft  +15; 
  }
}

void startScreen(int remainingTimeMs)
{
  background(50);
  textSize(100);
  fill(#46D8FF);
  textAlign(CENTER, CENTER);
  //show the remaining time in seconds
  //show n when there are n or fewer seconds remaining
  text("to play the game, \n tap s to move the hare down\n or tap k to move the turtle down", width/2, 450);
  fill(255, 0, 0);
  text(ceil(remainingTimeMs/1000.0), width/2, height/2);
  
}
