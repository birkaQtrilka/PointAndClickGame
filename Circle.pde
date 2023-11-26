class Circle extends Shape
{
  int radius = 100;
  
  //collision
  public boolean IsColliding(PVector point)
  {
    var worldPos = transform.getWorldPos();
    return dist(point.x, point.y, worldPos.x,worldPos.y) < radius;
  }
  @Override
  public void update()
  {
    strokeWeight(10);
    noFill();
    circle(0,0,radius * 2);
  }
}
