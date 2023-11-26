public class ImageRenderer extends Component
{
  private PImage Image;
  Transform _transform;
  
  public ImageRenderer(PImage pImage)
  {
    if (pImage == null){
       Image = Images.get("square.png");
    }
    else
      Image = pImage;
    
  }
  public ImageRenderer(String imageName)
  {
    if (imageName == null || imageName == ""){
       Image = Images.get("square.png");
    }
    else
      Image = Images.get(imageName);
  }
  void onAdd(){
    _transform = GameObject.getTransform();
  }
  @Override
  public void update()
  {
    //pushMatrix();
    imageMode(CENTER);

    PVector position = GameObject.getTransform().Position;
    PVector scale = GameObject.getTransform().Scale;
    //scale(_transform.Scale.x, _transform.Scale.y);

    image(Image, 0, 0);
    //popMatrix();
  }
}
