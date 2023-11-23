public class PlayerMovement extends Component
{
  int _destinationPoint;
  public float MoveSpeed;
  int _direction;
  Transform _transform;
  
  public PlayerMovement(int pMoveSpeed)
  {
    MoveSpeed = pMoveSpeed;
  }
  @Override 
  public void onAdd()
  {
    _transform = GameObject.getTransform();
  }
  @Override
  public void update()
  {
    PVector position = _transform.Position;
    if(Input.mouseUpThisFrame())
    {
      _destinationPoint = mouseX;
      if(position.x - _destinationPoint > 0)
      {
        _direction = -1;
        if(_transform.Scale.x > 0)
          _transform.Scale.x *= -1;
      }
      else
      {
        if(_transform.Scale.x < 0)
          _transform.Scale.x *= -1;
        _direction = 1;
      }
    }
    if(!isInRange(position.x))
      position.x += MoveSpeed * _direction;
  }
  boolean isInRange(float currPosX)
  {
    return abs(currPosX - _destinationPoint) <= MoveSpeed;
  }
}
