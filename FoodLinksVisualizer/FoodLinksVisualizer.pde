import java.util.ArrayList;
import java.util.Map.Entry;
import java.util.HashMap;
import java.util.Map;

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

HashMap<String, Bubble> bubbles = new HashMap<String, Bubble>(); 
LinkCreator c;

void setup() 
{
  size(500, 500);
  stroke(255);
  background(192, 64, 0);
  ArrayList<String> FryRice = new ArrayList<String>();
  FryRice.add("soy sauce");
  FryRice.add("rice");
  FryRice.add("spring onion");
  FryRice.add("eggs");
  FryRice.add("chili");
  FryRice.add("minced meat");
  FryRice.add("bean sprout");

  ArrayList<String> Pho = new ArrayList<String>();
  Pho.add("rice noodles");
  Pho.add("soy sauce");
  Pho.add("beef");
  Pho.add("spring onion");
  Pho.add("chili");
  Pho.add("bean sprout");

  c = new LinkCreator();
  c.AddRecipe(FryRice);
  c.AddRecipe(Pho);
  //c.Show();

  IngredientMapCreator r = new IngredientMapCreator();
  r.AddRecipe(FryRice);
  r.AddRecipe(Pho);
  r.Show();

  Map<String, Integer> AllIngredients = r.AllIngredients();

  int i = 0;
  for (Entry<String, Integer> entry : AllIngredients.entrySet()) {
    // The values in the array are passed into the Bubble class constructor.

    String Name = entry.getKey();
    Integer Count = entry.getValue();
    bubbles.put(Name, new Bubble(random(140), random(140), Count * 20, Name));
  }
} 

void CreateConnections(HashMap<String, Bubble> Bubbles, ArrayList<Pair> AllPairs)
{
  for (Pair p: AllPairs)
  {
    Bubble b1 = Bubbles.get(p.First());
    Bubble b2 = Bubbles.get(p.Second());

    line(b1.x, b1.y, b2.x, b2.y);
  }
}

void draw() {
  background(255);

  // Display and move all bubbles
  for (Bubble b : bubbles.values()) {
    b.display();
    b.drift();
  }

  CreateConnections(bubbles, c.AllPairs());
}

