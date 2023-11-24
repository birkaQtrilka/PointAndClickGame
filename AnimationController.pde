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
