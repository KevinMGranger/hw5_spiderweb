class Spider
{
  Node onNode;
  int nodeNum;
  final float SPDR_SIZE = 4;
  final float DIST_FRC_MOD = 0.25;
  boolean forceOnOld, forceOnNew;
  boolean jumping;

  /// prepares the spider to jump on the next update()
  void jump(boolean forceOnOld, boolean forceOnNew)
  {
    jumping = true;
    this.forceOnOld = forceOnOld;
    this.forceOnNew = forceOnNew;
  }

  /// does the actual jumping calculations
  void _jump()
  {
    Node old = onNode;
    if (DEBUG) print("Jumping from" + ((forceOnOld) ? "!" : "") + " " + nodeNum);
    nodeNum = int(random(numNodes));
    println(" to" + ((forceOnNew) ? "!" : "") + " " + nodeNum);
    Node nu = nodes[nodeNum];



    if (forceOnOld)
    {
      PVector force = PVector.sub(old.pos, nu.pos);
      force.mult(DIST_FRC_MOD);
      old.addForce(force);
    }

    if (forceOnNew)
    {
      PVector force = PVector.sub(nu.pos, old.pos);
      force.mult(DIST_FRC_MOD);
      nu.addForce(force);
    }

    onNode = nu;
    jumping = false;
    
    jumpedAt = frameCount;
  }


  void update()
  {
    if (jumping) _jump();
  }


  void display()
  {
    PVector pos = onNode.pos;

    pushStyle();
    noStroke();
    fill(255, 0, 0);

    ellipse(pos.x, pos.y, SPDR_SIZE, SPDR_SIZE);

    popStyle();
  }
}

