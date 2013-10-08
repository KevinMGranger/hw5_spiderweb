int SCREEN_BORDER_SIZE = 400;
boolean DEBUG = true;
int jumpedAt;

float r = 0, theta, radInc = 0.8, thetaInc;
int sides = 7;
int numNodes = 60;
Node nodes[] = new Node[numNodes];
ArrayList<Spring> springs = new ArrayList<Spring>();
Spider spdr;

void setup()
{
  size(displayWidth - SCREEN_BORDER_SIZE, displayHeight - SCREEN_BORDER_SIZE, P2D);

  thetaInc = TWO_PI / sides;

  setupVisual();

  setupNodes();

  setupSprings();

  // start spider on a random node
  spdr = new Spider();
  spdr._jump();
}

void setupVisual()
{
  stroke(255);
  strokeWeight(2);
  background(0);
  smooth();
}

void setupNodes()
{
  for (int i = 0; i < numNodes; i++, theta += thetaInc, r += radInc)
  {
    float x = r * cos(theta);
    float y = r * sin(theta);
    nodes[i] = new Node(x, y);
  }
}

void setupSprings()
{
  // dealing in multiples of sides.
  // on a figure of n sides, node 0 lines up with node n, node 1 with n+1, etc.

  // standard spiral
  for (int i = 1; i < numNodes; i++)
  {
    springs.add(new Spring(nodes[i], nodes[i-1]));
  }

  // lines coming out
  for (int i = sides; i < numNodes; i++)
  {
    springs.add(new Spring(nodes[i], nodes[i-sides]));
  }

  // setup locked springs
  for (int i=numNodes-1; i > numNodes-1-sides; i--)
  {
    nodes[i].locked = true;
  }
  for (int i = 0; i < sides; i++)
  {
    nodes[i].locked = true;
  }
}

void resetWeb()
{
  for (Node node : nodes)
  {
    node.reset();
  }
}

/* 1. calculate spring forces based on node position
 * 2. apply all forces to nodes
 * 3. once all forces are added, *then* update node position
 * This is a force-transactional model, where no updates are made
 * until all force calculations are done. This reduces errors in
 * spring calculation, and makes spider jumping easier to handle.
 */
void update()
{
  spdr.update();

  for (Spring spring : springs)
  { 
    spring.update();
  }
  println(nodes[10].acc.mag());
  for (Node node : nodes)
  { 
    node.update();
  }
}



// INPUT SOMEWHERE HERE

void keyReleased()
{

  if (key == 'x') spdr.jump(false, false);
  else if (key == 'o') spdr.jump(true, false);
  else if (key == 'n') spdr.jump(false, true);
  else if (key == 'b' || key == ' ') spdr.jump(true, true);
  else if (key == 'r') resetWeb();

  //  spdr.jump(false, false);
}


// drawing is spring-based
void draw()
{
  update();
  background(0);

  pushMatrix();
  translate(width/2, height/2);
  scale(7);

  for (Spring spring : springs)
  {
    spring.display();
  }
  spdr.display();

  popMatrix();
}

