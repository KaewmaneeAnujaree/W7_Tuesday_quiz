class Ball{
  float position_x,  position_y; //position X & Y of ball
  float size;  // size of ball
  float area; // area of ball
  int extraPower;
  
  Ball(float pos_x,float pos_y,float size){
    this.position_x = pos_x;
    this.position_y = pos_y;
    this.size = size;
    extraPower = int(random(0,2));
  }

  void draw(){
    if(extraPower ==1){
      fill(random(0,255), random(0,255), random(0,255)); // random color
      circle(this.position_x,this.position_y,this.size);  //draw ball
    }else{
      fill(255);
      circle(this.position_x,this.position_y,this.size);
    }
  }
  
  float get_area(){
    area = 3.14*pow((size/2),2);  // calculate area of ball
    return area;
  }
}

class Block{
  float position_x,  position_y; // position X & Y of block
  float size;  // size of block
  float area;
  int extraPower;
  int n = int(random(1,10));
  Ball[] ball = new Ball[n];
  
  Block(float pos_x,float pos_y,float size){
    this.position_x = pos_x;
    this.position_y = pos_y;
    this.size = size;
    extraPower = int(random(0,2));
    
    for(int i =0; i<n; i++){
      float size_ball = random(10,this.size);
      ball[i] = new Ball(random(this.position_x+size_ball/2,this.position_x+this.size-size_ball/2),random(this.position_y+size_ball/2,this.position_y+this.size-size_ball/2),size_ball);
    }
  }

  void draw(){
    if(extraPower == 1){
      fill(random(0,255), random(0,255), random(0,255)); //random color
      rect(this.position_x, this.position_y, this.size, this.size); //draw ractangle
      for(int i = 0;i<n;i++){
        ball[i].draw();
      }
    }else{
      fill(255, 255, 255); 
      rect(this.position_x, this.position_y, this.size, this.size);
      for(int i = 0;i<n;i++){
        ball[i].draw();
      }
    }
  }
  
  float get_area(){
    area = pow(this.size, 2); // calculate area of ball
    return area; 
  }
}

int n=5;
Block[] block = new Block[n];
float area_block = 0;
float area_ball = 0;
float area = 0;
int windowSize = 300;
int index_block;

void setup(){
  size(300,300);
  background(255);
  for(int i=0; i<n; i++){
    block[i] = new Block(random(100,windowSize-70), random(100,windowSize-70), random(50,100));
  }
  for(int i=0; i<n; i++){
    block[i].draw();
    area_block += block[i].get_area();
  }
  area = area_block+area_ball;
  println("area_block: "+area_block);
  println("area_ball: "+area_ball);
  println("Summary area: "+area);
  println("-------------------------------------------------");
}

void draw(){
  delay(200);
  background(255,255,255);
  
  for(Block block : block){
    block.draw();
  }
}
