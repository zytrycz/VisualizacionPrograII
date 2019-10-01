class Graph {
 
    ArrayList<Node> nodes;
 
    void addNode(Node node) {
        if (nodes == null) {
            nodes = new ArrayList();
        }
        else{
          if(nodes.contains(node.value)){
              System.out.println("Existing node");
          }
          else{
              nodes.add(node);
              System.out.println("Node added");
          }
        }
    } 
    @Override
    String toString() {
        return "Graph [nodes=" + nodes + "]";
    }
 
}
