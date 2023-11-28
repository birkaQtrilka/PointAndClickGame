import java.util.*;
public enum SceneName
{
  Scene1Dairy,
  Menu,
  
  ChildhoodRoom,
  Party,
  Park
}
public class SceneManager extends StateManager<SceneName>
{
  public boolean GrabbedTeddy;
  public boolean level1Finished;
 public boolean level2Finished;
  
  public SceneManager(SceneName pEntryKey)
  {
    super(pEntryKey);

    States = Map.of( 
      
      //Menu Scene ==== START =====
      SceneName.Menu, new MenuScene(SceneName.Menu, this, 
      new GameObject(0,new PVector(width/2,height/2),new PVector(0.5f,0.5f), new ImageRenderer("game menu.png")),
        //OBJECT: Toy Box
          new GameObject( 2,new PVector(200,225),  
            new ToyBox(),
            new Rectangle(new PVector(150,150),true),
            new Click()//debug true
          )  ,  
        //OBJECT: BaseBall
          new GameObject(2,new PVector(450,275),  
            new BaseBall(), 
            //new MenuNextLevel(),
            new Rectangle(new PVector(150,150),true),
            new Click()//debug true
          ) ,
          //Lock
          new GameObject(3,new PVector(450,275),new PVector(0.4,0.4),  
            new ImageRenderer("lock.png"),
            new MenuNextLevel1()
          ) ,
        //OBJECT: Drinks
          new GameObject( 2,new PVector(700, 350),  
            new Drinks(),
            new Rectangle(new PVector(150,150),true),
            new Click()//debug true
          ),   
          new GameObject(3,new PVector(700,350),new PVector(0.4,0.4),  
            new ImageRenderer("lock.png"),
            new MenuNextLevel2()
          )
      ),
       
      //Scene 1 ===== CHILDHOOD ROOM =====
      SceneName.ChildhoodRoom, new ChildhoodScene(SceneName.ChildhoodRoom, this, 
          //backGround
          new GameObject(0,new PVector(width/2,height/2),new PVector(0.5f,0.5f),
            new ImageRenderer("childhoodBg.png")
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
            new Player(),
            new Text("",20,3, new PVector(0,-120)),
            new AnimationController(AnimationName.ToddlerIdle),
            new ImageRenderer(""),
            new PlayerMovement(10),
            new Grab(),
            new Rectangle(new PVector(90,200),true)//debug true
          ),
          
          
          //teddy
          new GameObject(/*layer*/ 1,/*position*/new PVector(width-100,height/1.3f), /*scale*/new PVector(0.7f,0.7f),  
            /*components*/
            new Teddy(),
            new TextHover(),
            new Text("Talk to Teddy \n v",20,3, new PVector(0,-100)),
            new ImageRenderer("teddy.png"),
            new Rectangle(new PVector(100,100),true),//debug true
            new PlayerCollisionChecker()
          ),//lore item
          new GameObject(/*layer*/ 1,/*position*/new PVector(width-300,height/1.3f), /*scale*/new PVector(0.7f,0.7f),  
            /*components*/
            new LoreItem("I don't like ze teddy beaer *in russian accent* ", 50),
            new TextHover(),
            new Text("Talk to Teddy \n v",20,3, new PVector(0,-100)),
            new ImageRenderer("teddy.png"),
            new Rectangle(new PVector(100,100),true),//debug true
            new PlayerCollisionChecker()
          ),
          
          //door
          new GameObject( 2,new PVector(100,height/2f),  
            /*components*/
            new Door(),
            new TextHover(),
            new Text("Talk to mom \n v",20,3, new PVector(0,-100)),
            new Rectangle(new PVector(150,300),true),//debug true
            new PlayerCollisionChecker()
          ),
          //Diary 1
          new GameObject(4, new PVector(width/2, height/2), new PVector(0.5, 0.5),
          new ImageRenderer("line-drawing-cartoon-open-diary-vector.jpg"),
          new Click(),
          new Rectangle(new PVector(displayWidth,displayHeight),true),//debug true
          new Diary()
          )
      ),
      //Scene 2 ===== Park ===== 
      SceneName.Park, new ParkScene(SceneName.Park, this,
      //background
        new GameObject(0,new PVector(width/2,height/2),new PVector(0.5f,0.5f),
            new ImageRenderer("parkBg.jpg")
        ),
          //teddy
        new GameObject(2,new PVector(100,height/1.25f),new PVector(0.7f,0.7f),  
            new ImageRenderer("teddy.png"),
            new TeddyChoice()),
            
              //player
          new GameObject(/*pLayer*/ 3,/*position*/new PVector(width/2,height/1.4f), /*scale*/new PVector(0.5f,0.5f),  
            /*coponents*/
            new Player(),
            new AnimationController(AnimationName.ToddlerIdle),
            new ImageRenderer(""),
            new PlayerMovement(10),
            new Grab(),
            new Rectangle(new PVector(90,200),true)//debug true
        ),
         //door
          new GameObject( 2,new PVector(100,height/2f),  
            /*components*/
            new Bench(),
            new Rectangle(new PVector(150,300),true),//debug true
            new PlayerCollisionChecker()
          )
      ),
        
      //Scene 3 ===== BIRTHDAY PARTY =====
      SceneName.Party, new PartyScene(SceneName.Party, this, 
      //background
        new GameObject(0,new PVector(width/2,height/2),new PVector(0.5f,0.5f),
            new ImageRenderer("partyBg.png")

        )
      )
      //End of Scene 3 (Don't forget to put comma after above parenthesis if u want to add a new scene)
    );
    
  }

}
