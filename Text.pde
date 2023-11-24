public class Text extends Component
{
  int alignment1;
  int alignment2;
  int textmode;
  int textSize;
  public String Content;
  
  public Text(GameObject pGameObject, String pContent, int pTextSize )
  {
    super(pGameObject);
    alignment1 = LEFT;
    alignment2 = CENTER;
    textmode = CENTER;
    textSize = pTextSize;
    Content = pContent;
  }
  public Text(String pContent, int pTextSize )
  {
    alignment1 = LEFT;
    alignment2 = CENTER;
    textmode = CENTER;
    textSize = pTextSize;
    Content = pContent;
  }
  public Text(String pContent)
  {
    alignment1 = LEFT;
    alignment2 = CENTER;
    textmode = CENTER;
    textSize = 20;
    Content = pContent;
  }
  @Override
  public void update()
  {
    println("running");
    fill(0);
    textAlign(alignment1,alignment2);
    rectMode(CENTER);
    textSize(textSize);
    text(Content, 0,0);
  }
}
