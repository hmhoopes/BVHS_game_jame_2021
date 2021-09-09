//screen settings
int length = 1150;
int width = 1000;
int backgroundColor = 0;

void settings(){
   size(length, width); 
}

//spawn entities that will interact on screen
Board board = new Board(length, width);
Ball ball = new Ball(length, width);
//direction used by board, 0 means nothing, -1 means down, 1 means up
int dir;

//draw continuously on screen
//stuff at bottom of code will be drawn over stuff higher up
void draw(){
  //draw background
  background(backgroundColor);
  
  
  //animate entities on screen
  board.act(dir);
  dir = 0;
  
  ball.act(board);
  //draw borders
  fill(255);
  //border thickness
  int thick = 75;
  //side borders
  rect(length - thick, 0, thick, width); 
  
  //used to display text at game over
  if(ball.ended){
    fill(255);
    textSize(32);
    text("Press any key to restart", 500, 500); 
  }
}

void keyPressed(){
    dir = 0;
    //moves paddle up and down
    if (keyCode == RIGHT) {
      dir = 1;
    } else if (keyCode == LEFT) {
      dir = -1;
    } 
    
    //restarts after click after game over
    if(ball.ended){
       ball.restart(board); 
    }
}
