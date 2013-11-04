// Create a link between two ingredients: When two ingredients are used in one recipe, this link will be created.
// The counter counts the number of occurrences this combination appears in different recipes

class Link
{

  private String mFirst;
  private String mSecond;
  int mCounter;

  Link(String First, String Second) 
  {
    mFirst = First; 
    mSecond = Second;
    mCounter = 1;
  }

  String First()
  {
    return mFirst;
  }

  String Second()
  {
    return mSecond;
  }

  boolean Contains(String Name)
  {
    return mFirst == Name || mSecond == Name;
  }

  boolean Match(Link another)
  {
    return Contains(another.First()) && Contains(another.Second());
  }

  void IncrementCount()
  {
    mCounter++;
  }

  int Count()
  {
    return mCounter;
  }
}
