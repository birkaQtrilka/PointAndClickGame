 
public HashMap<String,PImage> Images = new HashMap<String,PImage>();//get them by name
public SceneManager SceneManager;

void setup() {
  size (800,800);
  var imageLoader = new ImageLoader(dataPath(" "));
  Images = imageLoader.LoadAndGetImages();

  Input.initialize(this);
  SceneManager = new SceneManager();
}

void draw()
{
  background(0);
  SceneManager.updateState();
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
