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
  boolean _fitImage = true;
  boolean _debug;
  boolean _collideWithMouse;
  PVector worldPos;
  PVector scale;
  
  Rectangle(PVector pSize)
  {
    localSize = pSize;
    _fitImage = false;
  }
  Rectangle(PVector pSize, boolean pDebugMode)
  {
    _fitImage = false;
    _debug = pDebugMode;
    localSize = pSize;
  }
  //implicitly fit with image bounds
  Rectangle()
  {
    
  }
  Rectangle( boolean pDebugMode)
  {

     _debug = pDebugMode;
  }
  @Override
  public void onAdd()
  {
    super.onAdd();
    worldPos = transform.WorldPos;
    scale = transform.WorldScale;
    worldSize = new PVector(abs(localSize.x * scale.x), abs(localSize.y * scale.y));

    if(!_fitImage) return;// doesn't work. the image is 300 300 for some reason

    PImage image = GameObject.GetComponent(ImageRenderer.class).Image;
    
    worldSize = new PVector(image.width, image.height);
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
    strokeWeight(10);
    noFill();
    rectMode(CENTER);
    rect(worldPos.x,worldPos.y,worldSize.x,worldSize.y);
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
