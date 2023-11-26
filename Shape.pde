public abstract class Shape extends Component
{
  protected Transform transform;

  @Override
  public void onAdd()
  {
    transform = GameObject.getTransform();
    println("shape");
  }

  public abstract boolean IsColliding(PVector point);
}
