// board
final int WIDTH=500;
final int HEIGHT=500;

// bricks
final int ROWS=5;
final int BRICKW=WIDTH/10;
final int BRICKH=20;

// ball
final int BALLINITX=50;
final int BALLINITY=200;

int lives;
boolean playing;

Ball myBall;
Bat myBat;
ArrayList<Brick> Bricks;

void settings()
{
  size(WIDTH, HEIGHT);
}

void setup()
{
  // create text font
  PFont f;
  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
  textFont(f,18);
  
  ellipseMode(CORNER);
  frameRate(200);
  
  Bricks=new ArrayList<Brick>();
  for (int row=0; row<ROWS; row++)
  {
    for (int col=0; col<(WIDTH/BRICKW)-2; col++)
    {
      Bricks.add(new Brick((col+1)*BRICKW,(row+1)*BRICKH));
    }
  }
  println("Added "+Bricks.size()+" bricks");
  
  myBall=new Ball(BALLINITX,BALLINITY,20,127,127,127);
  myBat=new Bat(450, 100, 20, 255, 255, 127);
  lives=3;
  playing=true;
 
}

void drawBricks()
{
  for (int i=0; i<Bricks.size(); i++)
  {
    Bricks.get(i).draw();
  }
}

void draw()
{
  if (playing)
  {
    // clear the background
    background(0,0,0);
  
    drawBricks();
    
    // draw lives
    fill(255,255,255);
    text("Lives: "+lives, WIDTH-80, HEIGHT-10);
    
    // move the ball
    if (myBall.move(myBat.y, myBat.w) == false) // ball "died"
    {
      lives--;
      if (lives==0) // lost all lives, so no longer playing
      {
        fill(255,0,0);
        text("GAME OVER", WIDTH/2-55, HEIGHT/2);
        playing=false;
      }
      else
      { // move ball back to start
        myBall.x=BALLINITX;
        myBall.y=BALLINITY;
        myBall.offsetX=1;
        myBall.offsetY=1;
      }
    }
    
    // draw the ball
    myBall.draw();
    
    // draw the bat
    myBat.draw();
  }
}