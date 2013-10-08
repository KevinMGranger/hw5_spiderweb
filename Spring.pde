class Spring
{
  Node a, b;
  float length;
  float equil;
  final float k;
  
  Spring(Node a, Node b)
  {
    this.a = a;
    this.b = b;
    length = dist(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
    equil = length;
  }
}
