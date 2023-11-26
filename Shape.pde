public abstract class Shape extends Component
{
  protected Transform transform;

  @Override
  public void onAdd()
  {
    transform = GameObject.getTransform();
  }

  public abstract boolean IsColliding(PVector point);
}
