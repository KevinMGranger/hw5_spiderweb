class Node extends GameObj
{
  final float MASS = 1.0;
  boolean locked;

  Node(float x, float y, boolean locked)
  {
    this.locked = locked;

    super(new PVector(x, y));
  }


  void addForce(PVector force)
  {
    if (!locked) // otherwise no-op
    {
      PVector frc = force.get();
      acc.add(frc.div(MASS));
    }
  }

  void update()
  {
    if (!locked)
    {
      vel.add(acc);
      pos.add(vel);
      acc.set(0, 0);
    }
  }
}

