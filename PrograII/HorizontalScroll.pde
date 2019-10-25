class HorizontalScroll {
 
  float rectPosX=0;
  float rectPosY=0;
  float rectWidth=20; 
  float rectHeight=30;
 
  boolean holdScrollRect=false; 
 
  float offsetMouseX; 
 
  //constr
  HorizontalScroll() {
    // you have to make a scrollRect in setup after size()
    rectPosX=3;
  }//constr
 
  void display() {
    fill(122);
    stroke(0);
    line (rectWidth, height, 
          width, height);
    rect(rectWidth, height-12, 
        rectHeight, height);
 
  }
 

 
  void mousePressedRect() {
    if (mouseOver()) {
      holdScrollRect=true;
      offsetMouseX=mouseX-rectPosX;
    }
  }
 
  void mouseReleasedRect() {
    holdScrollRect=false;
  }
 
  void update() {
    // dragging of the mouse 
    if (holdScrollRect) {
      rectPosX=mouseX-offsetMouseX;
      if (rectPosX<0)
        rectPosX=0;
      if (rectPosX+rectWidth>height-1)
        rectPosX=height-rectWidth-1;
    }
  }
 
  float scrollValue() {
    return
      map(rectPosX, 
      0, width-rectWidth, 
      0, - (widthOfCanvas - width));
  }
 
  boolean mouseOver() {
    return mouseY>height-12&&
      mouseY<height&&
      mouseX>rectPosX&&
      mouseX<rectPosX+rectWidth;
  }//function 
  //
}//class 
