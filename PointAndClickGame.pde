 
public HashMap<String,PImage> Images = new HashMap<String,PImage>();//get them by name
public HashMap<String, PImage[]> SpriteSheets = new HashMap<String, PImage[]>();
public SceneManager SceneManager;
int GameStartTime = 0;
void setup() {
  size (1920/2,1080/2);
  var imageLoader = new ImageLoader(dataPath(" "));
  Images = imageLoader.LoadAndGetImages();
  SpriteSheets = imageLoader.LoadAndGetSpriteSheets();
  Input.initialize(this);
  GameStartTime = millis();
  SceneManager = new SceneManager();
}

void draw()
{
  background(0);
  SceneManager.update();
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
