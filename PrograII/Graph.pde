class Graph {
 
    public ArrayList<Nodo> nodes;
 
    public void addNode(Nodo nodo) {
        if (nodes == null) {
            nodes = new ArrayList();
        }
        else{
          if(nodes.contains(nodo.value)){
              System.out.println("Existing node");
          }
          else{
              nodes.add(nodo);
              System.out.println("Node added");
          }
        }
    } 
    @Override
    public String toString() {
        return "Graph [nodes=" + nodes + "]";
    }
 
}
