public class PlayerCollisionChecker extends Component//for rectangles only
{
  Rectangle _playerCollider;
  Rectangle _myCollider;
  PVector _myPosition;
  PVector _playerPos;
  boolean IsColliding = false;
  @Override
  public void onAdd()
  { 
    _myCollider = GameObject.GetComponent(Rectangle.class);
    _myPosition = GameObject.getTransform().WorldPos;
    _playerCollider = PlayerInstance.GameObject.GetComponent(Rectangle.class);
    _playerPos = _playerCollider.worldPos;
  }
  @Override//maybe change this when events are implemented
  public void update()
  {
    var dir = _playerPos.x - _myPosition.x;
    dir = dir < 0 ? 1 : -1; 
    PVector checkPoint =  new PVector(_playerPos.x + _playerCollider.worldSize.x / 2 * dir, _myPosition.y); 
    
    IsColliding = _myCollider.IsColliding(checkPoint);
    if(IsColliding) 
    {
      PlayerInstance.onCollide.trigger(_myCollider);
    
    }
  }
}
