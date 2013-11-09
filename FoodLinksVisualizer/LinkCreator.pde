import java.util.ArrayList;
 
class LinkCreator
{ 
  private ArrayList<Link> mExistingLinks = new ArrayList<Link>();

  void addRecipe(Recipe recipe)
  {
    ArrayList<Link> allLinks = generateLinks(recipe);
 
    for (Link newLink : allLinks)
    {
      boolean found = false;
      for (Link existingLink : mExistingLinks)
      {
        if (existingLink.Match(newLink))
        {
          existingLink.incrementOccurences();
          found = true;
          break;
        }
      }
 
      if (!found)
        mExistingLinks.add(newLink);
    }
  }
 
  void show()
  {
    println("showing");
    for (Link l : mExistingLinks)
    {
      String out = l.first() + "+++" + l.second() + ":" + l.getOccurences();
      println(out);
    }
  }
 
  ArrayList<Link> allLinks()
  {
    return mExistingLinks;
  }
}

// Create links among all ingredients with a given recipe
ArrayList<Link> generateLinks(Recipe recipe)
{
  ArrayList<Link> uniqueLinks = new ArrayList<Link>();
 
  ArrayList<Ingredient> ingredients = recipe.ingredients();
  int size = ingredients.size();
  
  for (int i = 0; i < size; i++)
  {
    int j = i + 1;
 
    while (j < size)
    {
      uniqueLinks.add(new Link(ingredients.get(i), ingredients.get(j)));
      j++;
    }
  }
 
  return uniqueLinks;
}
