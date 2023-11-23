public class Animation extends State
{
   PImage[] _spriteSheet;
   boolean _looping;
   int _spriteIndex = 0;
   AnimationController context;
   int _frameInterval;
   int _nextTime;
   
   public Animation(StateManager pContext, PImage[] pSpriteSheet, boolean pIsLooping, int pFramesPerSecond)
   {
     super(pContext);
     _spriteSheet = pSpriteSheet;
     _looping = pIsLooping;
     _frameInterval = 1000 / pFramesPerSecond;
   }
   @Override
   public void SetConcreteStateManager(StateManager abstractManager)
   {
     context = (AnimationController)abstractManager;
   }
   @Override
   public void onExit()
   {
   }
   @Override
   public void onEnter()
   {
     _spriteIndex = 0;
   }
   @Override
   public void update()
   {
     if(_looping && _spriteIndex >= _spriteSheet.length)
       _spriteIndex = 0;
       //println();
     if(millis() - GameStartTime > _nextTime && _looping)
     {
       context.ImageRenderer.Image = _spriteSheet[_spriteIndex++];
       _nextTime += _frameInterval;
     } else if(!_looping)//maybe make a sepparate looping animation class
     {
         context.ImageRenderer.Image = _spriteSheet[_spriteIndex];
        if(_spriteIndex < _spriteSheet.length)
          _spriteIndex++;
     }
   }
}
