public abstract class Scene extends State<SceneName>
{
  private ArrayList<GameObject> _objects = new ArrayList<GameObject>();
  SceneManager _context;
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
          obj.update();      
      }
    }
      
      
  }
  @Override
  public void onEnter()
  {
    for(var o : _objects)
    {
      o.onStart();
    }

  }
  @Override
  public void onExit()
  {
    for(var o : _objects)
    {
      o.onExit();
    }
  }
  
}



public class MenuScene extends Scene
{
  public MenuScene(SceneName pKey, StateManager pContext, GameObject... pObjects)
  {
    super(pKey, pContext, pObjects);
  }
  public SceneName getNextState()
  { 
    if(_context.GrabbedTeddy)
          return SceneName.Menu;

    return SceneName.Menu;
  }
}

public class ChildhoodScene extends Scene
{
  public ChildhoodScene(SceneName pKey, StateManager pContext, GameObject... pObjects)
  {
    super(pKey, pContext, pObjects);
  }
  public SceneName getNextState()
  { 
    return SceneName.ChildhoodRoom;
  }
}
public class PartyScene extends Scene
{
  public PartyScene(SceneName pKey, StateManager pContext, GameObject... pObjects)
  {
    super(pKey, pContext, pObjects);
  }
  public SceneName getNextState()
  { 
    //NOT IMPLEMENTED

    return SceneName.Party;
  }
}
public class ParkScene extends Scene
{
  public ParkScene(SceneName pKey, StateManager pContext, GameObject... pObjects)
  {
    super(pKey, pContext, pObjects);
  }
  public SceneName getNextState()
  { 
     //NOT IMPLEMENTED

    return SceneName.Park;
  }
}
public class MiniGameScene extends Scene
{
public MiniGameScene(SceneName pKey, StateManager pContext, GameObject... pObjects)
  {
    super(pKey, pContext, pObjects);
  }
  public SceneName getNextState()
  { 
     //NOT IMPLEMENTED

    return StateKey;
  }
}
