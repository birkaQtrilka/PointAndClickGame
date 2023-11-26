public class Rectangle extends Shape
{
  public PVector Size;
  boolean _fitImage = true;
  boolean _debug;
  boolean _collideWithMouse;
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
    if(!_fitImage) return;// doesn't work. the image is 300 300 for some reason
    
    PImage image = GameObject.GetComponent(ImageRenderer.class).Image;
    
    println(image.width + " " + image.height);
    Size = new PVector(image.width, image.height);
  }
  //collision
  @Override
  public boolean IsColliding(PVector point)
  {
    //get world pos
    var worldPos = transform.getWorldPos();
    var scale = transform.Scale;
    return abs(worldPos.x - point.x) < Size.x/2 * abs(scale.x) && abs(worldPos.y - point.y) < Size.y/2 * abs(scale.y);
  }
  @Override
  public void update()
  {
    if(!_debug) return;
    if(IsColliding(MousePos)){
      stroke(#37CB71);
    }
    else
    stroke(0);
    strokeWeight(10);
    noFill();
    rectMode(CENTER);
    rect(0,0,Size.x,Size.y);
  }
}
