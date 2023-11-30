public class Text extends Component implements IRender
{
  int alignment1;
  int alignment2;
  int rectMode;
  int textSize;
  int _colr = 0;
  PVector _offset = ZERO;
  int _layer;
  boolean _personalLayer;
  public String Content;
  Transform _transform;
  boolean _withOutline = true;
  
  public Text(GameObject pGameObject, String pContent, int pTextSize )
  {
    super(pGameObject);
    alignment1 = CENTER;
    alignment2 = CENTER;
    rectMode = CENTER;
    textSize = pTextSize;
    Content = pContent;
  }
  public Text(int pTextSize, int pLayer, PVector pOffset)
  {
    textSize = pTextSize;
    alignment1 = CENTER;
    alignment2 = CENTER;
    rectMode = CENTER;
    _layer = pLayer;
    _offset = pOffset;
  }
  public Text(String pContent, int pTextSize, int pLayer, int pColr )
  {
    alignment1 = CENTER;
    alignment2 = CENTER;
    rectMode = CENTER;
    textSize = pTextSize;
    Content = pContent;
    _layer = pLayer;
    _colr = pColr;
    _personalLayer = true;

  }
  public Text(String pContent, int pTextSize, int pLayer, PVector pOffset )
  {
    alignment1 = CENTER;
    alignment2 = CENTER;
    rectMode = CENTER;
    textSize = pTextSize;
    Content = pContent;
    _offset = pOffset;
    _layer = pLayer;
    _personalLayer = true;
  }
  public Text(String pContent)
  {
    alignment1 = CENTER;
    alignment2 = CENTER;
    rectMode = CENTER;
    textSize = 20;
    Content = pContent;
  }
  @Override
  public void onAdd()
  {
    _transform = GameObject.getTransform();

    if(!_personalLayer)
      _layer = GameObject.Layer;
  }
  @Override
  public void update()
  {
    LayerStacks.get(_layer).push(this);
  }
  public void render()
  {
    if(Content == null) return;
    var worldPos = _transform.WorldPos; //<>//
    
    push();
    fill(_colr);
    textAlign(alignment1,alignment2);
    rectMode(rectMode);
    textSize(textSize);
    if(_withOutline)
    {
      fill(190);
      var xPos = worldPos.x + _offset.x;
      var yPos = worldPos.y +_offset.y;
      for(int x = -1; x < 2; x++){
        for(int y = -1; y < 2; y++){
          text(Content, xPos+x,yPos+y);
        }
        text(Content, xPos + x * 1.3f, yPos);
        text(Content, xPos, yPos + x * 1.3f);
      }
      fill(0);
      text(Content, xPos,yPos);
    }
    else
      text(Content, worldPos.x + _offset.x, worldPos.y +_offset.y);
    pop();
  }
}
