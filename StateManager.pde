public abstract class StateManager<EState extends Enum> extends Component
{
  protected Map<EState, State> States;//initializeHere?
  protected State<EState> CurrentState;
  protected boolean isTransitioningState = false;
  
  protected EState entryState;
  public StateManager(EState pEntryState)
  {
    entryState = pEntryState;
  }
  //boolean afterAdd;
  @Override
  public void onAdd()
  {
    CurrentState = States.get(entryState);
    CurrentState.onEnter();
  }
  public void update()
  {
    if(isTransitioningState) return;

    EState nextStateKey = CurrentState.getNextState();
    
    if( nextStateKey.equals(CurrentState.StateKey))
      CurrentState.update();
    else 
      TransitionToState(nextStateKey);
  }
  public void TransitionToState(EState pStateKey)
  {
    isTransitioningState = true;
    CurrentState.onExit();
    CurrentState = States.get(pStateKey);
    CurrentState.onEnter();
    isTransitioningState = false;
  }
}






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
