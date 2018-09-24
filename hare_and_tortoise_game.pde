//variables for moving the turtle left right , and down
int turtleY = 0;
int turtleRightAndLeft = 1500;
int hareY = 0;
int hareRightAndLeft = 500;

// variables for loaded images
PImage tortoiseimg;
PImage hareimg;
PImage checkerbanner;

// string for the go message
String message = "GO!";

//variable that tracks if the final message has been displayed
boolean messageDisplayed = false;

//variable to start timer
int startTimeMs;

//time until game starts in milliseconds
final int startDelayMs = 5000;
boolean atStartup = true;
//variable to start stage 2
boolean stage2 = false;

void setup()
{
  size(2000, 1500);
  
  //loads the images for the game
  tortoiseimg = loadImage("tortoise.png");
  hareimg = loadImage("hare.png");
  checkerbanner = loadImage("Checkerboard-banner.jpg");
  
  //sets the image and text mode to center
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
  
  //place the image at a position on the screen
  image(checkerbanner, 1000, 1450, 2000, 100);
  image(tortoiseimg, turtleRightAndLeft, turtleY);
  image(hareimg, hareRightAndLeft, hareY, 300, 300); 
  
        if (messageDisplayed == false && hareY>1625)
  {
    //displays the win message if the hare wins
    textSize(100);
   message =  "Hare has won!\nTurtle is a slowpoke!\n\nclick to play lvl 2";
   messageDisplayed = true;
   //makes the stage 2 variable = true
   stage2 = true;
  }
      if (messageDisplayed == false && turtleY>1615)
  {
    //displays the win message if the turtle wins
   textSize(200);
   message = " Turtle has won!\nHare is a slow poke!\n\nclick to play lvl 2";
   messageDisplayed = true;
   //makes the stage 2 variable = true
   stage2 = true;
  }


}

void keyPressed()
{
  // sets the keys that are used to move around
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
  //show the countdown
  text("to play the game, \n tap s to move the hare down\n or tap k to move the turtle down", width/2, 450);
  fill(255, 0, 0);
  text(ceil(remainingTimeMs/1000.0), width/2, height/2);
  
}

void mouseClicked()
{
  //Launches stage 2 if the screen is clicked and stage2 boolean==true
  if (stage2==true)
  {
    launch("D:Processing/hare_and_tortoise_lvl_2/application.windows64/hare_and_tortoise_game.exe");
  }
}
