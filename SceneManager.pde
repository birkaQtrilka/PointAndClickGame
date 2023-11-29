import java.util.*;
public enum SceneName
{
  Menu,
  MiniGame1,
  MiniGame2,
  MiniGame3,
  ChildhoodRoom,
  Party,
  Park,
  JumpScare,
  Newspaper
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
      SceneName.Menu, new Scene(SceneName.Menu, this, 
      new GameObject("bg", 0,new PVector(width/2,height/2),new PVector(0.5f,0.5f), new ImageRenderer("game menu.png")),
        //OBJECT: Toy Box
          new GameObject("toyBox", 2,new PVector(200,225),  
            new LevelButton(SceneName.MiniGame1,-1),
            new Rectangle(new PVector(150,150),true),
            new Button()//debug true
          )  ,  
        //OBJECT: BaseBall
          new GameObject("baseBall", 2,new PVector(450,275),  
            new LevelButton(SceneName.MiniGame2,0),
            new Rectangle(new PVector(150,150),true),
            new Button()//debug true
          ) ,
          //Lock
          new GameObject("lock",3,new PVector(450,275),new PVector(0.4,0.4),  
            new ImageRenderer("lock.png"),
            new LockDelete(0)
          ) ,
        //OBJECT: Drinks
          new GameObject("drink1", 2,new PVector(700, 350),  
            new LevelButton(SceneName.MiniGame3,1),
            new Rectangle(new PVector(150,150),true),
            new Button()//debug true
          ),   
          //lock2
          new GameObject("drink2", 3,new PVector(700,350),new PVector(0.4,0.4),  
            new ImageRenderer("lock.png"),
            new LockDelete(1)
          )
      ),
       
