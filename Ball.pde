class Ball
{
  int x;
  int y;
  int diam;
  int offsetX;
  int offsetY;
  int r;
  int g;
  int b;

  Ball(int xloc, int yloc, int d, int red, int green, int blue)
  {
    x=xloc;
    y=yloc;
    diam=d;
    offsetX=1;
    offsetY=1;
    r=red;
    g=green;
    b=blue;
  }
  
  void draw()
  {
    strokeWeight(3);
    fill(r,g,b);
    stroke(255,255,255);
    ellipse(x,y,diam,diam);
  }
  
  boolean move(int batY, int batW) // returns true if ball "ok", false if it's "lost"
  {
    x=x+offsetX;
    y=y+offsetY;
    
    // detect loss
    if (y > batY) // ball has gone beyond bat)
      return (false);
      
    // detect edges
    // right-left
    if (x > WIDTH-diam || x < diam/2)
      offsetX=-offsetX;
    else // top
    if (y < diam/2)
      offsetY=-offsetY;
   
    // check to see if in contact with bat
   
    if ((x>=mouseX) && (x<=mouseX+batW) && (y>batY-diam))
    {
      offsetY=-offsetY;
    }
  
   // check all bricks
   for (int i=0; i<Bricks.size(); i++)
   {
     Brick b=Bricks.get(i);
     if ((x>=b.x) && (x<=b.x+BRICKW) && (y==b.y+BRICKH))
     {
       Bricks.remove(i);
       offsetY=-offsetY;
     }
   }
  
    return (true);
  }
}