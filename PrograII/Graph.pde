ScrollRect scrollRect;      // the vertical scroll bar
ScrollH horizontalScroll;
float widthOfCanvas = 3000;  // realHeight of the entire scene  
float heightOfCanvas = 3000; 
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
      scene();
      scrollRect.display();
      scrollRect.update(); 
      horizontalScroll.display();
      horizontalScroll.update();
      
    }
    
    public void matriz(){
  TipoN graph = createForceDirectedGraphFrom(DATA_FILE_PATH);
  // Begin loop for columns
  for (int i = 0; i < graph.nodes.size()+1; i++) {
    // Begin loop for rows
    for (int j = 0; j < graph.nodes.size()+1; j++) {
      fill(255);
      stroke(0);
      // Scaling up to draw a rectangle at (x,y)
      int x = i*40;      
      int y = j*40;
      if (i != 0 && j != 0){      
        // For every column and row, a rectangle is drawn at an (x,y)
        rect(x, y, 40, 40);
      }
    }
  }
  
  int x = 50;
  int y = 70;
  for (int i = 0; i < graph.nodes.size(); i++){
      fill(000000);
      text(graph.nodes.get(i).id, 18, (i+1.5)*40);
      text(graph.nodes.get(i).id, (i+1.2)*40, 35);
      for (int j = 0; j<graph.nodes.size(); j++){
        if (graph.nodes.get(i).adjacents.contains(graph.nodes.get(j))){
          fill(0,100,0);
          text(int(graph.nodes.get(i).naturalSpringLengths.get(
                                                graph.nodes.get(i).adjacents.indexOf(graph.nodes.get(j))
                                                )), x, y);
        }
        else{
            fill(255, 0, 0);
            text("----", x, y);
        }  
        x+=40;
      }
      x=50;
      y+=40;
  }
  
}



  void scene() {
    pushMatrix();
   
    // reading scroll bar 
    float newYValue = scrollRect.scrollValue();  
    translate (0, newYValue);
    
    float newXValue = horizontalScroll.scrollValue();  
    translate (newXValue,0);
   
    // The scene :
    matriz();
    popMatrix();
  }
   

   
 
}
