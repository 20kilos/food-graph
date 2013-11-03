class Pair
{
  Pair(String First, String Second) 
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

  boolean Match(Pair another)
  {
    return Contains(another.First()) && Contains(another.Second());
  }

  void Increment()
  {
    mCounter++;
  }

  int Count()
  {
    return mCounter;
  }

  private String mFirst;
  private String mSecond;
  int mCounter;
};
