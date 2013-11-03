import java.util.ArrayList;
 
class LinkCreator
{  
  void AddRecipe(Recipe recipe)
  {
    ArrayList<Link> allLinks = GenerateLinks(recipe);
 
    for (Link newLink : allLinks)
    {
      boolean found = false;
      for (Link existingLink : mExistingLinks)
      {
        if (existingLink.Match(newLink))
        {
          existingLink.IncrementCount();
          found = true;
          break;
        }
      }
 
      if (!found)
        mExistingLinks.add(newLink);
    }
  }
 
  void Show()
  {
    println("showing");
    for (Link l : mExistingLinks)
    {
      String out = l.First() + "+++" + l.Second() + ":" + l.Count();
      println(out);
    }
  }
 
  ArrayList<Link> AllLinks()
  {
    return mExistingLinks;
  }
 
  private ArrayList<Link> mExistingLinks = new ArrayList<Link>();
}

// Create links among all ingredients with a given recipe
ArrayList<Link> GenerateLinks(Recipe recipe)
{
  ArrayList<Link> uniqueLinks = new ArrayList<Link>();
 
  ArrayList<String> Ingredients = recipe.allIngredients();
  int size = Ingredients.size();
  
  for (int i = 0; i < size; i++)
  {
    int j = i + 1;
 
    while (j < size)
    {
      uniqueLinks.add(new Link(Ingredients.get(i), Ingredients.get(j)));
      j++;
    }
  }
 
  return uniqueLinks;
}
