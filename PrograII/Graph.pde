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
  TipoN graph = createForceDirectedGraphFrom(DATA_FILE_PATH);
  int x = 60;
  int y = 80;
  for (int i = 0; i < graph.nodes.size(); i++){
      fill(000000);
      text(graph.nodes.get(i).id, 18, (i+1.5)*50);
      text(graph.nodes.get(i).id, (i+1.2)*50, 35);
      int conecction = -1;
      for (int j = 0; j<graph.nodes.size(); j++){
        if (graph.nodes.get(i).adjacents.contains(graph.nodes.get(j))){
          fill(0,100,0);
          text(int(graph.nodes.get(i).naturalSpringLengths.get(
                                                graph.nodes.get(i).adjacents.indexOf(graph.nodes.get(j))
                                                )), x, y);
        }
        else{
            fill(255, 0, 0);
            text("-----", x, y);
        }  
        x+=50;
      }
      x=60;
      y+=50;
  }
  
}
 
}
