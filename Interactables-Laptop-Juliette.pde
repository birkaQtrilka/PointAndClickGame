public abstract class Interactable extends Component
 {
   public abstract void interact();
   public boolean Level1Finished = false;
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
     SceneManager.GrabbedTeddy = true;
     SceneManager.TransitionToState(SceneName.Menu);
     //start dialogue
  }
}

public class Door extends Interactable 
{  
  public void interact()
  {  
     Level1Finished = true;
     //GameObject.DeleteFlag = false;
     SceneManager.TransitionToState(SceneName.Menu);
     
  }
}

//Scene 2 ===== Park ===== 
