import java.util.ArrayList;
import java.util.HashMap;
 
class IngredientOccurranceCounter
{
  HashMap<Integer, Integer> mIngredientCounter = new HashMap<Integer, Integer>();

  void addRecipe(Recipe recipe)
  {
    for (Ingredient stuff: recipe.ingredients())
    {
      if (mIngredientCounter.containsKey(stuff.id()))
        mIngredientCounter.put(stuff.id(), mIngredientCounter.get(stuff.id()) + 1);
      else
        mIngredientCounter.put(stuff.id(), 1);
    }
  }
 
  void show()
  {
    for (Entry entry : mIngredientCounter.entrySet())
    {
      String out = entry.getKey() + " has " + entry.getValue() + " occurrences";
      println(out);
    }
  }
 
  HashMap<Integer, Integer> occurrances()
  {
    return mIngredientCounter;
  }
 }
 
