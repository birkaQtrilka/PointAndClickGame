public class Transform extends Component
{
  public PVector Position;
  public PVector Scale;
  public PVector WorldPos = new PVector(0,0);
  public PVector WorldScale = new PVector(1,1);
  
  public Transform parent;
  public ArrayList<Transform> _children = new ArrayList<Transform>();
  public Transform(GameObject pGameObject, PVector pPosition)
  {
    super(pGameObject);
    
    Position = pPosition;
    Scale = new PVector(1,1);
  }
  public Transform(GameObject pGameObject, PVector pPosition, PVector pScale)
  {
    super(pGameObject);
    
    Position = pPosition;
    Scale = pScale;
  }
  public Transform(PVector pPosition, GameObject... pChildren)
  {
    super(null);
    Position = pPosition;
    Scale = new PVector(1,1);
    for(var c : pChildren)
    {
      var t = c.getTransform();
      _children.add(t);
      t.parent = this;
    }
  }
  
  
  
  public Transform(PVector pPosition, PVector pScale, GameObject... pChildren)
  {
    super(null);
    Position = pPosition;
    Scale = pScale;
    for(var c : pChildren)
    {
      var t = c.getTransform();
      _children.add(t);
      t.parent = this;
    }
  }
  
  
  
  public Transform getRoot()
  {
    if(parent == null)
      return this;
    return parent.getRoot();
  }

  private PVector getWorldPos(PVector pCurrPos)
  {
    
    if(parent == null)
    {
      pCurrPos.x = (pCurrPos.x + Position.x);
      pCurrPos.y = (pCurrPos.y + Position.y);
      return pCurrPos;
    }
    pCurrPos.x = (pCurrPos.x + Position.x) * parent.Scale.x;
    pCurrPos.y = (pCurrPos.y + Position.y) * parent.Scale.y;
    
    parent.getWorldPos(pCurrPos);
    
    return pCurrPos;
  }

  private PVector getWorldScale(PVector pCurrScale)
  {
    pCurrScale.x = pCurrScale.x * Scale.x;
    pCurrScale.y = pCurrScale.y * Scale.y;
    if(parent == null)
      return pCurrScale;
    
    parent.getWorldScale(pCurrScale);
    
    return pCurrScale;
  }
  @Override
  public void update()
  {
    //reset vectors
    WorldScale.x = 1;
    WorldScale.y = 1;
    WorldPos.x = 0;
    WorldPos.y = 0;
    
    WorldScale = getWorldScale(WorldScale);
    WorldPos = getWorldPos(WorldPos);
    
    if(_children.size() == 0) return;

    for(var c : _children)
      c.GameObject.update();
     
  }
  @Override
  public void onAdd()
  {
    if(_children.size() == 0) return;

    for(var c : _children)
      c.GameObject.onStart();
  }
  @Override
  public void onExit()
  {
    if(_children.size() == 0) return;

    for(var c : _children)
      c.GameObject.onExit();
  }
  @Override
  public void onRemove()
  {
    for(var c : _children)
      c.GameObject.onRemove();
  }
}
