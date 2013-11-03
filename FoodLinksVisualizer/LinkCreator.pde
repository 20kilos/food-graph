import java.util.ArrayList;
 
class LinkCreator
{  
  void AddRecipe(Recipe recipe)
  {
    ArrayList<Pair> AllPairs = GeneratePairs(recipe.allIngredients());
 
    for (Pair newP : AllPairs)
    {
      boolean found = false;
      for (Pair existingPair : mMainPairs)
      {
        if (existingPair.Match(newP))
        {
          existingPair.Increment();
          found = true;
          break;
        }
      }
 
      if (!found)
        mMainPairs.add(newP);
    }
  }
 
  void Show()
  {
    println("showing");
    for (Pair p : mMainPairs)
    {
      String out = p.First() + "+++" + p.Second() + ":" + p.Count();
      println(out);
    }
  }
 
  ArrayList<Pair> AllPairs()
  {
    return mMainPairs;
  }
 
  private ArrayList<Pair> mMainPairs = new ArrayList<Pair>();
}
 
ArrayList<Pair> GeneratePairs(ArrayList<String> Ingredients)
{
  ArrayList<Pair> uniquePairs = new ArrayList<Pair>();
 
  for (int i = 0; i < Ingredients.size(); i++)
  {
    int j = i + 1;
 
    while (j < Ingredients.size ())
    {
      uniquePairs.add(new Pair(Ingredients.get(i), Ingredients.get(j)));
      j++;
    }
  }
 
  return uniquePairs;
}
