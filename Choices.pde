class TeddyChoice extends Component
{
  PImage _otherImage;
  public TeddyChoice(String pOtherImageName)
  {
    _otherImage = Images.get(pOtherImageName);
    
  }
  @Override
  void onAdd()
  {
    if(SceneManager.GrabbedTeddy)
    {
      GameObject.GetComponent(ImageRenderer.class).Image = _otherImage;        
    }
  }

}
class EvilChoice extends Component
{
  PImage _otherImage;
  public EvilChoice(String pOtherImageName)
  {
    _otherImage = Images.get(pOtherImageName);
    
  }
  @Override
  void onAdd()
  {
    if(EvilScore > 2)
    {
      GameObject.GetComponent(ImageRenderer.class).Image = _otherImage;        
    }
  }

}
