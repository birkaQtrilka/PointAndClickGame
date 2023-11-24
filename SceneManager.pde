import java.util.*;
public enum SceneName
{
  ChildhoodRoom
}
public class SceneManager extends StateManager<SceneName>
{
  
  public SceneManager(SceneName pEntryKey)
  {
    super(pEntryKey);
     //States = Map.of(SceneName.ChildhoodRoom, new Scene());

    States = Map.of( 
      //Scene 1 ===== CHILDHOOD ROOM =====
      SceneName.ChildhoodRoom, new Scene(SceneName.ChildhoodRoom, this, 
        new ArrayList<GameObject>(List.of(
            //backGround
          new GameObject(new PVector(width/2,height/2),new PVector(0.5f,0.5f),
            new ImageRenderer(Images.get("bg1.png"))
          ),
          //player
          new GameObject(new PVector(width/2,height/1.5f), new PVector(0.5f,0.5f),  
            new ImageRenderer(null),
            new PlayerMovement(2),
            new AnimationController(AnimationName.ToddlerIdle)
          ),
          //Text Box
          new GameObject(new Transform(new PVector(300,300), /*child of box*/ new GameObject(ZERO, new Text("Hello", 100))),  
            new ImageRenderer(null)
          )
        ))
      )    
      //Scene 2 ===== BIRTHDAY PARTY =====
      
    );
    
  }

}
