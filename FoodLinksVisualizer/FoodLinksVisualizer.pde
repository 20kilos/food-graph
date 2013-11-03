import java.util.ArrayList;
import java.util.Map.Entry;
import java.util.HashMap;
import java.util.Map;


HashMap<String, Bubble> bubbles = new HashMap<String, Bubble>(); 
LinkCreator c;

void setup() 
{
  size(500, 500);
  stroke(255);
  background(192, 64, 0);
  Recipe FryRice = new Recipe();
  FryRice.addIngredient("soy sauce");
  FryRice.addIngredient("rice");
  FryRice.addIngredient("spring onion");
  FryRice.addIngredient("eggs");
  FryRice.addIngredient("chili");
  FryRice.addIngredient("minced meat");
  FryRice.addIngredient("bean sprout");

  Recipe Pho = new Recipe();
  Pho.addIngredient("rice noodles");
  Pho.addIngredient("soy sauce");
  Pho.addIngredient("beef");
  Pho.addIngredient("spring onion");
  Pho.addIngredient("chili");
  Pho.addIngredient("bean sprout");

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

void CreateConnections(HashMap<String, Bubble> Bubbles, ArrayList<Link> AllLinks)
{
  for (Link l: AllLinks)
  {
    Bubble b1 = Bubbles.get(l.First());
    Bubble b2 = Bubbles.get(l.Second());

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

  CreateConnections(bubbles, c.AllLinks());
}

