public class Click extends Component
{
  Shape _collider;
  
  @Override 
  public void onAdd()
  {
    _collider = GameObject.GetComponent(Shape.class);
  }

  public void update()
  { 
  if(_collider.IsColliding(MousePos) ){}
  
     if(Input.mousePressedThisFrame() && _collider.IsColliding(MousePos))
     {
       var interactable = _collider.GameObject.GetComponent(Interactable.class);
       if(interactable == null)return;
       interactable.interact();
       println("click");
     }
  }
  //on remove unbind
}
