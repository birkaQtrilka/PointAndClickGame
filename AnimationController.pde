public enum AnimationName
{
    ToddlerWalk,
    ToddlerIdle,
    
    ChildWalk,
    ChildIdle,
    
    TeenWalk,
    TeenIdle,
    
    ArmJumpScare
}

public class AnimationController extends StateManager<AnimationName>//another state machine
{  
  //context variables
  public ImageRenderer ImageRenderer;
  public boolean IsWalking;
  public boolean finishedJumpScare;
  
  public AnimationController(AnimationName pEntryState)
  {
    super(pEntryState);
    PImage[] jumpscareFrames = ImageLoader.createSpriteArray("bush scene 1.png","bush scene 2.png","bush scene 3.png");
    States = Map.of(
      AnimationName.ToddlerWalk, new WalkingAnimation(AnimationName.ToddlerWalk,this, SpriteSheets.get("toddlerWalk_6_1_ss.png"), true, 6, AnimationName.ToddlerIdle),
      AnimationName.ToddlerIdle, new IdleAnimation(AnimationName.ToddlerIdle, this, SpriteSheets.get("toddlerWalk_6_1_ss.png"), true, 6, Images.get("toddlerStanding.png"), AnimationName.ToddlerWalk),
      AnimationName.ChildWalk, new IdleAnimation(AnimationName.ChildWalk, this, SpriteSheets.get("SashaChildWalking_8_1_ss.png"), true, 6, Images.get("childStanding.png"),AnimationName.ChildIdle),
      AnimationName.ChildIdle, new WalkingAnimation(AnimationName.ChildIdle, this, SpriteSheets.get("SashaChildWalking_8_1_ss.png"), true, 6,AnimationName.ChildWalk),
      AnimationName.TeenWalk, new IdleAnimation(AnimationName.TeenWalk, this, SpriteSheets.get("SashaChildWalking_8_1_ss.png"), true, 6, Images.get("childStanding.png"),AnimationName.TeenIdle),
      AnimationName.TeenIdle, new WalkingAnimation(AnimationName.TeenIdle, this, SpriteSheets.get("SashaChildWalking_8_1_ss.png"), true, 6,AnimationName.TeenWalk),
      AnimationName.ArmJumpScare, new Cutscene(AnimationName.ArmJumpScare, this, jumpscareFrames, false, 3)
    );//create class cutscene that inherits from animation 
    
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
     } else if(!_looping)
     {
         context.ImageRenderer.Image = spriteSheet[_spriteIndex];
        if(_spriteIndex < spriteSheet.length)
          _spriteIndex++;
     }
   }
}



public class Cutscene extends Animation
{
  public Cutscene(AnimationName pKey,StateManager pContext, PImage[] pSpriteSheet, boolean pIsLooping, int pFramesPerSecond)
  {
    super(pKey, pContext, pSpriteSheet, pIsLooping, pFramesPerSecond);
  }
  public AnimationName getNextState()
  {
      return StateKey;
  }
  boolean _startedAnim;
  @Override
  void onEnter()
  {
    _startedAnim = false;
  }
  @Override
  public void update()
  {
     if(!_startedAnim)
     {
       _spriteIndex = 0;
       _animationEnterTime = millis();
       _nextTime = 0;
       _startedAnim = true;
     }
     if(millis() - _animationEnterTime > _nextTime && _spriteIndex < spriteSheet.length)
     {
       context.ImageRenderer.Image = spriteSheet[_spriteIndex++];
       _nextTime += _frameInterval;
       if(_spriteIndex == spriteSheet.length)
         context.finishedJumpScare = true;
     } 
   
  }
  @Override void onExit(){}
}




public class IdleAnimation extends Animation
{
  PImage _standingImage;
  AnimationName _walkAnim;
  public IdleAnimation(AnimationName pKey,StateManager pContext, PImage[] pSpriteSheet, boolean pIsLooping, int pFramesPerSecond, PImage pStandingImage, AnimationName pWalkAnim)
  {
    super( pKey, pContext, pSpriteSheet, pIsLooping, pFramesPerSecond);
    _walkAnim=pWalkAnim;
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
      return _walkAnim;
    return StateKey;
  }
  @Override void onExit(){}
  
  @Override
  public void update()
  {
    
  }
}




public class WalkingAnimation extends Animation
{
  AnimationName _idleAnim;
  public WalkingAnimation(AnimationName pKey,StateManager pContext, PImage[] pSpriteSheet, boolean pIsLooping, int pFramesPerSecond, AnimationName pIdleAnim)
  {
    super(pKey, pContext, pSpriteSheet, pIsLooping, pFramesPerSecond);
    _idleAnim = pIdleAnim;
  }
  
  public AnimationName getNextState()
  {
    if(context.IsWalking)
      return StateKey;
    return _idleAnim;
  }
  @Override void onExit(){}
  
}
