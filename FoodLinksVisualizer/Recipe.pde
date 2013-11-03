import java.util.ArrayList;

class Recipe
{
  void addIngredient(String Ingredient)
  {
    mIngredients.add(Ingredient);
  }
  
  ArrayList<String> allIngredients()
  {
    return mIngredients;
  }

  private ArrayList<String> mIngredients = new ArrayList<String>();
}
