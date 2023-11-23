public abstract class State
{
  public State(StateManager context)
  {
    SetConcreteStateManager(context);
  }
  abstract void SetConcreteStateManager(StateManager abstractManager);
  public abstract void onEnter( );

  public abstract void update( );

  public abstract void onExit( );

}
