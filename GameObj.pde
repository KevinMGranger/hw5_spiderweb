class GameObj
{
  PVector pos, vel, acc;

  GameObj(PVector pos)
  {
    this(pos, new PVector());
  }

  GameObj(PVector pos, PVector vel)
  {
    this(pos, vel, new PVector());
  }

  GameObj(PVector pos, PVector vel, PVector acc)
  {
    this.pos = pos;
    this.vel = vel;
    this.acc = acc;
  }
}

