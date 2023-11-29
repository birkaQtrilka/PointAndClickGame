//Menu Scene ===Start====
class LockDelete extends Component
{
  int _level;
  public LockDelete(int pLevel)
  {
    _level = pLevel;
  }
  
  @Override
  void onAdd()
  {
    println("add");
    if(SceneManager != null && SceneManager.CurrentFinishedLvls > _level)
    {
      GameObject.DeleteFlag = true;
    }
  }

}
public class LevelButton extends Interactable
{
  SceneName _sceneToTransition;
  int _level;
  public LevelButton(SceneName pSceneName, int pLevel)
  {
     _sceneToTransition = pSceneName; 
     _level = pLevel;
  }
  public void interact()
  {
    if(SceneManager.CurrentFinishedLvls > _level)
    {
      SceneManager.TransitionToState(_sceneToTransition);

    }else{
      println("nah uh uh, finish level 1 first");
    }
  }
}
