public enum AnimationName
{
    ToddlerWalk,
    Boom
}

public class AnimationController extends StateManager//another state machine
{
  public Animation BoomAnim;
  public Animation ToddlerWalkAnim;
  public Map<AnimationName, Animation> animations = Map.of(
    AnimationName.ToddlerWalk, new Animation(this, SpriteSheets.get("toddlerWalk_6_1_ss.png"), true, 6),
    AnimationName.Boom, new Animation(this, SpriteSheets.get("booom_8_8_ss.png"), true, 24)
  );
  
  
  Animation _currentAnimation;
  public ImageRenderer ImageRenderer;
  
  public AnimationController(AnimationName pAnimationName)
  {
    changeState(animations.get(pAnimationName));
  }
  @Override
  void onAdd()
  {
    ImageRenderer = GameObject.GetComponent(ImageRenderer.class);
  }
  @Override
  public void update()
  {
    if(_currentAnimation != null)
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
