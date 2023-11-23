public class Scene extends State
{
  private ArrayList<GameObject> _objects = new ArrayList<GameObject>();
  SceneManager context;
  
  public Scene(StateManager pSceneManager ,ArrayList<GameObject> pObjects)//initialize and enter objects
  {
    super(pSceneManager);
    _objects = pObjects;
  }
  @Override
  public void SetConcreteStateManager(StateManager abstractManager){
    context = (SceneManager)abstractManager;
  }
  @Override
  public void update( )
  {
    for(var object : _objects)
      object.update();
      
  }
  @Override
  public void onEnter()
  {
  
  }
  @Override
  public void onExit()
  {
  
  }
}
