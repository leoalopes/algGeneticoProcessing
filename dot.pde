class Dot{
  Brain brain;
  PVector pos;
  PVector vel;
  PVector acc;
  Boolean dead = false;
  Boolean reached = false;
  float fitness = 0;
  
  Dot(){
    brain = new Brain(800);
    pos = new PVector(100, 100);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void show(Boolean t){
    if(t)
      fill(255, 128, 0);
    else
      fill(0, 0, 255);
    ellipse(pos.x, pos.y, 5, 5);
  }
  
  void move(){
    if(brain.directions.length >= brain.step){
      acc = brain.directions[brain.step];
      brain.step++;
    } else {
      dead = true;
    }
    
    vel.add(acc);
    vel.limit(15);
    pos.add(vel);
  }
  
  void update(){
    if(!dead && !reached){
      move();
      
      if(dist(pos.x, pos.y, goal.pos.x+50, goal.pos.y+50) <= 50){
        reached = true;
      } else if(pos.x <= 10 || pos.x >= width-10 || pos.y <= 10 || pos.y >= height-10){
        dead = true;
      }
    }
  }
  
  void calculateFitness(){    
    if(reached){
      fitness = 1.0/(float)(brain.step/2 * brain.step/2);
    } else {
      float distToGoal = dist(pos.x, pos.y, goal.pos.x+50, goal.pos.y+50);
      fitness = 1.0/(distToGoal * distToGoal);
    }
  }
  
  Dot newDot(){
    Dot newD = new Dot();
    newD.brain = brain.clone();
    
    return newD;
  }
  
}
