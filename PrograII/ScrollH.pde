class ScrollH {
 
  float rectPosX=0;
  float rectPosY=0;
  float rectWidth=30; 
  float rectHeight=14;
 
  boolean holdscrollH=false; 
 
  float offsetMouseX;
  
  //constr
  ScrollH() {
    // you have to make a scrollH in setup after size()
    rectPosX=3;
  }//constr
 
  void display() {
    fill(122);
    stroke(0);
    //line (rectPosX-1, 0, 
      //rectPosX-1, width);
    rect(rectPosX, rectPosY, 
      rectWidth, rectHeight);
 
    // Three small lines in the center   
    centerLine(-3); 
    centerLine(0);
    centerLine(3);
  }
 
  void centerLine(float offset) {
    //line(rectPosX+3, rectPosY+rectHeight/2+offset, 
      //rectPosX+rectWidth-3, rectPosY+rectHeight/2+offset);
  }
 
  void mousePressedRect() {
    if (mouseOver()) {
      holdscrollH=true;
      offsetMouseX=mouseX-rectPosX;
    }
  }
 
  void mouseReleasedRect() {
    holdscrollH=false;
  }
 
  void update() {
    // dragging of the mouse 
    if (holdscrollH) {
      rectPosX=mouseX-offsetMouseX;
      if (rectPosX<0)
        rectPosX=0;
      if (rectPosX+rectWidth>width-1)
        rectPosX=width-rectWidth-1;
    }
  }
 
  float scrollValue() {
    return
      map(rectPosX, 
      0, width-rectWidth, 
      0, - (widthOfCanvas - width));
  }
 
  boolean mouseOver() {
    return mouseX>rectPosX&&
      mouseX<rectPosX+rectWidth&&
      mouseY>rectPosY&&
      mouseY<rectPosY+rectHeight;
  }//function 
  //
}//class 

 
