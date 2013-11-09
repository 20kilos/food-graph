import java.util.ArrayList;
import java.util.HashMap;
 
class IngredientMapCreator
{
  HashMap<Ingredient, Integer> mIngredientMap = new HashMap<Ingredient, Integer>();

  void addRecipe(Recipe recipe)
  {
    for (Ingredient stuff: recipe.ingredients())
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
      String out = ((Ingredient)entry.getKey()).name() + " has " + entry.getValue() + " occurrences";
      println(out);
    }
  }
 
  HashMap<Ingredient, Integer> allIngredients()
  {
    return mIngredientMap;
  }
 }
 
