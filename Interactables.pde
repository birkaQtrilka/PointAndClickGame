public abstract class Interactable extends Component
 {
   public abstract void interact();
 }

// ===== MiniGame =====
public class CorrectAnswer extends Interactable
{
  SceneName _transitionToScene;
  public CorrectAnswer(SceneName pTransitionToScene)
  {
    _transitionToScene = pTransitionToScene;
  }
  public void interact()
  {
    //what happens when I choose the correct answer? Do I just go next?
    SceneManager.TransitionToState(_transitionToScene);
  }
}
      // DIARIES === 
public class Diary extends Interactable  
{
  public Diary(String pHalfFullImgName, String pFullImgName, SceneName pNextScene, int pLevel)
  {
    _halfFull = Images.get(pHalfFullImgName);
    _full = Images.get(pFullImgName);
    _nextScene = pNextScene;
    _level = pLevel;
  }
  SceneName _nextScene;
  PImage _halfFull;
  PImage _full;
  ImageRenderer _renderer;
  boolean _secondPhase;
  int _level;
  boolean waitOneFrame;
  ArrayList<GameObject> _sceneObjects;
  
  @Override
  void onAdd()
  {
    _renderer = GameObject.GetComponent(ImageRenderer.class);
    _renderer.Image = _halfFull;
    _sceneObjects = ((Scene)SceneManager.CurrentState)._objects;
    for(var o : _sceneObjects)
    {
      if(o != GameObject)
        o.Active = false;
    }
  }
  public void interact()//it's reactivated by in teddy/door class
  {
    if(waitOneFrame)
    {
      waitOneFrame = false;
      return;
    }
    
    if(_secondPhase)
    {
      if(SceneManager.CurrentFinishedLvls < _level)
        SceneManager.CurrentFinishedLvls++;
      
      //reset
      _secondPhase = false;
      waitOneFrame = false;
      _renderer.Image = _halfFull;
      for(var o : _sceneObjects)
      {
        if(o != GameObject)
          o.Active = false;
      }
      
      SceneManager.TransitionToState(_nextScene);

    }
    else
    {
      for(var o : _sceneObjects)
      {
        if(o != GameObject)
          o.Active = true;
      }
      GameObject.Active = false;    
    }

  }
  public void InitiateSecondPhase()
  {
    //disabling all objects behing the diary entry
    for(var o : _sceneObjects)
    {
        if(o != GameObject)
          o.Active = false;
    }
     _renderer.Image = _full;
     _secondPhase = true;
     GameObject.Active = true;
     waitOneFrame = true;
  }
  
}

public class DiaryMenu extends Interactable  
{
  public void interact()
  {
     SceneManager.TransitionToState(SceneName.Menu);
     //start dialogue
  }
}

//Scene 1 ===== CHILDHOOD ROOM =====

public class Transition extends Interactable
{
  boolean _isBadChoice;
  boolean choiceMade;
  public Transition(boolean pBadChoice)
  {
    _isBadChoice = pBadChoice;
  }
  public void interact()
  {   
    if(!choiceMade && _isBadChoice){
         EvilScore++;
      choiceMade = true;    
    }
     SceneManager.GetObjectInScene("diary").GetComponent(Diary.class).InitiateSecondPhase();
  }
}

public class Teddy extends Transition  
{
  public Teddy(boolean pBadChoice)
  {
    super(pBadChoice);
  }
  public void interact()
  {
    super.interact();
    SceneManager.GrabbedTeddy = true;
  }
}

public class LoreItem extends Interactable
{
  String Content;
  int _stayTime;
  int _currStayTime;
  Text _playerText;
  boolean _alreadyDisabled;
  public LoreItem(String pTextContent, int pStayTime)
  {
    Content = pTextContent;
    _stayTime = pStayTime;
  }
  @Override
  public void onAdd()
  {
    _playerText = SceneManager.GetObjectInScene("player").GetComponent(Text.class);
  }
  @Override
  public void interact()
  {
    _playerText.Content = Content;
    _playerText.enabled = true;
    _currStayTime = millis();
    _alreadyDisabled = false;
    //after time, disable text hover
    
  }
  @Override
  public void update()
  {
    if(_alreadyDisabled && millis() - _currStayTime < _stayTime)
    {
      _playerText.enabled = false;
      _alreadyDisabled = true;
    }
  }
}
