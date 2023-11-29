//Menu Scene ===Start====
class MenuNextLevel1 extends Component
{@Override 
  void update()
  {
    if(SceneManager != null && SceneManager.CurrentFinishedLvls >0){
       GameObject.DeleteFlag = true;
    }
  }
}
class MenuNextLevel2 extends Component
{@Override 
  void update()
  {
    if(SceneManager != null && SceneManager.CurrentFinishedLvls > 1){
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
  if(SceneManager.CurrentFinishedLvls > 0)
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
    if(SceneManager.CurrentFinishedLvls > 1)
    {
      println("Yes, Level 3");
     //SceneManager.TransitionToState(SceneName.);
    }else{
      println("nah uh uh, finish level 2 first");
      //NO GOOFIN AROUND IN MY CODE BASE! >:( 
      //It's endangering my reputation of a lvl 1000 programm baller
    }
     //SceneManager.TransitionToState(SceneName.);
  }
}
