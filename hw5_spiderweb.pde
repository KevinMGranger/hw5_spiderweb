int SCREEN_BORDER_SIZE = 400;

float r = 0, theta, radInc = 0.8, thetaInc;
int sides = 7;
int numNodes = 60;
Node nodes[] = new Node[numNodes];
ArrayList<Spring> springs = new ArrayList<Spring>();
Spider spdr;

void setup()
{
  size(displayWidth - SCREEN_BORDER_SIZE, displayHeight - SCREEN_BORDER_SIZE, P2D);
  translate(width/2, height/2);
  scale(8);
  thetaInc = TWO_PI / sides;
  
  setupVisual();
  
  setupNodes();
  
  setupSprings();

spdr = new Spider();
spdr.jump(false, false);

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
  for (Spring spring : springs){ spring.update(); }
  for (Node node : nodes){ node.update(); }
}



// INPUT SOMEWHERE HERE
// nodes[round(random(numNodes))]
  
// drawing is spring-based
void draw()
{
  for (Spring spring : springs)
  {
    spring.display();
  }
}

