import java.util.*;
public enum SceneName
{
  ChildhoodRoom,
  Party
}
public class SceneManager extends StateManager<SceneName>
{
  
  public SceneManager(SceneName pEntryKey)
  {
    super(pEntryKey);

    States = Map.of( 
      //Scene 1 ===== CHILDHOOD ROOM =====
      /*SceneName*/SceneName.ChildhoodRoom, new Scene(SceneName.ChildhoodRoom, this, 
          //backGround
          new GameObject(0,new PVector(width/2,height/2),new PVector(0.5f,0.5f),
            new ImageRenderer("bg1.png")
          ),
          
          //Text Box
          new GameObject(/*layer*/1,/*transform*/new Transform(/*position*/new PVector(width/1.2f,300), /*scale*/new PVector(0.2f,0.2f),
                            /*child of box*/ /*GameObject children*/
                           new GameObject(2,new PVector(0,-100), new Text("Hello", 40, 0)
                         )),  
            new ImageRenderer("thoughtCloud.png")
          ),
          //player
          new GameObject(/*pLayer*/ 3,/*position*/new PVector(width/2,height/1.5f), /*scale*/new PVector(0.5f,0.5f),  
            /*coponents*/
            new AnimationController(AnimationName.ToddlerIdle),
            new ImageRenderer(""),
            new PlayerMovement(5),
            new Rectangle(new PVector(170,400),true)//debug true
          )
          
          
      ),
      //Scene 2 ===== BIRTHDAY PARTY =====
      SceneName.Party, new Scene(SceneName.Party, this, 
      //background
      new GameObject(0,new PVector(width/2,height/2),new PVector(0.5f,0.5f),
            new ImageRenderer("doorView.jpeg")
          )
      )
      //End of Scene 2 (Don't forget to put comma after above parenthesis if u want to add a new scene)
    );
    
  }

}
