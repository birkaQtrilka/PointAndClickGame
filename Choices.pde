class TeddyChoice extends Component
{
  @Override 
  void update()
  {
    if(SceneManager != null && !SceneManager.GrabbedTeddy){
          GameObject.DeleteFlag = true;
    }
  }
}
