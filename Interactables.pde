public abstract class Interactable extends Component
 {
   public abstract void interact();
 }

public class Teddy extends Interactable  
{
  public void interact()
  {
     SceneManager.GrabbedTeddy = true;
     SceneManager.TransitionToState(SceneName.Park);
     //start dialogue
  }
}
public class Door extends Interactable 
{
  public void interact()
  {
     SceneManager.TransitionToState(SceneName.Park);
     //start dialogue
  }
}
