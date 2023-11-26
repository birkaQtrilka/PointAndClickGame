import java.io.*;
import java.util.HashMap;


public class ImageLoader
{
  private FilenameFilter txtFilter = new FilenameFilter() 
  {
    boolean accept(File dir, String name) 
    {
      var lowerCaseName = name.toLowerCase();
      return lowerCaseName.endsWith(".jpeg") || lowerCaseName.endsWith(".png") || lowerCaseName.endsWith(".jpg");
    }
  };
  String _path;
  
  public ImageLoader(String pPath)
  {
    _path = pPath;
  }
  public HashMap<String,PImage> LoadAndGetImages()
  {
    File Folder = new java.io.File(_path);
    HashMap<String,PImage> images = new HashMap<String,PImage>();
    if (Folder.isDirectory() ) 
    {
      for(var imageName : Folder.list(txtFilter))
      {
        images.put(imageName,loadImage(imageName));
      }
    } 
    return images;
  }
  public HashMap<String, PImage[]> LoadAndGetSpriteSheets()
  {
    HashMap<String, PImage[]> map = new HashMap<String, PImage[]>();
    
    for(Map.Entry<String, PImage> entry : Images.entrySet())
    {
      String name = entry.getKey();
      if(!name.endsWith("_ss.png")) continue;
      
      //getting the rows and columns of sprite sheet
      int index = name.indexOf("_");
      String columns = "";
      String rows = "";
      boolean doRows = false;
      while(name.charAt(++index) != '.')
      {
        if(name.charAt(index) == '_')
        {
          if(doRows) break;
          doRows = true;
          continue;
        }
        if(doRows)
          rows += name.charAt(index);
        else
          columns += name.charAt(index);
      }
      map.put(name, createSpriteSheet(entry.getValue(), Integer.parseInt(columns),Integer.parseInt(rows) ) );
     
    }
    return map;
  }
  public PImage[] createSpriteSheet(PImage pSourceImage, int pColumns, int pRows)
  {
    var sprites = new PImage[pColumns*pRows];

    int spriteHeight = pSourceImage.height / pRows;
    int spriteWidth = pSourceImage.width / pColumns;
    
    for(int y = 0; y < pRows; y++)
      for(int x = 0; x < pColumns; x++)
      {
        PImage newImg = createImage(spriteWidth, spriteHeight, ARGB); 
        newImg.copy(pSourceImage,x*spriteWidth, y*spriteHeight, spriteWidth, spriteHeight, 0,0, spriteWidth ,spriteHeight );
        sprites[pColumns * y + x] = newImg;
      }
  
    return sprites;
  }
}
