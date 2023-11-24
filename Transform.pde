public class Transform extends Component
{
  public PVector Position;
  public PVector Scale;//this is not accurate, I'm too lazy to think of how to implement transform properly
  public Transform parent;
  public ArrayList<Transform> _children;
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
  @Override
  public void update()//if child, you don't have connection to update loop
  {
    if(parent != null) return;
    
    for(var c : _children)
      c.update();
    
    translate(Position.x, Position.y);
    scale(Scale.x, Scale.y);

  }
}
