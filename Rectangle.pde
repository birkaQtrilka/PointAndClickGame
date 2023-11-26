public class Rectangle extends Shape implements IRender
{
  public PVector Size;
  boolean _fitImage = true;
  boolean _debug;
  boolean _collideWithMouse;
  
  PVector worldPos;
  PVector scale;
  
  Rectangle(PVector pSize)
  {
    Size = pSize;
    _fitImage = false;
  }
  Rectangle(PVector pSize, boolean pDebugMode)
  {
    _fitImage = false;
    _debug = pDebugMode;
    Size = pSize;
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
    if(!_fitImage) return;// doesn't work. the image is 300 300 for some reason

    PImage image = GameObject.GetComponent(ImageRenderer.class).Image;
    
    Size = new PVector(image.width, image.height);
  }
  //collision
  @Override
  public boolean IsColliding(PVector point)
  {
    //get world pos

    return abs(worldPos.x - point.x) < Size.x/2 * abs(scale.x) && abs(worldPos.y - point.y) < Size.y/2 * abs(scale.y);
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
    stroke(0);
    strokeWeight(10);
    noFill();
    rectMode(CENTER);
    rect(worldPos.x,worldPos.y,Size.x * scale.x,Size.y * scale.y);
  }
}
