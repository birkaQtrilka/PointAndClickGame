public class TextHover extends Component
{
  Shape _collider;
  Text _text;
  /*boolean _onClick;
  String _clickContent;
  String _hoverContent;
  
  public TextHover(String pClickContent)
  {
    _onClick = true;
    _clickContent = pClickContent;
  }
  public TextHover()
  {
  }*/
  @Override
  void onAdd()
  {
    _collider = GameObject.GetComponent(Shape.class);
    _text = GameObject.GetComponent(Text.class);
    //_hoverContent = _text.Content;
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
