 
public HashMap<String,PImage> Images = new HashMap<String,PImage>();//get them by name
public HashMap<String, PImage[]> SpriteSheets = new HashMap<String, PImage[]>();
public Stack<TopText> TopTextList = new Stack<TopText>();

public SceneManager SceneManager;
public static PVector ZERO = new PVector(0,0);
public static PVector MousePos = new PVector();

void setup() {
  size (1920/2,1080/2);
  var imageLoader = new ImageLoader(dataPath(" "));
  Images = imageLoader.LoadAndGetImages();
  SpriteSheets = imageLoader.LoadAndGetSpriteSheets();
  Input.initialize(this);
  SceneManager = new SceneManager(SceneName.ChildhoodRoom);
  SceneManager.onAdd();
}

void draw()
{
  background(0);
  MousePos.x = mouseX;
  MousePos.y = mouseY;
  SceneManager.update();
  for(int i = 0; i < TopTextList.size(); i++)
  {
    var t = TopTextList.pop();
    t.Display();

  }

}


public class TopText
{
  public float x, y;
  public String Content;
  int alignment1;
  int alignment2;
  int rectMode;
  int textSize;
  int colr;
  
  public TopText(String pContent, int pTextSize, float pX, float pY, int pColr )
  {
    x= pX;
    y = pY;
    alignment1 = CENTER;
    alignment2 = CENTER;
    rectMode = CENTER;
    textSize = pTextSize;
    Content = pContent;
    colr = pColr;
  }
  public void Display()
  {
    push();
    fill(colr);
    textAlign(alignment1,alignment2);
    rectMode(rectMode);
    textSize(textSize);
    text(Content, x, y);
    pop();
  }
}
/*boolean mouseWasPressed;
int hold;
int holdTime = 10;
PVector position = new PVector();
boolean exitedObj;
void draw() {
  background(0);
  //if press 
  if(Input.mousePressedThisFrame())
  {
    if(mouseIsInsideRect(position,50,50))
      exitedObj = false;
  }
  if(Input.mouseUpThisFrame())
  {
    hold = 0;

  }
  if(Input.mouseDown())
  {
    if(hold < holdTime && !mouseIsInsideRect(position,50,50))
    {
      exitedObj = true;
    } 
    hold++;
  }

  if(hold > holdTime && !exitedObj)
  {
    position.x = mouseX;
    position.y = mouseY;
  }
  rectMode(CENTER);
  rect(position.x, position.y, 50,50);
}

boolean mouseIsInsideRect( PVector rectPoint, int w, int h)
{
    return mouseX > (rectPoint.x - w/2)  && mouseX < (rectPoint.x + w/2) 
    && mouseY > (rectPoint.y - h/2) && mouseY < (rectPoint.y + h/2)  ;

}*/
