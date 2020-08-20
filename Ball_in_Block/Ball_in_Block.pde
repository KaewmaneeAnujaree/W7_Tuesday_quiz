class Ball{
  float position_x,  position_y; //position X & Y of ball
  int size;  // size of ball
  float area; // area of ball
  int extraPower;
  
  Ball(float pos_x,float pos_y,float size){
    this.position_x = pos_x;
    this.position_y = pos_y;
    this.size = int(size);
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
  int size;  // size of block
  float area;
  int extraPower;
  int n = int(random(1,10));
  Ball[] ball = new Ball[n];
  
  Block(float pos_x,float pos_y,float size){
    this.position_x = pos_x;
    this.position_y = pos_y;
    this.size = int(size);
    extraPower = int(random(0,2));
    
    for(int i =0; i<ball.length; i++){
      float size_ball = random(10,this.size);
      ball[i] = new Ball(random(this.position_x+size_ball/2,this.position_x+this.size-size_ball/2),random(this.position_y+size_ball/2,this.position_y+this.size-size_ball/2),size_ball);
    }
  }

  void draw(){
    if(extraPower == 1){
      fill(random(0,255), random(0,255), random(0,255)); //random color
      rect(this.position_x, this.position_y, this.size, this.size); //draw ractangle
      for(int i = 0;i<ball.length;i++){
        ball[i].draw();
      }
    }else{
      fill(255, 255, 255); 
      rect(this.position_x, this.position_y, this.size, this.size);
      for(int i = 0;i<ball.length;i++){
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
double area_block = 0;
double area_ball = 0;
double area = 0;
int windowSize = 300;
int index_block;

void setup(){
  size(300,300);
  background(255);
  for(int i=0; i<n; i++){
    block[i] = new Block(random(20,windowSize-70), random(20,windowSize-70), random(50,100));
  }
  for(int i=0; i<n; i++){
    block[i].draw();
    area_block += block[i].get_area();
    for(int a = 0;a<block[i].ball.length;a++){
      area_ball += block[i].ball[a].get_area();
    }
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
void mouseClicked(){
  index_block = block.length-1;
  for(int indexBox = index_block;indexBox>-1;indexBox--){
    if(block[indexBox].extraPower == 0 &&mouseX>block[indexBox].position_x && mouseX< block[indexBox].position_x+block[indexBox].size && mouseY > block[indexBox].position_y && mouseY< block[indexBox].position_y+block[indexBox].size && block[indexBox].ball.length==0){
      area_block -= block[indexBox].get_area();
      for(int a = indexBox;a<block.length-1;a++){
        block[a] = block[a+1];
      }
      block = (Block[]) shorten(block);
      
      area = area_block+area_ball;
      println("area_block: "+area_block);
      println("area_ball: "+area_ball);
      println("Summary area: "+area);
      println("-------------------------------------------------");
      break;
    }else{
      for(int i = block[indexBox].ball.length-1;i>-1;i--){
        if(block[indexBox].ball[i].extraPower == 0 &&mouseX>block[indexBox].ball[i].position_x-(block[indexBox].ball[i].size/2) && mouseX< block[indexBox].ball[i].position_x+(block[indexBox].ball[i].size/2) && mouseY > block[indexBox].ball[i].position_y-(block[indexBox].ball[i].size/2) && mouseY< block[indexBox].ball[i].position_y+(block[indexBox].ball[i].size/2)){
          area_ball -= block[indexBox].ball[i].get_area();
          for(int a = i;a<block[indexBox].ball.length-1;a++){
            block[indexBox].ball[a] = block[indexBox].ball[a+1];
          }
          block[indexBox].ball = (Ball[]) shorten(block[indexBox].ball);

           
          area = area_block+area_ball;
          println("area_block: "+area_block);
          println("area_ball: "+area_ball);
          println("Summary area: "+area);
          println("-------------------------------------------------");
          break;
        }else if(block[indexBox].ball[i].extraPower == 1 &&mouseX>block[indexBox].ball[i].position_x-(block[indexBox].ball[i].size/2) && mouseX< block[indexBox].ball[i].position_x+(block[indexBox].ball[i].size/2) && mouseY > block[indexBox].ball[i].position_y-(block[indexBox].ball[i].size/2) && mouseY< block[indexBox].ball[i].position_y+(block[indexBox].ball[i].size/2)){
          break;
        }
      }
    }
  }
}
