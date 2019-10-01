class Node {
  //Declaramos la clase 'Burbuja' con tres propiedades
  String value;
  ArrayList edges;
  ArrayList weights;
  color c;
 
  Node(String values, String edge, int weight ,color burbuja_c) {
    
    value = values;
    edges.addEdge(edge, weight);
    c = burbuja_c;
  }
  
  void addEdge(String edge, int weight) {
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
