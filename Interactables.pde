public abstract class Interactable extends Component
 {
   public abstract void interact();
 }


      // DIARIES === 
public class Diary extends Interactable  
{
  public void interact()
  {
     GameObject.DeleteFlag = true;
     //start dialogue
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
public class Teddy extends Interactable  
{
  public void interact()
  {
     
     SceneManager.TransitionToState(SceneName.Menu);
     SceneManager.GrabbedTeddy = true;
     SceneManager.level1Finished = true;
     //start dialogue
  }
}
public class LoreItem extends Interactable
{
  public String _hoverContent;
  public Text _playerTxt;
  int _stayTime;
  int _currStayTime;
  
  public LoreItem(String pHoverTxt, int pStayTime)
  {
    _hoverContent = pHoverTxt;
    _stayTime = pStayTime;
  }
  @Override
  void onAdd()
  {
    _playerTxt = PlayerInstance.GameObject.GetComponent(Text.class);
  }
  
  public void interact()
  {
    _playerTxt.enabled = true;

    _playerTxt.Content = _hoverContent;
    _currStayTime = _stayTime;
  }
  @Override
  public void update()
  {
    if(_currStayTime-- < 0)
    {
      _currStayTime = -1;
      _playerTxt.enabled = false;
    }
  }
}
public class Door extends Interactable 
{
  public void interact()
  
  {   
    SceneManager.level1Finished = true;
     //GameObject.DeleteFlag = false;
     SceneManager.TransitionToState(SceneName.Menu);
  }
}

//Scene 2 ===== Park =====  Bench

public class Bench extends Interactable 
{
  public void interact()
  
  {   
     SceneManager.level2Finished = true;
     //GameObject.DeleteFlag = false;
     SceneManager.TransitionToState(SceneName.Menu);
  }
}
