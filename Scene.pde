public class Scene extends State<SceneName>
{
  private ArrayList<GameObject> _objects = new ArrayList<GameObject>();
  SceneManager _context;
  boolean changingScene;
  public Scene(SceneName pKey, StateManager pContext, GameObject... pObjects)//initialize and enter objects
  {
    super(pKey, pContext);
    _objects = new ArrayList<GameObject>( Arrays.asList(pObjects)) ;
  }
  @Override
  public void SetConcreteStateManager(StateManager abstractManager){
    _context = (SceneManager)abstractManager;
  }
 

  @Override
  public void update( )
  {
    for(int i = 0; i < _objects.size(); i++)
    {
      var obj = _objects.get(i);
      if(obj.DeleteFlag)
      {
        obj.onRemove();
        _objects.remove(i--);
      }else
      {
        if(!changingScene)
          obj.update();      
      }
    }
      
      
  }
  @Override
  public void onEnter()
  {
    changingScene = true;
    for(var o : _objects)
    {
      o.onStart();
    }
    changingScene = false;
  }
  @Override
  public void onExit()
  {
    changingScene = true;
    for(var o : _objects)
    {
      o.onExit();
    }
    changingScene = false;
  }
  public SceneName getNextState()
  {
    return StateKey;
  }
}
