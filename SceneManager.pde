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
            new Rectangle(new PVector(150,150),false),
            new TextHover(),
            new Text("V",50,3, new PVector(0,-80)),
            new Button()//debug true
          )  ,  
        //OBJECT: BaseBall
          new GameObject("baseBall", 2,new PVector(450,275),  
            new LevelButton(SceneName.MiniGame2,0),
            new Rectangle(new PVector(150,150),false),
            new TextHover(),
            new Text("V",50,3, new PVector(0,-80)),
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
            new Rectangle(new PVector(150,150),false),
            new TextHover(),
            new Text("V",50,3, new PVector(0,-80)),
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
            new ImageRenderer("bear_says_sasha_sasha.png"),
            new ImageDisappear(9000)  

          ),
          //mom Text Box
          new GameObject("mom text window", 1,new PVector(100,height/3.7f), new PVector(.3f,.3f),
            new ImageRenderer("mom_says_are_u_ok.png"),
            new ImageDisappear(9000)  

          ),
          new GameObject("playerFollow", 1,new PVector(100,height/3.7f), new PVector(.4f,.4f),
            new ImageRenderer("speechBubble.png"),
            new PlayerFollow(new PVector(0,-150))
          ),
          //player
          new GameObject("player",3,new PVector(width/2,height/1.5f), /*scale*/new PVector(0.5f,0.5f),  
            new Player(),
            new Text(20,2, new PVector(0,-200)),//float text
            new AnimationController(AnimationName.ToddlerIdle),
            new ImageRenderer(""),
            new PlayerMovement(8),
            new Grab(),
            new Rectangle(new PVector(90,200),false)//debug true
          ),
          //teddy -------------- BAD
          new GameObject("teddy",/*layer*/ 1,/*position*/new PVector(width-100,height/1.4f), /*scale*/new PVector(0.7f,0.7f),  
            /*components*/
            new Teddy(true),
            new TextHover(),
            new Text("Talk to Teddy \n v",20,3, new PVector(0,-80)),
            new Rectangle(new PVector(100,100),false),//debug true
            new PlayerCollisionChecker()
          ),
          //books
          new GameObject("books", 1, new PVector(width/3.5f,height/2.4f), /*scale*/new PVector(0.7f,0.7f),  
            new LoreItem("i_used_to_have_books.png",3000),
            new TextHover(),
            new Text("books\nV",20,3, new PVector(0,-85)),//textHover
            new Rectangle(new PVector(100,100),false),//debug true
            new PlayerCollisionChecker()
          ),
          //door
          new GameObject("door", 2,new PVector(100,height/2f),  
            /*components*/
            new Transition(false),
            new TextHover(),
            new Text("Talk to mom \n v",20,3, new PVector(0,-90)),
            new Rectangle(new PVector(150,300),false),//debug true
            new PlayerCollisionChecker()
          ),
          //Diary 1
          new GameObject("diary", 4, new PVector(width/2, height/2), new PVector(0.5f, 0.5f),
            new ImageRenderer("line-drawing-cartoon-open-diary-vector.jpg"),
            new Button(),
            new Rectangle(new PVector(width-10,height-10),false),//debug true
            new Diary("diary_1_before_choosing.png","diary_1_pick_teddy.png","diary_1_pick_mom.png", SceneName.Menu,1)
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
        //player follow
        new GameObject("playerFollow", 1,new PVector(100,height/3.7f), new PVector(.4f,.4f),
            new ImageRenderer("speechBubble.png", false),
            new PlayerFollow(new PVector(0,-150))
          ),
        //player
        new GameObject("player",/*pLayer*/ 3,/*position*/new PVector(width/2,height/1.9f), /*scale*/new PVector(0.3f,0.3f),  
            /*coponents*/
            new Player(),
            new AnimationController(AnimationName.ChildIdle),
            new ImageRenderer(""),
            new PlayerMovement(8),
            new Text(20,2, new PVector(0,-150)),
            new Grab(),
            new Rectangle(new PVector(90,200),false)//debug true
        ),
        //friends text blob
        new GameObject("friends text window", 1,new PVector(100,height/3.7f), new PVector(.3f,.3f),
            new ImageRenderer("somebody_gon_get_err.png"),
            new ImageDisappear(9000)  

          ),
        //woods
          new GameObject("woods", 1,new PVector(width/2.55f,height/2.2f), new PVector(0.7f,0.7f),  
            new LoreItem("new_forest_text.png",2000),
            new TextHover(),
            new Text("Examine\nV",20,3, new PVector(0,-60)),//textHover
            new Rectangle(new PVector(100,100),false),//debug true
            new PlayerCollisionChecker()
          ),
         //goodChoice GOING FOR THE BALL SOLO
          new GameObject("ballCoice", 2,new PVector(width/1.26f,height/1.9f),  
            new TextHover(),
            new Text("Go for the ball yourself\nV",20,3, new PVector(0,-30)),
            new JumpScareHandler(),
            new Rectangle(new PVector(70,120),false),//debug true
            new PlayerCollisionChecker()
          ),
          //badChoice FAKING INJURY
          new GameObject("firendsChoice", 2,new PVector(180,height/2f), new PVector(.4f,.4f),  
            new Transition(true),
            new TextHover(),//do an image hover
            new Text("Fake your injury\nV",20,3, new PVector(0,-155)),
            new Rectangle(new PVector(300,300),false),//debug true
            new PlayerCollisionChecker(),
            new ImageRenderer("friendsChapter2.png")
          ), 
          //diary
        new GameObject("diary", 4, new PVector(width/2, height/2), new PVector(0.5, 0.5),
          new ImageRenderer("line-drawing-cartoon-open-diary-vector.jpg"),
          new Button(),
          new Rectangle(new PVector(width-10,height-10),false),//debug true
          new Diary("diary_2_before_choosing.png","diary_2_good_option.png", "diary_2_bad_option.png", SceneName.Menu, 2)
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
        //player follow bubble
        new GameObject("playerFollow", 1,new PVector(100,height/3.7f), new PVector(.4f,.4f),
            new ImageRenderer("speechBubble.png", false),
            new PlayerFollow(new PVector(0,-150))
        ),
        //player
        new GameObject("player",/*pLayer*/ 3, new PVector(width/1.3f,height/1.65f), /*scale*/new PVector(0.25f,0.25f),  
            new Player(),
            new AnimationController(AnimationName.ChildIdle),
            new ImageRenderer(""),
            new PlayerMovement(8),
            new Grab(),
            new Rectangle(new PVector(90,200),false)//debug true
        ),
        //friends (no speech bubble)
        new GameObject("friends",1,new PVector(width/5,height/1.8f),new PVector(0.25f,0.25f),
            new ImageRenderer("olderFriends.png")
        ),
        new GameObject("friends text hover",1,new PVector(width/5,height/2),new PVector(0.25f,0.25f),
            new Rectangle(new PVector(200,300),false),
            new TextHover(),//image hover
            new Text("Hang out with your friends\nV", 20,3, new PVector(0,-125)),
            new Transition(false),
            new PlayerCollisionChecker()
        ),
        //bad guys
        new GameObject("badGuys",1,new PVector(width/1.4f,height/1.8f),new PVector(0.25f,0.25f),
            new ImageRenderer("sketchy people .png")
        ),
        new GameObject("badGuys bubble1",1,new PVector(width/1.25f,height/4f),new PVector(0.25f,0.25f),
            new ImageRenderer("come_drink_sum.png"),
            new ImageDisappear(9000)
        ),
        new GameObject("badGuys bubble 2",1,new PVector(width/1.7f,height/4.3f),new PVector(0.25f,0.25f),
            new ImageRenderer("drink_da_beer.png"),
            new ImageDisappear(9000)  
        ),
        new GameObject("badGuys text hover",1,new PVector(width/1.4f,height/2),new PVector(0.25f,0.25f),
            new Rectangle(new PVector(230,300),false),
            new TextHover(),//image hover
            new Text("Go drink a bear\nV", 20,3, new PVector(0,-105)),
            new PlayerCollisionChecker(),
            new DrinkBear(Images.get("partyroom_dark.png"), 3000)
        ),
        //diary
        new GameObject("diary", 4, new PVector(width/2, height/2), new PVector(0.5, 0.5),
          new ImageRenderer("line-drawing-cartoon-open-diary-vector.jpg"),
          new Button(),
          new Rectangle(new PVector(width-10,height-10),false),
          new Diary("diary_3_before_choosing 2.png","diary_3_bad_option.png", "diary_3_good_option.png", SceneName.Newspaper, 3)
        )

      ),
      SceneName.Newspaper, new Scene(SceneName.Newspaper, this, 
        new GameObject("image1",0,new PVector(width/2,height/2),new PVector(.6f,.6f),
            new ImageRenderer("newspaper good ending.png"),
            new EvilChoice("newspaper bad ending.png")
        )
      ),
      SceneName.MiniGame1, new Scene(SceneName.MiniGame1, this, 
      //background
        new GameObject("image1",0,new PVector(width/2,height/2),new PVector(.5f,.5f),
            new ImageRenderer("miniGame1.png")
        ),

        new GameObject("oddOne", 2,new PVector(width/1.29f,height/2.55f),  
            new Rectangle(new PVector(80,90),false),
            new CorrectAnswer(SceneName.ChildhoodRoom),
            new Button()//debug true
          )
      ),
      SceneName.MiniGame2, new Scene(SceneName.MiniGame2, this, 
      //background
        new GameObject("image1",0,new PVector(width/2,height/2),new PVector(.5f,.5f),
            new ImageRenderer("miniGame2.png")
        ),
        new GameObject("oddOne", 2,new PVector(width/1.25f,height/2.6f),  
            new Rectangle(new PVector(80,80),false),
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
            new Rectangle(new PVector(80,80),false),
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
