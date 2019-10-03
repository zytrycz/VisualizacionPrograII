class Graph {
 
    public ArrayList<Node> nodes;
 
    public void addNode(Node node) {
        if (nodes == null) {
            nodes = new ArrayList();
            nodes.add(node);
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
    public String toString() {
        return "Graph [nodes=" + nodes + "]";
    }
 
}
