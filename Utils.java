import java.util.*;

public class Utils
{
    static <T> boolean Contains(T[] pCollection, T pElement)
  {
    for(T item : pCollection)
    {
      if(item == pElement)
        return true;
    }
    return false;
  }
}
