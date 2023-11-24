public class IdleAnimation extends Animation
{
  PImage _standingImage;
  public IdleAnimation(AnimationName pKey,StateManager pContext, PImage[] pSpriteSheet, boolean pIsLooping, int pFramesPerSecond, PImage pStandingImage)
  {
    super( pKey, pContext, pSpriteSheet, pIsLooping, pFramesPerSecond);
    _standingImage = pStandingImage;
  }
  @Override
  public void onEnter()
  {
    context.ImageRenderer.Image = _standingImage;
  }
  public AnimationName getNextState()
  {
    if(context.IsWalking)
      return AnimationName.ToddlerWalk;
    return AnimationName.ToddlerIdle;
  }
  @Override void onExit(){}
  
  @Override
  public void update()
  {
    //super.update();
    //transitionCheck
    
  }
}
