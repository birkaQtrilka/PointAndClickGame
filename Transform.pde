public class Transform extends Component
{
  public PVector Position;
  public PVector Scale;//this is not accurate, I'm too lazy to think of how to implement transform properly
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
  @Override
  public void update()
  {
    translate(Position.x, Position.y);
    scale(Scale.x, Scale.y);

  }
}
