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

  void checkEdges()
  {
    // loop around
    if (pos.x < 0)
    {
      pos.x = width;
    }
    else if (pos.x > width)
    {
      pos.x = 0;
    }

    if (pos.y < 0)
    {
      pos.y = height;
    }
    else if (pos.y > height)
    {
      pos.y = 0;
    }
  }
}

