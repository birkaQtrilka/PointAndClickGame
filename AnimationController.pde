public class AnimationController extends StateManager//another state machine
{
  public Animation BoomAnimation;
  
  Animation _currentAnimation;
  public ImageRenderer ImageRenderer;
  public AnimationController()
  {
    BoomAnimation = new Animation(this, );
  }
  @Override
  public void updateState()
  {
    _currentAnimation.update();
  }
  @Override void changeState(State pAnimation)
  {
    if(_currentAnimation != null)
      _currentAnimation.onExit();
    _currentAnimation = (Animation)pAnimation;
    _currentAnimation.onEnter();
  }
}
