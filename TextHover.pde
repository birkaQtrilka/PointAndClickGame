public class TextHover extends Component
{
  Shape _collider;
  Text _text;
  
  public TextHover()
  {
  
  }
  public Text getTextComponent()
  {
    return _text;
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
    if(_collider == null)
        _collider = GameObject.GetComponent(Shape.class);

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
