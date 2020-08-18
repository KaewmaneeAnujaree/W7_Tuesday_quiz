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
      ball[i] = new Ball(this.position_x+(this.size/2),this.position_y+(this.size/2),random(10,this.size));
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

int n=2;
Block[] block = new Block[n];
float area_block = 0;
float area_ball = 0;
float area = 0;
int windowSize = 300;

void setup(){
  size(300,300);
  background(255);
  for(int i=0; i<n; i++){
    block[i] = new Block(random(100,windowSize-50), random(100,windowSize-50), random(10,100));
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

/*void draw(){
  delay(200);
  background(255,255,255);
  for(Ball ball : ball){
    ball.draw();
  }
  for(Block block : block){
    block.draw();
  }
}

void mouseClicked(){
    check_circle = true;
    index_block = block.length-1;
    index_ball = ball.length-1;
    for(index_block = block.length-1;index_block>-1;index_block--){
      if(block[index_block].extraPower ==0 &&mouseX>block[index_block].position_x && mouseX< block[index_block].position_x+block[index_block].size && mouseY > block[index_block].position_y && mouseY< block[index_block].position_y+block[index_block].size){
        println(block[index_block].extraPower);
        for(int i=index_block; i<block.length-1;i++){
          block[i] = block[i+1];
        }
        block = (Block[]) shorten(block);
        area_block = 0;
        area = 0;
        for(int i=0; i<block.length; i++){
          area_block += block[i].get_area();
        }
        area = area_block+area_ball;
        println("area_block: "+area_block);
        println("area_ball: "+area_ball);
        println("Summary area: "+area);
        println("-------------------------------------------------");
        check_circle = false; 
        break;
      }
    }
    if(check_circle == true){
      for(index_ball = ball.length-1;index_ball>-1;index_ball--){
        if(ball[index_ball].extraPower == 0 && mouseX>ball[index_ball].position_x-(ball[index_ball].size/2) && mouseX< ball[index_ball].position_x+(ball[index_ball].size/2) && mouseY > ball[index_ball].position_y-(ball[index_ball].size/2) && mouseY< ball[index_ball].position_y+(ball[index_ball].size/2)){
          for(int i=index_ball; i<ball.length-1;i++){
            ball[i] = ball[i+1];
          }
          ball = (Ball[]) shorten(ball);
          area_ball = 0;
          area = 0;
          for(int i=0; i<ball.length; i++){
            area_ball += ball[i].get_area();
          }
          area = area_block+area_ball;
          println("area_block: "+area_block);
          println("area_ball: "+area_ball);
          println("Summary area: "+area);
          println("-------------------------------------------------");
          break;
        }
      }
    }
}*/
