Population pop;
Goal goal;
PFont f;

void setup(){
  size(1000, 600);  
  pop = new Population(500);
  goal = new Goal(width-100, height-100);
  f = createFont("Arial", 100, true);
}

void draw(){
  background(255);
  
  textFont(f, 100); 
  fill(125);
  text(Integer.toString(pop.gen), width/2 - 30, height/2 + 20);
  
  if(pop.allDead()){
    pop.naturalSelection();
  }
  
  goal.show();
  
  pop.show();
  pop.update();
}
