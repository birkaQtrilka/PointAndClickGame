public class ImageRenderer extends Component
{
  private PImage Image;
  Transform _transform;
  
  public ImageRenderer(PImage pImage)
  { //<>//
    if (pImage == null){
       Image = Images.get("square.png");
    }
    else
      Image = pImage;
    
  }
  void OnAdd(){
    _transform = GameObject.getTransform();
  }
  @Override
  public void update()
  {
    //pushMatrix();
    imageMode(CENTER);

    PVector position = GameObject.getTransform().Position;
    //scale(_transform.Scale.x, _transform.Scale.y);
    image(Image, position.x, position.y);
    //popMatrix();
  }
}
