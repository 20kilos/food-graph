import java.util.ArrayList;

class Recipe
{
  private ArrayList<Ingredient> mIngredients = new ArrayList<Ingredient>();
  
  void addIngredient(Ingredient ingredient)
  {
    mIngredients.add(ingredient);
  }
  
  ArrayList<Ingredient> ingredients()
  {
    return mIngredients;
  }
}
