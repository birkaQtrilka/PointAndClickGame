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
      new GameObject(new PVector(width/2,height/2), new Component[] { 
        new ImageRenderer(Images.get("doorView.jpeg"))
      }),
      //player
      new GameObject(new PVector(width/2,height/2), new Component[] { 
        new ImageRenderer(Images.get("teddy.png")), 
        new PlayerMovement(1/*speed*/)
      }),
      
      new GameObject(new PVector(width/2,height/2), new Component[] { 
        new ImageRenderer(null), 
        new PlayerMovement(1/*speed*/),
        //new AnimationController();
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
  public void updateState()
  {
    currentScene.update();
  }
}
