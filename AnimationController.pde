public enum AnimationName
{
    ToddlerWalk,
    ToddlerIdle
}

public class AnimationController extends StateManager<AnimationName>//another state machine
{  
  //context variables
  public ImageRenderer ImageRenderer;
  public boolean IsWalking;
  
  
  public AnimationController(AnimationName pEntryState)
  {
    super(pEntryState);

    States = Map.of(
      AnimationName.ToddlerWalk, new WalkingAnimation(AnimationName.ToddlerWalk,this, SpriteSheets.get("toddlerWalk_6_1_ss.png"), true, 6),
      AnimationName.ToddlerIdle, new IdleAnimation(AnimationName.ToddlerIdle, this, SpriteSheets.get("toddlerWalk_6_1_ss.png"), true, 6, Images.get("toddlerStanding.png"))
    );
    
  }
  @Override
  void onAdd()
  {
    ImageRenderer = GameObject.GetComponent(ImageRenderer.class);

    super.onAdd();
  }

}






public abstract class Animation extends State<AnimationName>
{
   protected PImage[] spriteSheet;
   protected AnimationController context;

   boolean _looping;
   int _spriteIndex = 0;
   int _frameInterval;
   int _nextTime;
   int _animationEnterTime;
   public Animation(AnimationName pKey, StateManager pContext, PImage[] pSpriteSheet, boolean pIsLooping, int pFramesPerSecond)
   {
     super(pKey, pContext);
     spriteSheet = pSpriteSheet;
     _looping = pIsLooping;
     _frameInterval = 1000 / pFramesPerSecond;
   }
   @Override
   public void SetConcreteStateManager(StateManager abstractManager)
   {
     context = (AnimationController)abstractManager;
   }
   
   public abstract AnimationName getNextState();

   @Override
   public void onEnter()
   {
     _spriteIndex = 0;
     _animationEnterTime = millis();
     _nextTime = 0;
   }
   @Override
   public void update()
   {
     if(_looping && _spriteIndex >= spriteSheet.length)
       _spriteIndex = 0;
       //println();

     if(millis() - _animationEnterTime > _nextTime && _looping)
     {
       context.ImageRenderer.Image = spriteSheet[_spriteIndex++];
       _nextTime += _frameInterval;
     } else if(!_looping)//maybe make a sepparate looping animation class
     {
         context.ImageRenderer.Image = spriteSheet[_spriteIndex];
        if(_spriteIndex < spriteSheet.length)
          _spriteIndex++;
     }
   }
}







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
    
  }
}




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
