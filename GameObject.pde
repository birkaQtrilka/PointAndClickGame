public class GameObject
{
  ArrayList<Component> _components =new ArrayList<Component>();
  public Transform getTransform() { return (Transform)_components.get(0);}
  //constructors
  public GameObject()
  {
    _components.add(new Transform(this, new PVector(0,0)));
  }  
  public GameObject(PVector pPosition)
  {
    _components.add(new Transform(this, pPosition));
  }
  public GameObject(PVector pPosition, Component... pComponents)
  {
    _components.add(new Transform(this, pPosition));
    InitComponents( pComponents);

  }

  public GameObject(Transform pTransform, Component... pComponents) 
  {
    pTransform.GameObject  = this;
    _components.add(pTransform);
    
    InitComponents( pComponents);

  }
  public GameObject(PVector pPosition, PVector pScale, Component... pComponents)
  {
    _components.add(new Transform(this, pPosition, pScale));
    InitComponents( pComponents); //<>//
  } //<>//
  //end of constructors
  private void InitComponents(Component[] pComponents)
  {
    for(var c : pComponents)
    {
      _components.add(c);
      c.GameObject = this;
    }
    for(var c : pComponents)
    {
      c.onAdd();
    }  
  }
  public void AddComponent(Component pComponent) 
  {
    _components.add(pComponent);
    pComponent.GameObject = this;
    pComponent.onAdd();
  }
  public <T extends Component>  T GetComponent(Class<T> type)
  {
    for(var c : _components)
    {
      if(type.isInstance(c))
        return (T)c;

    }
    return null;
  }
  void update()
  {
    pushMatrix();
    for(var c : _components)//do the scaling here?
      c.update();
    popMatrix();
  }
}
