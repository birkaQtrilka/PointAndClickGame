class Circle extends Shape
{
  int radius = 100;
  PVector worldPos;
  PVector worldScale;
  @Override
  public void onAdd()
  {
    worldPos = transform.WorldPos;
    worldScale = transform.WorldScale;
  }
  //collision
  public boolean IsColliding(PVector point)
  {
    return dist(point.x, point.y, worldPos.x,worldPos.y) < radius;
  }
  @Override
  public void update()
  {
    strokeWeight(10);
    noFill();
    ellipse(worldPos.x,worldPos.y,radius * 2 * worldScale.x,radius * 2 * worldScale.y);
  }
}
