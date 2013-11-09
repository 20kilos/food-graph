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
  
  Ingredients allIngredients = new Ingredients();
  Recipe fryRice = new Recipe();
  
  fryRice.addIngredient(allIngredients.Ingredient("soy sauce"));
  fryRice.addIngredient(allIngredients.Ingredient("rice"));
  fryRice.addIngredient(allIngredients.Ingredient("spring onion"));
  fryRice.addIngredient(allIngredients.Ingredient("eggs"));
  fryRice.addIngredient(allIngredients.Ingredient("chili"));
  fryRice.addIngredient(allIngredients.Ingredient("minced meat"));
  fryRice.addIngredient(allIngredients.Ingredient("bean sprout"));

  Recipe pho = new Recipe();
  pho.addIngredient(allIngredients.Ingredient("rice noodles"));
  pho.addIngredient(allIngredients.Ingredient("soy sauce"));
  pho.addIngredient(allIngredients.Ingredient("beef"));
  pho.addIngredient(allIngredients.Ingredient("spring onion"));
  pho.addIngredient(allIngredients.Ingredient("chili"));
  pho.addIngredient(allIngredients.Ingredient("bean sprout"));

  linkCreator = new LinkCreator();
  linkCreator.addRecipe(fryRice);
  linkCreator.addRecipe(pho);
  //c.show();

  IngredientOccurranceCounter occurrancesCounter = new IngredientOccurranceCounter();
  occurrancesCounter.addRecipe(fryRice);
  occurrancesCounter.addRecipe(pho);
  occurrancesCounter.show();

  HashMap<Integer, Integer> occurrances = occurrancesCounter.occurrances();

  for (Entry<String, Integer> entry : allIngredients.all().entrySet()) {

    // The values in the array are passed into the Bubble class constructor.
    String name = entry.getKey();
    int ingredientId = entry.getValue();
    int count = occurrances.get(ingredientId);

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
