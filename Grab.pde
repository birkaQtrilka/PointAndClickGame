public class Grab extends Component
{
  Player _player;
  @Override 
  public void onAdd()
  {
    _player = SceneManager.GetObjectInScene("player").GetComponent(Player.class);
    _player.onCollide.bind(this, "OnCollision");
  }

  void OnCollision(Shape shape)
  {;
     if(Input.mousePressedThisFrame() && shape.IsColliding(MousePos))
     {
       var interactable = shape.GameObject.GetComponent(Interactable.class);
       if(interactable == null)return;
       interactable.interact();
     }
  }
  @Override
  void onExit()
  {
      _player.onCollide.unbind(this, "OnCollision");
  }
}
