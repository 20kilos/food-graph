import java.util.ArrayList;
import java.util.HashMap;
 
class IngredientMapCreator
{
  void AddRecipe(Recipe recipe)
  {
    for (String stuff: recipe.allIngredients())
    {
      if (mIngredientMap.containsKey(stuff))
        mIngredientMap.put(stuff, mIngredientMap.get(stuff) + 1);
      else
        mIngredientMap.put(stuff, 1);
    }
  }
 
  void Show()
  {
    for (Entry entry : mIngredientMap.entrySet())
    {
      String out = entry.getKey() + " has " + entry.getValue() + " occurrences";
      println(out);
    }
  }
 
  HashMap<String, Integer> AllIngredients()
  {
    return mIngredientMap;
  }
 
  HashMap<String, Integer> mIngredientMap = new HashMap<String, Integer>();
}
