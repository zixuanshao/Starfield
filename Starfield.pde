Particles[] aBunch = new Particles[200];
interface Particles
{
  public void show();
  public void move();
}
void setup()
{
  size(600,600);
  for (int i=0; i< 199; i++)
  {
    aBunch[i]=new Normal();
  }
  aBunch[199]=new Oddball();
  aBunch[0]=new Jumbo();
}
void draw()
{
  background(0);
  for (int i=0; i<aBunch.length; i++)
  {
    aBunch[i].show();
    aBunch[i].move();
  }
}
class Normal implements Particles
{
  double myX, myY, direction, speed;
  int r, g, b;
  Normal()
  {
    myY=300;
    myX=300;
    r=(int)(Math.random()*256);
    g=(int)(Math.random()*256);
    b=(int)(Math.random()*256);
    speed=(Math.random()*3);
    direction=Math.random()*(Math.PI*2);
  }
  public void show()
  {
    for (int i=0; i<199; i++)
    {
      fill(r,g,b);
      ellipse((float)myX, (float)myY, 5, 5);
    }
  }
  public void move()
  {
    for (int i=0; i<199; i++)
    {
      myX = myX+Math.cos(direction)*speed;
      myY = myY+Math.sin(direction)*speed;
    }
  }
}
class Oddball implements Particles
{
  double direction, myX, myY, speed;
  Oddball()
  {
    myY=300;
    myX=300;
    direction=Math.PI*2*Math.random();
    speed=Math.random()*50;
  }
  public void show()
  {
    fill(255);
    rect((float)myX, (float)myY, 30, 30);
  }
  public void move()
  {
    myX = myX+Math.cos(direction)*speed;
    myY = myY+Math.sin(direction)*speed;
  }
}

class Jumbo extends Normal
{
  public void show()
  {
    ellipse((float)myX, (float)myY, 20, 20);
  }
}