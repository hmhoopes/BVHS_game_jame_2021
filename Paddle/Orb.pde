class Ball{
  int radius = 12;
  int shade = 255;
  int screenLength;
  int screenHeight;
  int y;
  int x;
  int xVelo = 1;
  int xDir = 1;
  int yDir = 1;
  double yVelo = 3.5;
  public boolean ended = false;
 
  Ball(int screenLength, int screenHeight){
    this.screenLength = screenLength;
    this.screenHeight = screenHeight;
    
    x = screenLength / 2;
    y = screenHeight / 2;
  }
  
  private void collide(Board paddle){
    //only collide if ball is able to touch border 
     if(x + radius >= screenLength - 75){
         x = (screenLength - 75) - radius;
         //xVelo += 1;
         //yVelo = (Math.random() * 5) + .3;
         xDir *= -1;
         //yDir *= -1;
     }
     //or if in range of paddle
     if(x - radius <= (paddle.getX() + paddle.getThick())){
         if(y + radius >= paddle.getY() && y - radius  <= paddle.getY() + paddle.getHeight()){
             x = paddle.getX() + paddle.getThick() + radius;
             //xVelo += 1;
             //yVelo = (Math.random() * 5) + .3;
             xDir *= -1;
             //yDir *= -1;
        }
     }
     //or if in range of top
     if(y - radius <= 0){
         y = 0 + radius;
         yDir *= -1;
     }
     //or bottom
     if(y+radius >= screenHeight){
         y = screenHeight - radius;
         yDir *= -1;
     }
  }
  
  //checks if ball went off stage
  public boolean hitLeft(){
     if(x - radius <= 0)  {
        return true; 
     }
     return false;
  }
  
  //ends game
  public void gameOver(){
     yVelo = 0;
     xVelo = 0;
     x = screenLength/2;
     y = screenHeight/2;
     shade = 0;
     ended = true;
  }
  
  //resets everything when key pressed after game over
  public void restart(Board paddle){
     yVelo = 3.5;
     xVelo = 1;
     shade = 255;
     ended = false;
     paddle.x = 30 + 25;
     paddle.y = (screenHeight / 2);
  }
  
  public void act(Board paddle){
      collide(paddle);
      //ends game if ball went off the board
      if(hitLeft()){
         gameOver(); 
      }
      
      double deltaY = yDir * yVelo;
      int deltaX = xDir * xVelo * 5;
      y += deltaY;
      x += deltaX;
      
      fill(shade);
      circle(x, y, radius*2);
  }
}
