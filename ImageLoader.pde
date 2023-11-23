import java.io.*;
import java.util.HashMap;


public class ImageLoader
{
  private FilenameFilter txtFilter = new FilenameFilter() 
  {
    boolean accept(File dir, String name) 
    {
      var lowerCaseName = name.toLowerCase();
      return lowerCaseName.endsWith(".jpeg") || lowerCaseName.endsWith(".png");
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
        println(imageName);
        images.put(imageName,loadImage(imageName));
      }
    } 
    return images;
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
