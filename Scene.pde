public class Scene extends State<SceneName>
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
  public SceneName getNextState()
  { 
    /*
      if(inventory.item == teddyBear)
        return SceneName.OddOneOutMinigame2
      else 
        return SceneName.ChildhoodRoom
    */
    //if(mousePressed)
    //  return SceneName.Party;
    return SceneName.ChildhoodRoom;
  }
}
