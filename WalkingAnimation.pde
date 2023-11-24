public class WalkingAnimation extends Animation
{
  public WalkingAnimation(AnimationName pKey,StateManager pContext, PImage[] pSpriteSheet, boolean pIsLooping, int pFramesPerSecond)
  {
    super(pKey, pContext, pSpriteSheet, pIsLooping, pFramesPerSecond);
  }
  
  public AnimationName getNextState()
  {
    if(context.IsWalking)
      return AnimationName.ToddlerWalk;
    return AnimationName.ToddlerIdle;
  }
  @Override void onExit(){}
  
}
