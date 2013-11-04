import java.util.ArrayList;
import java.util.Map.Entry;
import java.util.HashMap;
import java.util.Map;

HashMap<String, Bubble> bubbles = new HashMap<String, Bubble>(); 
LinkCreator linkCreator;

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

  linkCreator = new LinkCreator();
  linkCreator.addRecipe(fryRice);
  linkCreator.addRecipe(pho);
  //c.show();

  IngredientMapCreator mapCreator = new IngredientMapCreator();
  mapCreator.addRecipe(fryRice);
  mapCreator.addRecipe(pho);
  mapCreator.show();

  Map<String, Integer> allIngredients = mapCreator.allIngredients();

  for (Entry<String, Integer> entry : allIngredients.entrySet()) {
    // The values in the array are passed into the Bubble class constructor.
    String name = entry.getKey();
    Integer count = entry.getValue();
    bubbles.put(name, new Bubble(random(140), random(140), count * 20, name));
  }
} 

void drawLinks(HashMap<String, Bubble> bubbles, ArrayList<Link> allLinks)
{
  for (Link l: allLinks)
  {
    Bubble b1 = bubbles.get(l.first());
    Bubble b2 = bubbles.get(l.second());

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

  drawLinks(bubbles, linkCreator.allLinks());
}
