import java.util.ArrayList;
import java.util.HashMap;
 
class IngredientMapCreator
{
  HashMap<String, Integer> mIngredientMap = new HashMap<String, Integer>();

  void addRecipe(Recipe recipe)
  {
    for (String stuff: recipe.allIngredients())
    {
      if (mIngredientMap.containsKey(stuff))
        mIngredientMap.put(stuff, mIngredientMap.get(stuff) + 1);
      else
        mIngredientMap.put(stuff, 1);
    }
  }
 
  void show()
  {
    for (Entry entry : mIngredientMap.entrySet())
    {
      String out = entry.getKey() + " has " + entry.getValue() + " occurrences";
      println(out);
    }
  }
 
  HashMap<String, Integer> allIngredients()
  {
    return mIngredientMap;
  }
 }
