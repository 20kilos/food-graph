XML xml;
XML mNodesElement;
XML mEdgesElement;
  
void createNode(Integer id, String name, Integer occurrence)
{
  XML node = mNodesElement.addChild("node");
  node.setString("id", String.valueOf(id));
  node.setString("label", name);
  //XML nodeSize = node.addChild("viz:size");
  //nodeSize.setString("value", String.valueOf(occurrence));
}

void createEdge(Link link)
{ 
  XML edge = mEdgesElement.addChild("edge");
  edge.setString("id", String.valueOf(mEdgesElement.getChildCount()));
  edge.setString("source", String.valueOf(((Ingredient)link.first()).id()));
  edge.setString("target", String.valueOf(((Ingredient)link.second()).id()));
  edge.setString("weight", String.valueOf(link.getOccurences()));
}

class XMLGen {
  
  XMLGen()
  {
    xml = loadXML("ingredients.xml");

    XML rootElement = xml.addChild("graph");
    
    mNodesElement = rootElement.addChild("nodes");
    mEdgesElement = rootElement.addChild("edges");
  }

  void addLink(Link link) 
  {
    createEdge(link);
  }

  void addIngredient(Integer id, String name, Integer occurrence)
  {
    createNode(id, name, occurrence);
  }
  
  void show()
  {
    saveXML(xml, "test.xml");
    println(xml.toString());
  }
}
