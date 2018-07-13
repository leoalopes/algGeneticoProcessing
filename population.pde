class Population{
  Dot dots[];
  float fitnessSum = 0;
  int gen = 1;
  Dot bestDot;
  
  Population(int size){
    dots = new Dot[size];
    for(int i=0; i < size; i++){
      dots[i] = new Dot();
    }
  }
  
  void show(){
    for(int i=0; i < dots.length; i++){
      if(i==0 && gen>1)
        dots[i].show(true);
      else
        dots[i].show(false);
    }
  }
  
  void update(){
    for(int i=0; i < dots.length; i++){
      dots[i].update();
    }
  }
  
  Boolean allDead(){
    for(int i=0; i < dots.length; i++){
      if(!dots[i].dead && !dots[i].reached)
        return false;
    }
    return true;
  }
  
  void calculateFitness(){
    fitnessSum = 0;
    for(int i=0; i < dots.length; i++){
      dots[i].calculateFitness();
      fitnessSum += dots[i].fitness;
      if(i==0){
        bestDot = new Dot();
        bestDot.brain = dots[i].brain.clone();
        bestDot.fitness = dots[i].fitness;
      } else if(dots[i].fitness > bestDot.fitness){
        bestDot = new Dot();
        bestDot.brain = dots[i].brain.clone();
        bestDot.fitness = dots[i].fitness;
      }
    }
  }
  
  Dot selectParent(){
    while(true){
      float rand = random(fitnessSum);
      
      float runningSum = 0;
      for(int i=0; i < dots.length; i++){
        runningSum += dots[i].fitness;
        if(runningSum > rand){
          return dots[i];
        }
      }
    }
  }
  
  void naturalSelection(){
    Dot newDots[] = new Dot[dots.length];
    
    calculateFitness();
    
    newDots[0] = bestDot;
    for(int i=1; i < newDots.length; i++){
      Dot parent = selectParent();
      newDots[i] = parent.newDot();
    }
    
    dots = newDots.clone();
    gen++;
    
    mutate();
  }
  
  void mutate(){
    for(int i=1; i < dots.length; i++){
      dots[i].brain.mutate();
    }
  }
}
