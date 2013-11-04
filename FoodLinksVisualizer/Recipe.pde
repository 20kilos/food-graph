import java.util.ArrayList;

class Recipe
{
  private ArrayList<String> mIngredients = new ArrayList<String>();
  
  void addIngredient(String Ingredient)
  {
    mIngredients.add(Ingredient);
  }
  
  ArrayList<String> allIngredients()
  {
    return mIngredients;
  }
}
