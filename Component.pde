public abstract class Component
{
   public GameObject GameObject;

   
   public Component(GameObject pGameObject)
   {
     GameObject = pGameObject;
     //onAdd();
   }
   public Component()
   {
   }
   void onAdd()
   {
     
     
   }
   public void update()
   {
    
   }
}
