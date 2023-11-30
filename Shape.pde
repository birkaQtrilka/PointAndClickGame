public abstract class Shape extends Component
{
  protected Transform transform;

  @Override
  public void onAdd()
  {
    transform = GameObject.getTransform();
  }

  public abstract boolean IsColliding(PVector point);
}





public class Rectangle extends Shape implements IRender
{
  public PVector worldSize;
  PVector localSize;
  boolean _debug;
  boolean _collideWithMouse;
  PVector worldPos;
  PVector scale;
  
  Rectangle(PVector pSize)
  {
    localSize = pSize;
  }
  Rectangle(PVector pSize, boolean pDebugMode)
  {
    _debug = pDebugMode;
    localSize = pSize;
  }

  @Override
  public void onAdd()
  {
    super.onAdd();
    worldPos = transform.WorldPos;
    scale = transform.WorldScale;
    worldSize = new PVector(abs(localSize.x * scale.x), abs(localSize.y * scale.y));
    //println(worldSize);
  }
  //collision
  @Override
  public boolean IsColliding(PVector point)
  {
    //get world pos

    return abs(worldPos.x - point.x) < worldSize.x/2 && abs(worldPos.y - point.y) < worldSize.y/2 ;
  }
  @Override
  public void update()
  {
    if(!_debug) return;
    LayerStacks.get(GameObject.Layer).push(this);
  }
  public void render()
  {
    if(IsColliding(MousePos)){
      stroke(#37CB71);
    }
    else
    stroke(#9B452D);
    strokeWeight(3);
    noFill();
    rectMode(CENTER);
    //rect(worldPos.x,worldPos.y,worldSize.x,worldSize.y);
  }
}






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
