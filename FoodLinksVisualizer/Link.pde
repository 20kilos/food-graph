// Create a link between two ingredients: When two ingredients are used in one recipe, this link will be created.
// The counter counts the number of occurrences this combination appears in different recipes

class Link
{
  private String mFirst;
  private String mSecond;
  int occurences;

  Link(String first, String second) 
  {
    mFirst = first; 
    mSecond = second;
    occurences = 1;
  }

  String first()
  {
    return mFirst;
  }

  String second()
  {
    return mSecond;
  }

  boolean contains(String Name)
  {
    return mFirst == Name || mSecond == Name;
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
