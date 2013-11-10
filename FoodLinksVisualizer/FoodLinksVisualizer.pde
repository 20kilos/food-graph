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
  IngredientOccurranceCounter occurrancesCounter = new IngredientOccurranceCounter();
  linkCreator = new LinkCreator();
  
  String[] recipes = loadStrings("recipes.csv");
  
  for(int i = 0; i < recipes.length; i++) 
  {
    Recipe recipe = new Recipe();
    String[] ingredients = split(recipes[i], ',');
    
    for(int j = 0; j <ingredients.length; j++) 
    {
      recipe.addIngredient(allIngredients.Ingredient(ingredients[j]));
    }
    linkCreator.addRecipe(recipe);
    occurrancesCounter.addRecipe(recipe);
  }
  occurrancesCounter.show();

  HashMap<Integer, Integer> occurrances = occurrancesCounter.occurrances();

  //XMLGen gen = new XMLGen();

  for (Entry<String, Integer> entry : allIngredients.all().entrySet()) {

    // The values in the array are passed into the Bubble class constructor.
    String name = entry.getKey();
    int ingredientId = entry.getValue();
    int count = occurrances.get(ingredientId);

    bubbles.put(name, new Bubble(random(140), random(140), count * 20, name));

    // Add XML data
    //gen.addIngredient(ingredientId, name, count);
  }

  //for (Link l : linkCreator.allLinks())
    ////gen.addLink(l);

  //gen.show();
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
