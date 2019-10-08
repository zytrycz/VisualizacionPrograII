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
    
    public void draw(){
        
      matriz();
    }
    
    public void matriz(){
  
  float x1 = 50;
  float y1 = 50;
  float toAddX= width/graph.nodes.size();
  float x2 = 50+toAddX;
  float toAddY = height/graph.nodes.size();
  float y2 = 50+toAddY;
  
  // Begin loop for columns
  for (int i = 0; i < this.nodes.size(); i++) {
    // Begin loop for rows
    for (int j = 0; j < this.nodes.size(); j++) {
      fill(255);
      stroke(0);
      // Scaling up to draw a rectangle at (x,y)
      int x = i*50;      
      int y = j*50;
      if (i != 0 && j != 0){      
        // For every column and row, a rectangle is drawn at an (x,y) location scaled and sized by videoScale.
        rect(x, y, 50, 50);
      }
    }
  }
  for (int i = 0; i < this.nodes.size(); i++){
      fill(000000);
      text(this.nodes.get(i).value, 18, (i+1.5)*50);
      text(this.nodes.get(i).value, (i+1.5)*50, 18);
  }
  
}
 
}
