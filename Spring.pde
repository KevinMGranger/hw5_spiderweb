class Spring
{
  Node a, b;
  float length;
  float equil;
  final float k = 0.9;
  final float dampen = 2.0;

  Spring(Node a, Node b)
  {
    this.a = a;
    this.b = b;
    springDistance();
    equil = length;
  }


  void springDistance()
  {
    length = dist(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
  }

  void update()
  {
    springDistance();
    float distFromEquil = (length - equil);
    float forceMag = -k * distFromEquil;
    /* remember! this is applied assuming the initial force arrow faces *away* from the spring.
     * positive x = expanded spring, force should be inward. neg force, ergo force inward.
     * neg x = compressed spring, force should be outward. pos force, ergo force outward.
     */

    PVector aFrc = PVector.sub(a.pos, b.pos);
    aFrc.setMag(forceMag);

    //apply damping'
//    aFrc.div(dampen);
    //    float limitingFactor = constrain((frameCount - jumpedAt) / frameRate, 0, 10);
    //    aFrc.div(limitingFactor);


    // force of a on b will alwyas be negative force of b on a
    PVector bFrc = aFrc.get();
    bFrc.mult(-1);

    a.addForce(aFrc);
    b.addForce(bFrc);
  }

  void display()
  {
    line(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
  }
}

