public abstract class Component
{
   public GameObject GameObject;

   
   public Component(GameObject pGameObject)
   {
     GameObject = pGameObject;
     OnAdd();
   }
   public Component()
   {
   }
   void OnAdd()
   {
     
     
   }
   public void update()
   {
    
   }
}
