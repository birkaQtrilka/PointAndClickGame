import ddf.minim.*; //<>//

 public interface IRender
 {
   public void render();
 }
 
public HashMap<String,PImage> Images = new HashMap<String,PImage>();//get them by name
public HashMap<String, PImage[]> SpriteSheets = new HashMap<String, PImage[]>();
public HashMap<String,AudioPlayer> Audios = new HashMap<String,AudioPlayer>();

public static  ArrayList<Stack<IRender>> LayerStacks = new ArrayList<Stack<IRender>>()
{
  {
    add(new Stack<IRender>());
    add(new Stack<IRender>());
    add(new Stack<IRender>());
    add(new Stack<IRender>());
    add(new Stack<IRender>()); //Diary layer
  }
};

public SceneManager SceneManager;
public static PVector ZERO = new PVector(0,0);
public static PVector MousePos = new PVector();
public static int EvilScore = 0;
public ImageLoader ImageLoader;
public AudioPlay Background;

void setup() {
  size (1920/2,1080/2);
  
  ImageLoader = new ImageLoader(dataPath(" "));
  Images = ImageLoader.LoadAndGetImages();
  SpriteSheets = ImageLoader.LoadAndGetSpriteSheets();
  AudioLoader audioLoader = new AudioLoader(this, dataPath(""));
  Audios = audioLoader.LoadAndGetAudio();
  Input.initialize(this);
  SceneManager = new SceneManager(SceneName.Menu);
  SceneManager.onAdd();
  
  Background = new AudioPlay(Audios.get("Background_music.wav"), -30,true);
  Background.play();
}

void draw()
{
  background(0);

  //println(millis());
  MousePos.x = mouseX;
  MousePos.y = mouseY;
  SceneManager.update();
  Background.update();
  for(Stack<IRender> layer : LayerStacks)
    for(int i = 0; i < layer.size(); i++)
    {
      push();
      var t = layer.pop();
      t.render();
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
