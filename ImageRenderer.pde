public class ImageRenderer extends Component implements IRender
{
  private PImage Image;
  Transform _transform;
  
  public ImageRenderer(PImage pImage)
  {/*
    if (pImage == null){
       Image = Images.get("square.png");
    }
    else*/
      Image = pImage;
      
    
  }
  public ImageRenderer(String imageName)
  {
    if (imageName != null && imageName != "")
      Image = Images.get(imageName);
  }

  @Override
  public void onAdd()
  {
    _transform = GameObject.getTransform();
    //Image.resize(abs((int)_transform.WorldScale.x), abs((int)_transform.WorldScale.y));
    
  }
  @Override
  public void update()
  {
      LayerStacks.get(GameObject.Layer).push(this);//add(this)
  }
  
  @Override 
  public void render()
  {
    if(Image == null) return;
    push();
    imageMode(CENTER);
    var pos = _transform.Position;
    var scl = _transform.WorldScale;
    translate(pos.x,pos.y);
    scale(scl.x,scl.y);
    image(Image, 0, 0);
    pop();
  }
  
}
