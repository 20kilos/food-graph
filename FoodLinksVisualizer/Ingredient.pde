class Ingredient
{
  private int mId;
  private String mName;
  
  Ingredient(int id, String name)
  {
    mId = id;
    mName = name;
  }

  String name()
  {
    return mName;
  }
  
  int id()
  {
    return mId;
  }
  
  boolean equals(Ingredient another)
  {
    return mId == another.id();
  }
}

class Ingredients
{
  private HashMap<String, Integer> mIngredientMap = new HashMap<String, Integer>();
  
  int getId(String ingredient)
  {
    if (!mIngredientMap.containsKey(ingredient))
      mIngredientMap.put(ingredient, mIngredientMap.size());

    return mIngredientMap.get(ingredient);  
  }
  
  HashMap<String, Integer> all()
  {
    return mIngredientMap;
  }
  
  Ingredient Ingredient(String name)
  {
    return new Ingredient(getId(name), name);
  }
}
