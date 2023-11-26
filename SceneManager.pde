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
            new ImageRenderer("bg1.png")
          ),
          //Text Box
          new GameObject(new Transform(new PVector(width/1.2f,300), new PVector(0.2f,0.2f),
                            /*child of box*/ 
                           new GameObject(new PVector(0,-100), new Text("Hello", 40, 0)
                         )),  
            new ImageRenderer("thoughtCloud.png")
          ),
          //player
          new GameObject(new PVector(width/2,height/1.5f), new PVector(0.5f,0.5f),  
            new ImageRenderer(""),
            new PlayerMovement(5),
            new Rectangle(new PVector(170,400),true),//debug true
            new AnimationController(AnimationName.ToddlerIdle)
          )
          
        ))
      )    
      //Scene 2 ===== BIRTHDAY PARTY =====
      
    );
    
  }

}
