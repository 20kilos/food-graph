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
  fryRice.addIngredient(new Ingredient(0, "soy sauce"));
  fryRice.addIngredient(new Ingredient(1, "rice"));
  fryRice.addIngredient(new Ingredient(3, "spring onion"));
  fryRice.addIngredient(new Ingredient(4, "eggs"));
  fryRice.addIngredient(new Ingredient(5, "chili"));
  fryRice.addIngredient(new Ingredient(6, "minced meat"));
  fryRice.addIngredient(new Ingredient(7, "bean sprout"));

  Recipe pho = new Recipe();
  pho.addIngredient(new Ingredient(9, "rice noodles"));
  pho.addIngredient(new Ingredient(0, "soy sauce"));
  pho.addIngredient(new Ingredient(8, "beef"));
  pho.addIngredient(new Ingredient(3, "spring onion"));
  pho.addIngredient(new Ingredient(5, "chili"));
  pho.addIngredient(new Ingredient(7, "bean sprout"));

  linkCreator = new LinkCreator();
  linkCreator.addRecipe(fryRice);
  linkCreator.addRecipe(pho);
  //c.show();

  IngredientMapCreator mapCreator = new IngredientMapCreator();
  mapCreator.addRecipe(fryRice);
  mapCreator.addRecipe(pho);
  mapCreator.show();

  Map<Ingredient, Integer> allIngredients = mapCreator.allIngredients();

  for (Entry<Ingredient, Integer> entry : allIngredients.entrySet()) {
    // The values in the array are passed into the Bubble class constructor.
    String name = entry.getKey().name();
    Integer count = entry.getValue();
    bubbles.put(name, new Bubble(random(140), random(140), count * 20, name));
  }
} 

void drawLinks(HashMap<String, Bubble> bubbles, ArrayList<Link> allLinks)
{
  for (Link l: allLinks)
  {
    Bubble b1 = bubbles.get(((Ingredient)l.first()).name());
    Bubble b2 = bubbles.get(((Ingredient)l.second()).name());

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
