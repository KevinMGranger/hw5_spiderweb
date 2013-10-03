int SCREEN_BORDER_SIZE = 400;

float r = 0, theta;
int sides = 7;
float radInc = 0.8, thetaInc;
int numNodes = 60;
int n = 0;
float px, py, x, y;


void setup()
{
    size(displayWidth - SCREEN_BORDER_SIZE, displayHeight - SCREEN_BORDER_SIZE, P2D);
    background(0);
    smooth();
    thetaInc = TWO_PI / sides;
    stroke(255);
    strokeWeight(2);
}

void draw()
{
  if (n <= numNodes)
  {
    px = x;
    py = y;
    n++;
    theta += thetaInc;
    r += radInc;
    x = r * cos(theta);
    y = r * sin(theta);
    pushMatrix();
    translate(width/2, height/2);
    scale(8);
    line(px, py, x, y);
    popMatrix();
  }
}
