// Create a link between two ingredients: When two ingredients are used in one recipe, this link will be created.
// The counter counts the number of occurrences this combination appears in different recipes

class Link
{
  private Ingredient mIngredient1;
  private Ingredient mIngredient2;
  int occurences;

  Link(Ingredient Ingredient1, Ingredient Ingredient2)
  {
    mIngredient1 = Ingredient1;
    mIngredient2 = Ingredient2;
    occurences = 1;
  }

  Ingredient first()
  {
    return mIngredient1;
  }

  Ingredient second()
  {
    return mIngredient2;
  }

  boolean contains(Ingredient another)
  {
    return mIngredient1.equals(another) || mIngredient2.equals(another);
  }

  boolean Match(Link another)
  {
    return contains(another.first()) && contains(another.second());
  }

  void incrementOccurences()
  {
    occurences++;
  }

  int getOccurences()
  {
    return occurences;
  }
}
