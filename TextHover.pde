public class TextHover extends Component
{
  Shape _collider;
  Text _text;
  public TextHover()
  {
  
  }
  @Override
  void onAdd()
  {
    _collider = GameObject.GetComponent(Shape.class);
    _text = GameObject.GetComponent(Text.class);
  }
  @Override
  public void update()
  {
    if(_collider.IsColliding(MousePos))
    {
      _text.enabled = true;
    }
    else
    {
      _text.enabled = false;
    }
  }
}
