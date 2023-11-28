//Menu Scene ===Start====
class MenuNextLevel1 extends Component
{@Override 
  void update()
  {
    if(SceneManager != null && SceneManager.level1Finished){
       GameObject.DeleteFlag = true;
    }
  }
}
class MenuNextLevel2 extends Component
{@Override 
  void update()
  {
    if(SceneManager != null && SceneManager.level2Finished){
       GameObject.DeleteFlag = true;
    }
  }
}

public class ToyBox extends Interactable 
{ 
  public void interact()
  {
     SceneManager.TransitionToState(SceneName.ChildhoodRoom);
  }
}
public class BaseBall extends Interactable 
{     
  public void interact()
  {
  if(SceneManager.level1Finished)
    {
      SceneManager.TransitionToState(SceneName.Park);
    }else{
      println("nah uh uh, finish level 1 first");
    }
    //SceneManager.TransitionToState(SceneName.Park);
  }
}

public class Drinks extends Interactable 
{ 
  public void interact()
  {  
    if(SceneManager.level2Finished)
    {
      println("Yes, Level 3");
     //SceneManager.TransitionToState(SceneName.);
    }else{
      println("nah uh uh, finish level 2 first");
    }
     //SceneManager.TransitionToState(SceneName.);
  }
}
