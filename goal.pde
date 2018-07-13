class Goal{
  PVector pos;
  
  Goal(int x, int y){
    pos = new PVector(x, y);
  }
  
  void show(){   
    fill(0, 255, 0);
    rect(pos.x, pos.y, 100, 100, 1);
  }

}
