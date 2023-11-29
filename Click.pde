public class Button extends Component
{
  Shape _collider;
  
  @Override 
  public void onAdd()
  {
    _collider = GameObject.GetComponent(Shape.class);
  }

  public void update()
  { 
  
     if(Input.mousePressedThisFrame() && _collider.IsColliding(MousePos))
     {
       var interactable = GameObject.GetComponent(Interactable.class);
       if(interactable == null)return;
       interactable.interact();
     }
  }
  //on remove unbind
}
