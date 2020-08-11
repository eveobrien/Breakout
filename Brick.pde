class Brick
{
  int x;
  int y;
  int r;
  int g;
  int b;
  
  Brick(int xpos, int ypos)
  {
    x=xpos;
    y=ypos;
    r=(int)random(256);
    g=(int)random(256);
    b=(int)random(256);
  }
  
  void draw()
  {
    strokeWeight(3);
    fill(r,g,b);
    stroke(255,255,255);
    rect(x,y,BRICKW, BRICKH);
  }
}