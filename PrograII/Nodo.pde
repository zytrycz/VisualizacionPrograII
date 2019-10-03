class Node {
  //Declaramos la clase 'Burbuja' con tres propiedades
  String value;
  ArrayList edges;
  ArrayList weights;

  public Node(String values, String edge, int weight) {
    value = values;
    addEdge(edge, weight);
    
  }
  
  public void addEdge(String edge, int weight) {
    if (edges == null) {
      edges = new ArrayList();
    }
      else{
        if(this.edges.contains(edge)){
          System.out.println("Existing node");
        }
        else{
          edges.add(edge);
          weights.add(weight);
          System.out.println("Node added");
        }
      }

  }
  
}
