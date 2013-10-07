class Node extends GameObj
{
  final float DAMPING;
  boolean locked;
  
  Node(float x, float y, boolean locked)
  {
    this.locked = locked;
    
    super(new PVector(x, y));
  }
  
  
  void perturb(PVector vec)
  {
  }
}
