public class GameObject
{
  
  //constructors
  public GameObject(String pName)
  {
    Name = pName;
    _components.add(new Transform(this, new PVector(0,0)));
  }  
  public GameObject(String pName, PVector pPosition)
  {
    Name = pName;
    _components.add(new Transform(this, pPosition));
  }
  public GameObject(String pName, PVector pPosition, Component... pComponents)
  {
    Name = pName;
    _components.add(new Transform(this, pPosition));
    InitComponents( pComponents);

  }

  public GameObject(String pName, Transform pTransform, Component... pComponents) 
  {
    Name = pName;
    pTransform.GameObject  = this;
    _components.add(pTransform);
    
    InitComponents( pComponents);

  }
  public GameObject(String pName, PVector pPosition, PVector pScale, Component... pComponents)
  {
    Name = pName;
    _components.add(new Transform(this, pPosition, pScale));
    InitComponents( pComponents);
  }
  public GameObject(String pName, int pLayer, PVector pPosition)
  {
    Name = pName;
    Layer = pLayer;
    _components.add(new Transform(this, pPosition));
  }
  public GameObject(String pName, int pLayer, PVector pPosition, Component... pComponents)
  {
    Name = pName;
    Layer = pLayer;
    _components.add(new Transform(this, pPosition));
    InitComponents( pComponents);

  }

  public GameObject(String pName, int pLayer, Transform pTransform, Component... pComponents) 
  {
    Name = pName;
    Layer = pLayer;
    pTransform.GameObject  = this;
    _components.add(pTransform);
    
    InitComponents( pComponents);

  }

  public GameObject(String pName, int pLayer, PVector pPosition, PVector pScale, Component... pComponents)
  {
    Name = pName;
    Layer = pLayer;
    _components.add(new Transform(this, pPosition, pScale));
    InitComponents( pComponents);
    
  }

  //end of constructors
  
  ArrayList<Component> _components =new ArrayList<Component>();
  public Transform getTransform() { return (Transform)_components.get(0);}
  public int Layer; 
  public boolean DeleteFlag;
  public boolean Active = true;
  public String Name;
  
  private void InitComponents(Component[] pComponents)
  {
    for(var c : pComponents)
    {
      _components.add(c);
      c.GameObject = this;
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
    if(!Active) return;
    for(var c : _components)
    {
      if(c.enabled)
        c.update();
    
    }
  }
  public void onRemove()
  {
    for(var c : _components)
      c.onRemove();
  }
  public void onStart()
  {
    for(var c : _components)
    {
      c.onAdd();
    }  
  }
  public void onExit()
  {
    for(var c : _components)
      c.onExit();
  }
}
