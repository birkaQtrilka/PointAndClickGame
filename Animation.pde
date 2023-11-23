public class Animation extends State
{
   PImage[] _spriteSheet;
   boolean _looping;
   int _spriteIndex = 0;
   AnimationController context;
   
   public Animation(StateManager pContext, PImage[] pSpriteSheet, boolean pIsLooping)
   {
     super(pContext);
     _spriteSheet = pSpriteSheet;
     
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
     context.ImageRenderer.Image = _spriteSheet[_spriteIndex++];
   }
}
