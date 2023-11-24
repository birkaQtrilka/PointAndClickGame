public abstract class State<EState extends Enum> 
{
  public EState StateKey;
  public State(EState pKey, StateManager pContext)
  {
    StateKey = pKey;
    SetConcreteStateManager(pContext);
  }

  abstract void SetConcreteStateManager(StateManager abstractManager);
  
  public abstract EState getNextState();//where the transition rules are
  
  public abstract void onEnter( );

  public abstract void update( );

  public abstract void onExit( );

}
