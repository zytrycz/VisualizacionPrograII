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
    for(TableRow row : DB.rows())
    {
      Node n = new Node(row.getString("pos"),row.getString("next"),row.getInt("height"));
      list.add(n);
    }
    for (Node x : list)
    {
      graph.addNode(x);
    }
    
}
