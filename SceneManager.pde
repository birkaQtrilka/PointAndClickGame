import java.util.*;
public enum SceneName
{
  Scene1Dairy,
  Menu,
  MiniGame1,
  MiniGame2,
  MiniGame3,
  ChildhoodRoom,
  Party,
  Park
}
public class SceneManager extends StateManager<SceneName>
{
  public boolean GrabbedTeddy;
  public int CurrentFinishedLvls;
  
  public SceneManager(SceneName pEntryKey)
  {
    super(pEntryKey);

    States = Map.of( 
      
      //Menu Scene ==== START =====
      SceneName.Menu, new MenuScene(SceneName.Menu, this, 
      new GameObject("bg", 0,new PVector(width/2,height/2),new PVector(0.5f,0.5f), new ImageRenderer("game menu.png")),
        //OBJECT: Toy Box
          new GameObject("toyBox", 2,new PVector(200,225),  
            new ToyBox(),
            new Rectangle(new PVector(150,150),true),
            new Button()//debug true
          )  ,  
        //OBJECT: BaseBall
          new GameObject("baseBall", 2,new PVector(450,275),  
            new BaseBall(), 
            //new MenuNextLevel(),
            new Rectangle(new PVector(150,150),true),
            new Button()//debug true
          ) ,
          //Lock
          new GameObject("lock",3,new PVector(450,275),new PVector(0.4,0.4),  
            new ImageRenderer("lock.png"),
            new MenuNextLevel1()
          ) ,
        //OBJECT: Drinks
          new GameObject("drink1", 2,new PVector(700, 350),  
            new Drinks(),
            new Rectangle(new PVector(150,150),true),
            new Button()//debug true
          ),   
          new GameObject("drink2", 3,new PVector(700,350),new PVector(0.4,0.4),  
            new ImageRenderer("lock.png"),
            new MenuNextLevel2()
          )
      ),
       
      //Scene 1 ===== CHILDHOOD ROOM =====
      SceneName.ChildhoodRoom, new ChildhoodScene(SceneName.ChildhoodRoom, this, 
          //backGround
          new GameObject("bg", 0,new PVector(width/2,height/2),new PVector(0.5f,0.5f),
            new ImageRenderer("childhoodBg.png")
          ),
          
          //teddy Text Box
          new GameObject("teddy text window", 1,new PVector(width-100,height/1.7f), new PVector(.3f,.3f),
            new ImageRenderer("speechBubble.png"),
            new Text("Hello", 40, 2, 0)
          ),
          //mom Text Box
          new GameObject("mom text window", 1,new PVector(100,height/3.7f), new PVector(.3f,.3f),
            new ImageRenderer("speechBubble.png"),
            new Text("Hello", 40, 2, 0)
          ),
          //player
          new GameObject("player",/*pLayer*/ 3,/*position*/new PVector(width/2,height/1.5f), /*scale*/new PVector(0.5f,0.5f),  
            /*coponents*/
            new Player(),
            new Text(20,2, new PVector(0,-200)),//float text
            new AnimationController(AnimationName.ToddlerIdle),
            new ImageRenderer(""),
            new PlayerMovement(10),
            new Grab(),
            new Rectangle(new PVector(90,200),true)//debug true
          ),
          //teddy
          new GameObject("teddy",/*layer*/ 1,/*position*/new PVector(width-100,height/1.3f), /*scale*/new PVector(0.7f,0.7f),  
            /*components*/
            new Teddy(),
            new TextHover(),
            new Text("Talk to Teddy \n v",20,3, new PVector(0,-100)),
            new ImageRenderer("teddy.png"),
            new Rectangle(new PVector(100,100),true),//debug true
            new PlayerCollisionChecker()
          ),
          //books
          new GameObject("books",/*layer*/ 1,/*position*/new PVector(width/3.5,height/2.4f), /*scale*/new PVector(0.7f,0.7f),  
            /*components*/
            new LoreItem("I hate reading books",500),
            new TextHover(),
            new Text("books",20,3, new PVector(0,-100)),//textHover
            new Rectangle(new PVector(100,100),true),//debug true
            new PlayerCollisionChecker()
          ),
          //door
          new GameObject("door", 2,new PVector(100,height/2f),  
            /*components*/
            new Door(),
            new TextHover(),
            new Text("Talk to mom \n v",20,3, new PVector(0,-100)),
            new Rectangle(new PVector(150,300),true),//debug true
            new PlayerCollisionChecker()
          ),
          
          //Diary 1
          new GameObject("diary", 4, new PVector(width/2, height/2), new PVector(0.5, 0.5),
          new ImageRenderer("line-drawing-cartoon-open-diary-vector.jpg"),
          new Button(),
          new Rectangle(new PVector(width-10,height-10),true),//debug true
          new Diary("diary template.png","diary template.png", SceneName.MiniGame1)
          )
      ),
      
      //Scene 2 ===== Park ===== 
      SceneName.Park, new ParkScene(SceneName.Park, this,
      //background
        new GameObject("bg",0,new PVector(width/2,height/2),new PVector(0.5f,0.5f),
            new ImageRenderer("outsidedefi.png")
        ),
        //diary
        new GameObject("diary", 4, new PVector(width/2, height/2), new PVector(0.5, 0.5),
          new ImageRenderer("line-drawing-cartoon-open-diary-vector.jpg"),
          new Button(),
          new Rectangle(new PVector(width,height),true),//debug true
          new Diary("diary template.png","diary template.png", SceneName.MiniGame2)
        ),
          //teddy
        new GameObject("teddy", 2,new PVector(100,height/1.25f),new PVector(0.7f,0.7f),  
            new ImageRenderer("teddy.png"),
            new TeddyChoice()),
            
              //player
          new GameObject("player",/*pLayer*/ 3,/*position*/new PVector(width/2,height/1.9f), /*scale*/new PVector(0.3f,0.3f),  
            /*coponents*/
            new Player(),
            new AnimationController(AnimationName.ChildIdle),
            new ImageRenderer(""),
            new PlayerMovement(10),
            new Grab(),
            new Rectangle(new PVector(90,200),true)//debug true
        ),
         //bench
          new GameObject("door", 2,new PVector(100,height/2f),  
            /*components*/
            new Bench(),
            new Rectangle(new PVector(150,300),true),//debug true
            new PlayerCollisionChecker()
          )
      ),
        
      //Scene 3 ===== BIRTHDAY PARTY =====
      SceneName.Party, new PartyScene(SceneName.Party, this, 
      //background
        new GameObject("bg",0,new PVector(width/2,height/2),new PVector(0.5f,0.5f),
            new ImageRenderer("partyroom.png")

        ),
        new GameObject("bg",0,new PVector(width/2,height/2),new PVector(0.5f,0.5f),
            new ImageRenderer("partyroom.png")

        )
        
      ),
      SceneName.MiniGame1, new MiniGameScene(SceneName.MiniGame1, this, 
      //background
        new GameObject("image1",0,new PVector(90 + Images.get("miniGame1_1.png").width/2 * .4f,height/2),new PVector(.4f,.4f),
            new ImageRenderer("miniGame1_1.png")
        ),
        new GameObject("image2",0,new PVector(90 + Images.get("miniGame1_1.png").width * .4f + 50 + Images.get("miniGame1_2.png").width/2 * .4f,height/2),new PVector(.4f,.4f),
            new ImageRenderer("miniGame1_2.png")
        ),
        new GameObject("oddOne", 2,new PVector(200,225),  
            new Rectangle(new PVector(150,150),true),
            new CorrectAnswer(SceneName.Park),
            new Button()//debug true
          )
      ),
      SceneName.MiniGame2, new MiniGameScene(SceneName.MiniGame2, this, 
      //background
        new GameObject("image1",0,new PVector(90 + Images.get("miniGame1_1.png").width/2 * .4f,height/2),new PVector(.4f,.4f),
            new ImageRenderer("miniGame1_1.png")
        ),
        new GameObject("image2",0,new PVector(90 + Images.get("miniGame1_1.png").width * .4f + 50 + Images.get("miniGame1_2.png").width/2 * .4f,height/2),new PVector(.4f,.4f),
            new ImageRenderer("miniGame1_2.png")
        ),
        new GameObject("oddOne", 2,new PVector(200,225),  
            new Rectangle(new PVector(150,150),true),
            new CorrectAnswer(SceneName.Party),
            new Button()//debug true
          )
      ),
      SceneName.MiniGame3, new MiniGameScene(SceneName.MiniGame3, this, 
      //background
        new GameObject("image1",0,new PVector(90 + Images.get("miniGame1_1.png").width/2 * .4f,height/2),new PVector(.4f,.4f),
            new ImageRenderer("miniGame1_1.png")
        ),
        new GameObject("image2",0,new PVector(90 + Images.get("miniGame1_1.png").width * .4f + 50 + Images.get("miniGame1_2.png").width/2 * .4f,height/2),new PVector(.4f,.4f),
            new ImageRenderer("miniGame1_2.png")
        ),
        new GameObject("oddOne", 2,new PVector(200,225),  
            new Rectangle(new PVector(150,150),true),
            //new CorrectAnswer(SceneName.NewsPaper),
            new Button()//debug true
          )
      )
      //End of Scene 3 (Don't forget to put comma after above parenthesis if u want to add a new scene)
    );
    
  }
  public GameObject GetObjectInScene(String pObjName)
  {
    for(var o : ((Scene)CurrentState)._objects)
    {
      if(o.Name == pObjName)
        return o;
    }
    return null;
  }
}
