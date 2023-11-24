public class PlayerMovement extends Component
{
  float _destinationPoint;
  public float MoveSpeed;
  int _direction;
  Transform _transform;
  AnimationController _animController;
  
  public PlayerMovement(int pMoveSpeed)
  {
    MoveSpeed = pMoveSpeed;
  }
  @Override 
  public void onAdd()
  {
    _transform = GameObject.getTransform();
    _animController = GameObject.GetComponent(AnimationController.class);
    _destinationPoint = _transform.Position.x;
  }
  @Override
  public void update()
  {
    PVector position = _transform.Position;
    if(Input.mouseUpThisFrame())
    {
      getDirection(position);
    }
    if(!isInRange(position.x))
    {
      _animController.IsWalking = true;
      position.x += MoveSpeed * _direction;
      
    }
    else
    {
       _animController.IsWalking = false;

    }
  }
  void getDirection(PVector position)
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
  boolean isInRange(float pCurrPosX)
  {
    return abs(pCurrPosX - _destinationPoint) <= MoveSpeed;
  }
}
