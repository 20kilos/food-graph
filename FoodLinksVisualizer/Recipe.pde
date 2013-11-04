import java.util.ArrayList;

class Recipe
{
  private ArrayList<String> mIngredients = new ArrayList<String>();
  
  void addIngredient(String ingredient)
  {
    mIngredients.add(ingredient);
  }
  
  ArrayList<String> ingredients()
  {
    return mIngredients;
  }
}
