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
