  Table DB;

void setup(){
    //dimensiones
    size(1080, 700);
    //color del fondo
    background(#339966);
    //color del trazo en hexadecimal
    stroke(#ffffff);
    //grosor del trazo en píxeles
    strokeWeight(5);
    DB = loadTable("DB.csv", "header");
    Graph  graph = new Graph();
    ArrayList<Node> list = new ArrayList();
   /* for(TableRow row : DB.rows())
    {
      Node n = new Node(row.getString("pos"),row.getString("next"),row.getInt("height"));
      println(row.getString("pos")+"   "+row.getString("next")+"  "+row.getInt("height"));
      list.add(n);
    }
    for (Node x : list)
    {
      graph.addNode(x);
    }*/
    
     String[] lines = loadStrings("DB.csv");
     
     for (int i =0; i<lines.length; i++)
     {
       println(lines[i]);
       if (i!=0)
     {
       String[] x = splitTokens(lines[i], ",");
       int l = Integer.parseInt(String.valueOf(x[2]));
       Node n = new Node(x[0],x[1],l);
       println(x[0]+"   "+x[1]+"    "+l);
       list.add(n);
       
     }
     }
     for (Node x : list)
     {
       graph.addNode(x);
     }
    
}
