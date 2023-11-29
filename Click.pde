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
    //if(_collider == null)
      //    _collider = GameObject.GetComponent(Shape.class);

     if(Input.mousePressedThisFrame() && _collider.IsColliding(MousePos))
     {
       var interactable = GameObject.GetComponent(Interactable.class);
       if(interactable == null)return;
       interactable.interact();
     }
  }
}
