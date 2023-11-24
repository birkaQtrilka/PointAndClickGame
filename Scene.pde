public class Scene extends State<SceneName>
{
  private ArrayList<GameObject> _objects = new ArrayList<GameObject>();
  SceneManager _context;
  
  public Scene(SceneName pKey, StateManager pContext, ArrayList<GameObject> pObjects)//initialize and enter objects
  {
    super(pKey, pContext);
    _objects = pObjects;
  }
  @Override
  public void SetConcreteStateManager(StateManager abstractManager){
    _context = (SceneManager)abstractManager;
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
  public SceneName getNextState(){ return SceneName.ChildhoodRoom;}
}