      //Scene 1 ===== CHILDHOOD ROOM =====
      SceneName.ChildhoodRoom, new Scene(SceneName.ChildhoodRoom, this, 
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
          //teddy -------------- BAD
          new GameObject("teddy",/*layer*/ 1,/*position*/new PVector(width-100,height/1.4f), /*scale*/new PVector(0.7f,0.7f),  
            /*components*/
            new Teddy(true),
            new TextHover(),
            new Text("Talk to Teddy \n v",20,3, new PVector(0,-100)),
            new Rectangle(new PVector(100,100),true),//debug true
            new PlayerCollisionChecker()
          ),
          //books
          new GameObject("books",/*layer*/ 1,/*position*/new PVector(width/3.5f,height/2.4f), /*scale*/new PVector(0.7f,0.7f),  
            new LoreItem("I hate reading books",3000),
            new TextHover(),
            new Text("books",20,3, new PVector(0,-100)),//textHover
            new Rectangle(new PVector(100,100),true),//debug true
            new PlayerCollisionChecker()
          ),
          //door
          new GameObject("door", 2,new PVector(100,height/2f),  
            /*components*/
            new Transition(false),
            new TextHover(),
            new Text("Talk to mom \n v",20,3, new PVector(0,-100)),
            new Rectangle(new PVector(150,300),true),//debug true
            new PlayerCollisionChecker()
          ),
          //Diary 1
          new GameObject("diary", 4, new PVector(width/2, height/2), new PVector(0.5f, 0.5f),
            new ImageRenderer("line-drawing-cartoon-open-diary-vector.jpg"),
            new Button(),
            new Rectangle(new PVector(width-10,height-10),true),//debug true
            new Diary("diary template.png","diary template.png", SceneName.Menu,1)
          )
      ),
      //need to do cutscene
      //Scene 2 ===== Park ===== 
      SceneName.Park, new Scene(SceneName.Park, this,
      //background
        new GameObject("bg",0,new PVector(width/2,height/2),new PVector(0.5f,0.5f),
            new ImageRenderer("outsidedefi.png"),
            new TeddyChoice("outsidedefiWithBear.png")
        ),
        //player
        new GameObject("player",/*pLayer*/ 3,/*position*/new PVector(width/2,height/1.9f), /*scale*/new PVector(0.3f,0.3f),  
            /*coponents*/
            new Player(),
            new AnimationController(AnimationName.ChildIdle),
            new ImageRenderer(""),
            new PlayerMovement(10),
            new Text(20,2, new PVector(0,-200)),
            new Grab(),
            new Rectangle(new PVector(90,200),true)//debug true
        ),
        //friends text blob
        new GameObject("friends text window", 1,new PVector(100,height/3.7f), new PVector(.3f,.3f),
            new ImageRenderer("speechBubble.png"),
            new Text("Hello", 40, 2, 0)
          ),
        //woods
          new GameObject("woods",/*layer*/ 1,/*position*/new PVector(width/2,height/1.8f), /*scale*/new PVector(0.7f,0.7f),  
            /*components*/
            new LoreItem("I always thought these woods were creepy",1000),
            new TextHover(),
            new Text("Examine \n    V",20,3, new PVector(0,-100)),//textHover
            new Rectangle(new PVector(100,100),true),//debug true
            new PlayerCollisionChecker()
          ),
         //goodChoice GOING FOR THE BALL SOLO
          new GameObject("ballCoice", 2,new PVector(width/1.3f,height/1.5f),  
            //new Transition(true),
            new TextHover(),
            new Text("Go for the ball yourself",20,3, new PVector(0,-50)),
            new JumpScareHandler(),
            new Rectangle(new PVector(70,70),true),//debug true
            new PlayerCollisionChecker()
          ),
          //badChoice FAKING INJURY
          new GameObject("firendsChoice", 2,new PVector(100,height/2f),  
            new Transition(true),
            new TextHover(),
            new Text("Fake your injury",20,3, new PVector(0,-100)),
            new Rectangle(new PVector(400,300),true),//debug true
            new PlayerCollisionChecker(),
            new ImageRenderer("friendsChapter2.png")
          ), 
          //diary
        new GameObject("diary", 4, new PVector(width/2, height/2), new PVector(0.5, 0.5),
          new ImageRenderer("line-drawing-cartoon-open-diary-vector.jpg"),
          new Button(),
          new Rectangle(new PVector(width-10,height-10),true),//debug true
          new Diary("diary template.png","diary template.png", SceneName.Menu, 2)
        ),
        new GameObject("Cutscene", 4, new PVector(width/2, height/2), new PVector(.5f,.5f),
          new AnimationController(AnimationName.ArmJumpScare),
          new ImageRenderer("")
          //transition after cutscene to next diary
        )
      ),
      //text over the group of mean guys at start of the scene that disappears after some time
      //add friend group to the left
      //Scene 3 ===== BIRTHDAY PARTY =====
      SceneName.Party, new Scene(SceneName.Party, this, 
      //background
        new GameObject("bg",0,new PVector(width/2,height/2),new PVector(0.5f,0.5f),
            new ImageRenderer("partyroom.png")
        ),
        //teens
        new GameObject("bg",0,new PVector(width/2,height/2),new PVector(0.5f,0.5f),
            new ImageRenderer("olderFriends.png")
        ),
        //player
        new GameObject("player",/*pLayer*/ 3, new PVector(width/1.3f,height/1.9f), /*scale*/new PVector(0.3f,0.3f),  
            new Player(),
            new AnimationController(AnimationName.ChildIdle),
            new ImageRenderer(""),
            new PlayerMovement(10),
            new Grab(),
            new Rectangle(new PVector(90,200),true)//debug true
        ),
        //diary
        new GameObject("diary", 4, new PVector(width/2, height/2), new PVector(0.5, 0.5),
          new ImageRenderer("line-drawing-cartoon-open-diary-vector.jpg"),
          new Button(),
          new Rectangle(new PVector(width-10,height-10),true),//debug true
          new Diary("diary template.png","diary template.png", SceneName.Newspaper, 3)
        ),
        new GameObject("door", 2,new PVector(100,height/2f),  
            new Transition(false),//is bad choice?
            new Rectangle(new PVector(150,300),true),//debug true
            new PlayerCollisionChecker()
        )
        //GOOD ---- drinking the bear
        //BAD --- going to your friends
        //When drink, characters disappear and bg changes
      ),
      SceneName.Newspaper, new Scene(SceneName.Newspaper, this, 
        new GameObject("image1",0,new PVector(width/2,height/2),new PVector(.6f,.6f),
            new ImageRenderer("newspaper good ending.png")
        )
      ),
      SceneName.MiniGame1, new Scene(SceneName.MiniGame1, this, 
      //background
        new GameObject("image1",0,new PVector(width/2,height/2),new PVector(.5f,.5f),
            new ImageRenderer("miniGame1.png")
        ),

        new GameObject("oddOne", 2,new PVector(width/1.3f,height/2.45f),  
            new Rectangle(new PVector(80,90),true),
            new CorrectAnswer(SceneName.ChildhoodRoom),
            new Button()//debug true
          )
      ),
      SceneName.MiniGame2, new Scene(SceneName.MiniGame2, this, 
      //background
        new GameObject("image1",0,new PVector(width/2,height/2),new PVector(.5f,.5f),
            new ImageRenderer("miniGame2.png")
        ),
        new GameObject("oddOne", 2,new PVector(width/1.25f,height/2.4f),  
            new Rectangle(new PVector(80,80),true),
            new CorrectAnswer(SceneName.Park),
            new Button()//debug true
          )
      ),
      SceneName.MiniGame3, new Scene(SceneName.MiniGame3, this, 
      //background
        new GameObject("image1",0,new PVector(width/2,height/2),new PVector(.5f,.5f),
            new ImageRenderer("miniGame3.png")
        ),
        new GameObject("oddOne", 2,new PVector(width/1.15f,height/1.8f),  
            new Rectangle(new PVector(80,80),true),
            new CorrectAnswer(SceneName.Party),
            new Button()//debug true
          )
        
      )
      
      
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
