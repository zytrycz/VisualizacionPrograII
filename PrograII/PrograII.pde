import controlP5.*;

//This are objets from libraries of classes of the program
ControlP5 cp5;
ControlFrame cf;

//Initialization of control and shape variables
int rect1X, rect1Y, rect2X, rect2Y;
int rectHighlight;
int rectSize = 90;
int minValue, mediumValue, maxValue;
boolean rect1Over = false;
boolean rect2Over = false;
Table DB;
PImage index;
int state = 0;

void setup(){
  
    //Setting up the styling of the index information and background
    rectHighlight = color(200);
    rect1X = width/2-rectSize-10;
    rect1Y = height/2-rectSize/2;
    rect2X = width/2-rectSize-10;
    rect2Y = height/2-rectSize/2;
    index = loadImage("index.png");
    image(index,0,0,1600,800);
    size(1600, 800);
    noStroke();
    
    
    //Information needed to display the slidebars
    cp5 = new ControlP5(this);
    if(state == 0){
    cp5.addSlider("Peso mínimo")
     .setRange(0,200)
     .setValue(25)
     .setPosition(650,600)
     .setSize(200,20);
     
     cp5.addSlider("Peso medio")
     .setRange(0,200)
     .setValue(50)
     .setPosition(650,650)
     .setSize(200,20);
     
     cp5.addSlider("Peso máximo")
     .setRange(0,200)
     .setValue(100)
     .setPosition(650,700)
     .setSize(200,20);
    }
    
    strokeWeight(5);
    /*
    * according to what talked to the teacher in the class the CSV for the DB,
    * it only handles format the reading of assembly nodes and arcs at reading time,
    * it is formatted "Node, Next Node, weight"
    */
    DB = loadTable("DB.csv", "header");
    Graph  graph = new Graph();
    ArrayList<Node> list = new ArrayList();
    for(TableRow row : DB.rows())
    {
      Node n = new Node(row.getString("pos"),row.getString("next"),row.getInt("weight"));
      
      list.add(n);
    }
    for (Node x : list)
    {
      
      graph.addNode(x);
      String nodeToPrint = graph.toString();
      System.out.println(x.weights);
    }

}

void draw(){
  
  update(mouseX, mouseY);
  //If state equals 0, then processing is going to draw the setting menu
  if(state == 0){
    
    
    
    colorMode(RGB, 250); 
    loop();
    image(index,0,0,1600,800);
    rectMode(CENTER);
    fill(60,200);
    rect(800, 400, 400, 700, 7);
    
    rectMode(CORNER);
    if (rect1Over) {
    fill(rectHighlight);
  } else {
    fill(250,200);
  }
  
  rect(rect1X-20, rect1Y, rectSize+70, rectSize-20,15);
  fill(1);
   text("Nodos y arcos",rect1X,400);
  }
  if (rect2Over) {
    fill(rectHighlight);
  } else {
    fill(250,200);
  }
  
  rect(rect2X-20, rect2Y+110, rectSize+70, rectSize-20,15);
  fill(1);
  text("Matriz de adyacencia",rect1X,510);
  
  fill(250);
  text("Visualización de grafos",620,100);
  text("Autores",620,140);
  text("Bryan",630,190);
  text("Daniel",630,220);
  text("Luis",630,250);
  text("Metodo de visualización que desea",620,325);
  text("Ajuste de pesos para su visualización",620,560);
  
  //If state equals 1, then processing is going to process the visualization of the node as type N
  if(state == 1){
    noLoop();
  background(180);
  }
  //If state equals 1, then processing is going to process the visualization of the node as type M
  if(state == 2){
    noLoop();
  background(240);
  }
}

void keyPressed(){
  state = 0;
  redraw();
}

//Actions are splited in separate scenarios or states. State 1: Menu, State 2: Nodos y arcos, State 3: Matriz de adyacencia
void mouseClicked() {
  //Actions to be done when the user is in the index menu
    if(state == 0){
    if(rect1Over){
      state = 1;  
    }
    if(rect2Over){
      state = 2;
    }
    }
    //Actions to be done when the user is in the "Nodos y Arcos" visualization
    if(state == 1){
      state = 1;
    }
    //Actions to be done when the user is in the "Matriz de Adyacencia" visualization
     if(state == 2){
       state = 2;
    }
}

//update the value of the variables to control the cursor in the rectangles
void update(int x, int y) {
  if ( overRect1(rect1X-20, rect1Y, rectSize+70, rectSize-20) ) {
    rect1Over = true;
    rect2Over = false;
    
  } else if ( overRect2(rect2X-20, rect2Y+110, rectSize+70, rectSize-20) ) {
    rect1Over = false;
    rect2Over = true;
  }
}


//This function check if the cursor is located in the "Nodos y arcos" rectangle
boolean overRect1(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

//This function check if the cursor is located in the "Matriz de adyacencia" rectangle
boolean overRect2(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
  

//This class enable the posibility to use two windows to show the information
//One is used to control de settings and the other one is used to display the information
public class ControlFrame extends PApplet {

  int w, h;

  int bg;

  public void setup() {
    size(w, h);
    frameRate(25);
    cp5 = new ControlP5( this );
  }

  public void draw() {
    background( bg );
  }

  private ControlFrame() {
  }

  public ControlFrame(Object theParent, int theWidth, int theHeight, int theColor) {
    parent = theParent;
    w = theWidth;
    h = theHeight;
    bg = theColor;
  }


  public ControlP5 control() {
    return this.cp5;
  }

  ControlP5 cp5;

  Object parent;
}
