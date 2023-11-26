public class Text extends Component
{
  int alignment1;
  int alignment2;
  int rectMode;
  int textSize;
  int colr = 0;
  public String Content;
  Transform _transform;
  
  public Text(GameObject pGameObject, String pContent, int pTextSize )
  {
    super(pGameObject);
    alignment1 = LEFT;
    alignment2 = CENTER;
    rectMode = CENTER;
    textSize = pTextSize;
    Content = pContent;
  }
  public Text(String pContent, int pTextSize, int colr )
  {
    alignment1 = LEFT;
    alignment2 = CENTER;
    rectMode = CENTER;
    textSize = pTextSize;
    Content = pContent;
    
  }
  public Text(String pContent)
  {
    alignment1 = LEFT;
    alignment2 = CENTER;
    rectMode = CENTER;
    textSize = 20;
    Content = pContent;
  }
  @Override
  public void onAdd()
  {
    _transform = GameObject.getTransform();
  }
  @Override
  public void update()
  {
    var worldPos = _transform.getWorldPos();
    TopTextList.push(new TopText(Content, textSize, worldPos.x, worldPos.y, colr));
  }
}
