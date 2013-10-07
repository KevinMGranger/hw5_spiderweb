class Node extends GameObj
{
  final float MASS = 1.0;
  boolean locked;
  
  Node(float x, float y, boolean locked)
  {
    this.locked = locked;
    
    super(new PVector(x, y));
  }
  
  
  void addForce(PVector frc)
  {
    if (!locked) // otherwise no-op
    {
      acc.add(frc.div(MASS)
      
  }
  
  void update()
  {
    vel.add(acc);
    pos.add(vel);
    acc.
  }
}
