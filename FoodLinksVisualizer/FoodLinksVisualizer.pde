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
  Recipe fryRice = new Recipe();
  fryRice.addIngredient("soy sauce");
  fryRice.addIngredient("rice");
  fryRice.addIngredient("spring onion");
  fryRice.addIngredient("eggs");
  fryRice.addIngredient("chili");
  fryRice.addIngredient("minced meat");
  fryRice.addIngredient("bean sprout");

  Recipe pho = new Recipe();
  pho.addIngredient("rice noodles");
  pho.addIngredient("soy sauce");
  pho.addIngredient("beef");
  pho.addIngredient("spring onion");
  pho.addIngredient("chili");
  pho.addIngredient("bean sprout");

  c = new LinkCreator();
  c.addRecipe(fryRice);
  c.addRecipe(pho);
  //c.show();

  IngredientMapCreator r = new IngredientMapCreator();
  r.addRecipe(fryRice);
  r.addRecipe(pho);
  r.show();

  Map<String, Integer> allIngredients = r.allIngredients();

  for (Entry<String, Integer> entry : allIngredients.entrySet()) {
    // The values in the array are passed into the Bubble class constructor.

    String name = entry.getKey();
    Integer count = entry.getValue();
    bubbles.put(name, new Bubble(random(140), random(140), count * 20, name));
  }
} 

void createConnections(HashMap<String, Bubble> bubbles, ArrayList<Link> allLinks)
{
  for (Link l: allLinks)
  {
    Bubble b1 = bubbles.get(l.First());
    Bubble b2 = bubbles.get(l.Second());

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

  createConnections(bubbles, c.allLinks());
}
