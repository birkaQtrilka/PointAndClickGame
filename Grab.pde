public class Grab extends Component
{
  @Override 
  public void onAdd()
  {
    PlayerInstance.onCollide.bind(this, "OnCollision");
  }

  void OnCollision(Shape shape)
  {
     if(Input.mousePressedThisFrame() && shape.IsColliding(MousePos))
     {
       var interactable = shape.GameObject.GetComponent(Interactable.class);
       if(interactable == null)return;
       interactable.interact();
     }
  }
  @Override
  void onRemove()
  {
     PlayerInstance.onCollide.unbind(this, "OnCollision");

  }
  //on remove unbind
}
