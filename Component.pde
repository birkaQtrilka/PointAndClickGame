public abstract class Component
{
   public GameObject GameObject;
   public boolean enabled = true;
   
   public Component(GameObject pGameObject)
   {
     GameObject = pGameObject;
   }
   public Component()
   {
   }
   void onAdd()
   {
   }
   void onRemove()
   {
   }
   public void update()
   {
   }
}
