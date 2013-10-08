class Node extends GameObj
{
  PVector initPos;
  final float restoration = 0.75;
  final float MASS = 4.0;
  boolean locked;
  final float SPD_LIMIT = 3;
  boolean resetting;
  //  float prevVel = SPD_LIMIT;
  //  boolean stopped;

  Node (float x, float y)
  {
    this(x, y, false);
  }

  Node(float x, float y, boolean locked)
  {
    super(new PVector(x, y));
    this.locked = locked;
    this.initPos = new PVector(x, y);
  }


  void addForce(PVector force)
  {
    if (!locked) // otherwise no-op
    {
      PVector frc = force.get();
      frc.div(MASS);
      acc.add(frc);
    }
  }

  void reset()
  {
    resetting = true;
  }

  void update()
  {
    if (!resetting)
    {
      if (!locked) // otherwise no-op
      {
        PVector restoringForce = PVector.sub(initPos, pos);
        restoringForce.setMag(restoringForce.mag() * restoration);

        acc.add(restoringForce);

        vel.add(acc);
        //      vel.limit( (!stopped) ? (prevVel * 0.50) : SPD_LIMIT );
        pos.add(vel);
        acc.set(0, 0);

        //      prevVel = vel.mag();
        //      if (round(prevVel) == 0) stopped = true;
      }
    }
    else
    {
      pos = initPos;
      vel.set(0, 0);
      acc.set(0, 0);
      resetting = false;
    }
  }
}

