import java.util.HashMap;
import processing.sound.*;
import java.io.*;
import ddf.minim.*;

public class AudioLoader
{
  Minim minim;
  AudioPlayer player;
 private FilenameFilter txtFilter = new FilenameFilter() 
  {
    boolean accept(File dir, String name) 
    {
      var lowerCaseName = name.toLowerCase();
      return lowerCaseName.endsWith(".wav") || lowerCaseName.endsWith(".mp3");
    }
  };
  String _path;
  
  public AudioLoader(PointAndClickGame sketch, String pPath)
  {
    _path = pPath;
    minim = new Minim(sketch);
    
  }
  public HashMap<String,AudioPlayer > LoadAndGetAudio()
  {
    File Folder = new java.io.File(_path);
    
    HashMap<String,AudioPlayer> audio = new HashMap<String,AudioPlayer>();
    if (Folder.isDirectory() ) 
    {
      for(var audioName : Folder.list(txtFilter))
      {
        String fullPath = _path + File.separator + audioName;
        player = minim.loadFile(fullPath);
        audio.put(audioName,player);
        println("Loaded audio: " + audioName);
      }
    } 
    return audio;
  }  
}
