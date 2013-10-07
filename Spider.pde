class Spider
{
  Node onNode;
  final float SPDR_SIZE = 16;
  final float DIST_FRC_MOD = 1.0;

  void jump(boolean forceOnOld, boolean forceOnNew)
  {
    Node old = onNode;
    Node nu = nodes[round(random(numNodes))];

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
  }


  void display()
  {
    pushMatrix();
    PVector pos = onNode.pos;
    translate(pos.x, pos.y);

    pushStyle();
    fill(255, 0, 0);

    ellipse(0, 0, SPDR_SIZE, SPDR_SIZE);

    popStyle();
    popMatrix();
  }
}

