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
