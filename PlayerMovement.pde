public class PlayerMovement extends Component
{
  int _destinationPoint;
  public float MoveSpeed;
  int _direction;
  
  public PlayerMovement(int pMoveSpeed)
  {
    MoveSpeed = pMoveSpeed;
  }
  @Override
  public void update()
  {
    PVector position = GameObject.getTransform().Position;
    if(Input.mouseUpThisFrame())
    {
      _destinationPoint = mouseX;
      if(position.x - _destinationPoint > 0)
        _direction = -1;
      else
        _direction = 1;
    }
    if(!isInRange(position.x))
      position.x += MoveSpeed * _direction;
  }
  boolean isInRange(float currPosX)
  {
    return abs(currPosX - _destinationPoint) <= MoveSpeed;
  }
}
