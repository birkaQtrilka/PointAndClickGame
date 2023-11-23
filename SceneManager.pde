import java.util.*;

public class SceneManager extends StateManager
{
  public Scene firstScene;
  
  Scene currentScene;
  
  public SceneManager()
  {
    //factory AKA place where we will make every Game Object

    firstScene = new Scene( this,
    new ArrayList<GameObject>(List.of(
      //backGround
      new GameObject(new PVector(width/2,height/2),new PVector(0.5f,0.5f), new Component[] { 
        new ImageRenderer(Images.get("bg1.png"))
      }),
      //player
      /*new GameObject(new PVector(width/4,height/4),new PVector(0.25f,0.25f), new Component[] { 
        new ImageRenderer(Images.get("teddy.png")), 
        new PlayerMovement(1)
      })*/
      
      new GameObject(new PVector(width/2,height/2), new PVector(0.5f,0.5f), new Component[] { 
        new ImageRenderer(null),
        new PlayerMovement(1),
        new AnimationController(AnimationName.ToddlerWalk)
      })
    )));
    
    changeState(firstScene);
  }
  public void changeState(State scene)
  {
    if(currentScene != null)
      currentScene.onExit();
    currentScene = (Scene)scene;
    scene.onEnter();
  }
  public void update()
  {
    currentScene.update();
  }
}
