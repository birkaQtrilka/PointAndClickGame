import processing.core.PApplet;
import processing.event.*;
import java.awt.*;
import java.util.HashMap;
import java.util.ArrayList;
 
//So yeah, one can always take it too far .... ;)
 
public class Input {
  boolean isVerbose = false;
  private static Input instance;                        //we need this reference to delegate keyEvents to
 
  private HashMap<Integer,Integer> keyTable     = new HashMap<Integer,Integer>();
  private HashMap<Integer,Integer> keyCodeTable = new HashMap<Integer,Integer>();
  
  
  
  private int startOfFrame = 0;
  private PApplet applet;
  final int START_KEY_PRESS    = 0;
  final int START_KEY_RELEASE  = -1;
  final int REMOVE_KEY_RELEASE = -2;
  
  static int mouseClickTimer;
  static int mouseUpTimer;
  static boolean mousePress;
  
  public static void initialize( PApplet pApplet ) 
  {
    //create instance so that we can delegate events to it
    if ( instance == null ) 
    {
        instance = new Input();
        instance.applet = pApplet;
        pApplet.registerMethod( "keyEvent", instance );
        pApplet.registerMethod( "pre",      instance );
        pApplet.registerMethod( "mouseEvent", instance );
    }
  }
 
   public void pre() 
   {
      //applet.println( "pre" );
      startOfFrame = applet.millis();
      preFrameDrawReset( keyTable     );
      preFrameDrawReset( keyCodeTable );
      
      if(mouseClickTimer == 1)
        mouseClickTimer++;
      else
        mouseClickTimer = 0;
        
      if(mouseUpTimer == 1)
        mouseUpTimer++;
      else
        mouseUpTimer = 0;
   }

 
  public void preFrameDrawReset( HashMap<Integer, Integer> table ) 
  {
      ArrayList<Integer> toRemove = new ArrayList<Integer>();
      
      for ( HashMap.Entry<Integer,Integer> entry : table.entrySet() ) 
      {
          switch ( entry.getValue() ) 
          {
              case  START_KEY_PRESS   : entry.setValue( startOfFrame ); break;
              case  START_KEY_RELEASE : entry.setValue( -2 );           break;
              case REMOVE_KEY_RELEASE : toRemove.add( entry.getKey() ); break; // not really needed
          }
      }
      table.keySet().removeAll( toRemove ); 
  }
  public void keyEvent( KeyEvent event ) {
      int key = event.getKey();
      int action =  event.getAction();
      if ( key == PApplet.CODED ) {
          keyEvent( keyCodeTable, event.getKeyCode(), action );
      } else {
          keyEvent( keyTable, key, action );
      }
  }
  public void mouseEvent(MouseEvent e) {
    switch(e.getAction()) {
    case MouseEvent.PRESS:
      mousePress();
      break;
    case MouseEvent.RELEASE:
      mouseRelease();
      break;

      // Repeat for other event types
    } 
  }

  private void keyEvent( HashMap<Integer,Integer> table, int key, int action ) {
      if ( action == KeyEvent.PRESS ) 
      {
          keyPressed( table, key );
      } 
      else if ( action == KeyEvent.RELEASE ) 
      {
          keyReleased( table, key );
      } 
      else  if ( action != KeyEvent.TYPE ) 
      { // key repeat??
         if ( isVerbose ) applet.println( "Warning, unknown action", action,  "for key", key );
      }
  }
  private void mousePress()
  {
      mouseClickTimer++;
      mousePress = true;
  }
  private void mouseRelease()
  {
    mouseUpTimer++;
    mousePress = false;
  }

  public static boolean mousePressedThisFrame()
  {
     return mouseClickTimer > 0;
  }
  public static boolean mouseUpThisFrame()
  {
    return mouseUpTimer > 0;
  }
  public static boolean mouseDown()
  {
      return mousePress;
  }
  private void keyPressed( HashMap<Integer,Integer> table, int key ) 
  {
      if ( ! table.containsKey( key ) ) 
      {
         if ( isVerbose ) 
           applet.println( "KeyPressed ",key,  "at time", startOfFrame );
         table.put( key, startOfFrame );  // startOfFrame can be zero, set pre draw
      }
  }
 
  private void keyReleased( HashMap<Integer,Integer> table, int key ) 
  {
      if ( ! table.containsKey( key ) ) 
      {
         if ( isVerbose ) 
           applet.println( "Warning, keyReleased for", key, "without keyPressed" );
      }
      if ( isVerbose ) 
        applet.println( "KeyReleased ", key, "at time", startOfFrame );
      table.put( key, -1 );
  }
  private static boolean isKeyDown( HashMap<Integer,Integer> table, int key ) {
      Integer value = table.get( key );
      return value != null && value >= 0;
  }
  private boolean isKeyPressedThisFrame( HashMap<Integer,Integer> table, int key ) {
      Integer value = table.get( key );
      if ( value != null && isVerbose ) applet.println( "KeyPressed ", key, "at time", value, startOfFrame );
 
      return value != null && value <= startOfFrame && value >= 0;
  }
  private boolean isKeyReleasedThisFrame( HashMap<Integer,Integer> table, int key ) {
      Integer value = table.get( key );
      return value != null && value < 0;
  }
  
  
  public static boolean isKeyDown( char keyValue ) 
  {
      assert instance != null : "instance is null, did you call initialize()?";
      return instance.isKeyDown( instance.keyTable, keyValue );
  }
 
  public static boolean isCodedKeyDown( int keyValue ) 
  {
      assert instance != null : "instance is null, did you call initialize()?";
      return instance.isKeyDown( instance.keyCodeTable, keyValue );
  }
 
  public static boolean isKeyPressedThisFrame( char key ) {
      assert instance != null : "instance is null, did you call initialize()?";
      return instance.isKeyPressedThisFrame( instance.keyTable, key );     
  }
 
  public static boolean isCodedKeyPressedThisFrame( int key ) {
      assert instance != null : "instance is null, did you call initialize()?";
      return instance.isKeyPressedThisFrame( instance.keyCodeTable, key );
  }
 
  public static boolean isKeyReleasedThisFrame( char keyValue ) {
      assert instance != null : "instance is null, did you call initialize()?";
      return instance.isKeyReleasedThisFrame( instance.keyTable, keyValue );     
  }
 
  public static boolean isCodedKeyReleasedThisFrame( int keyValue ) {
      assert instance != null : "instance is null, did you call initialize()?";
      return instance.isKeyReleasedThisFrame( instance.keyCodeTable, keyValue );
  }
 

}
