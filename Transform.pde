public class Transform extends Component
{
  public PVector Position;
  public PVector Scale;//this is not accurate, I'm too lazy to think of how to implement transform properly
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
  public PVector getWorldPos()
  {
    return getWorldPos(new PVector(0,0));
  }
  private PVector getWorldPos(PVector pCurrPos)
  {
    
    if(parent == null) //<>//
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
  
  @Override
  public void update()//if child, you don't have connection to update loop
  {
    translate(Position.x, Position.y);
    scale(Scale.x, Scale.y);
    if(_children.size() == 0) return;

    for(var c : _children)
      c.GameObject.update();
     

  }
}
