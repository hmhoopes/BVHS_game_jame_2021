class Board{

  int thick = 25;
  int shade = 255;
  int height = 100;
  int screenLength;
  int screenHeight;
  public int x;
  public int y;
  
  Board(int screenlength, int screenHeight){
    this.screenLength = screenLength;
    this.screenHeight = screenHeight;
    x = 30 + 25;
    y = (screenHeight / 2);
  }
   
  public int getX(){
     return x; 
  }
  
  public int getY(){
     return y; 
  }
   
  public int getThick(){
     return thick; 
  }
   
  public int getHeight(){
     return height; 
  }
   
  public void move(int dir){
    y += dir * 20;
    if(y <= 0){
       y = 0; 
    }
    if(y >= screenHeight - height){
       y = screenHeight - height; 
    }
  }
  
  public void act(int dir){
    //move y
    move(dir);
    //draw board
    fill(shade);
    rect(x, y, thick, height); 
  }
   
}
