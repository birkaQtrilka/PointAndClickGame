public class Text extends Component implements IRender
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
    LayerStacks.get(GameObject.Layer).push(this);
  }
  public void render()
  {
    var worldPos = _transform.WorldPos;

    push();
    fill(colr);
    textAlign(alignment1,alignment2);
    rectMode(rectMode);
    textSize(textSize);
    text(Content, worldPos.x, worldPos.y);
    pop();
  }
}
