int opinionX;
int opinionY;
int opinionwith = 30;
float winningR = 100;
float winningX = 600;
float winningY = 600;
int count;
float[][] players = new float[10][4];
int setplayeramount = 4;
int p =0;
int playerwith = 40;

void setup(){
  size(1200,1200);
  backgroundset(); //make background
  setplayersup();
  players();
  setwinnerpoint();
  winningpoint();

}

void draw(){
  count ++;
  backgroundset();
  players();
 
}

void backgroundset(){
   
   background(255);
   fill(255,50,50); //red
   noStroke();
   rect(0,595,1200,10); // Y-axis
   rect(595,0,10,1200); //X-axis
   
}

void setplayersup(){ //give the places for the players
  
  while(p < setplayeramount){ 
    players[p][0] = random(0,1200);  //set x value
    players[p][1] = random(0,1200);  //set y value
    p++;
  }
  p = 0;
}

void players(){ //creat the viual of the players 

 while(p < setplayeramount){ 
   fill(50,50,255);
   ellipse(players[p][0], players[p][1], playerwith, playerwith);
   p++;
 }
 p = 0; 
}

void opinion(){
 opinionX = 30; // exampels ''
 opinionY = 50; // ''
 fill(255,50,50);
 ellipse(opinionX, opinionY, opinionwith, opinionwith); //circle that resembels the opinion
 
}

void win(){
  if(sqrt(sq((opinionX+(opinionwith/2)) - (winningX+(winningR/2))) 
            + 
          sq((opinionY+(opinionwith/2)) - (winningY+(winningR/2))) )
     < winningR)
  {
    count = 0; //write to log files, in final stage
  
  }

}

void setwinnerpoint(){
  winningX = (players[1][0] + players[2][0] + players[3][0] + players[0][0]) / 4; 
  winningY = (players[1][1] + players[2][1] + players[3][1] + players[0][1]) / 4;
}

void winningpoint(){
  fill(50,50,255); 
  ellipse(winningX, winningY, 100, 100); 
}