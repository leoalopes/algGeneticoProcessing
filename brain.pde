class Brain{
  PVector directions[];
  int step = 0;
  
  Brain(int size){
    directions = new PVector[size];
    randomize();
  }
  
  void randomize(){
    for(int i=0; i < directions.length; i++){
      directions[i] = PVector.fromAngle(random(2*PI));
    }
  }
  
  Brain clone(){
    Brain clone = new Brain(directions.length);
    for(int i=0; i < directions.length; i++){
      clone.directions[i] = directions[i].copy();
    }
    
    return clone;
  }
  
  void mutate(){
    float mutationRate = 0.005;
    for(int i=0; i < directions.length; i++){
      float rand = random(1);
      if(rand <= mutationRate){
        float randomAngle = random(2*PI);
        directions[i] = PVector.fromAngle(randomAngle);
      }
    }
  }
}
