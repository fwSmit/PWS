int screenwidth = 800; //you need to adjust the size manualy
int screenhight = 800;
int q;
int r;
int p = 0;
int a = 0;
int win = 0;
float s;
float w;
float opinionX;
float opinionY;
int opinionwith = 30;
float winningR = 100;
float winningX = 600;
float winningY = 600;
int count;
float[][] players = new float[10][4]; //x = [0], y = [1]
float[][] opinion = new float[10][4];      //also mannualy adjust for players opinion[q][0] = x position opinion[p][y] = y position
float[][] opinionvote = new float[5][4];  //  places of the opinion that can be voted on
float[] distance = new float[4]; //mannualy adjust for amount of players (if you add a bunch you'll get 0 return in the min()function bc it does not call the rest arrays 'NULL' but 0) 
float  vote;  //   the random selected vote
float  min_distance;

int setplayeramount = 4; //maximum is 4
int playerwith = 40;

void setup(){
  size(800,800);
  backgroundset(); //make background
  setplayersup();
  players();
  setwinnerpoint();
  winningpoint();
  setopinion();
}

void draw(){
  if (win != 1){
  count ++;
  win();
  backgroundset();
  players();
  winningpoint();
  opinions();
  SF();
  voting();
  players();
  }else{
   textSize(32);
   fill(0);
   text("WON", screenwidth/2, screenhight/2);
   text(count, (screenwidth/2)+200, screenhight/2);
  }
}

//backgroundset

void backgroundset(){
   
   background(255);
   fill(255,50,50); //red
   noStroke();
   rect(0,(screenhight/2)-5,screenwidth,10); // Y-axis
   rect((screenwidth/2)-5,0,10,screenhight); //X-axis
   
}


//players; red

void setplayersup(){ //give the places for the players
  
  while(p < setplayeramount){ 
    players[p][0] = random(0,screenwidth);  //set x value
    players[p][1] = random(0,screenhight);  //set y value
    p++;
  }
  p = 0;
}

void players(){ //creat the viual of the players 

 while(p < setplayeramount){ 
   fill(255,50,50);
   ellipse(players[p][0], players[p][1], playerwith, playerwith);
   p++;
 }
 p = 0; 
}

//winning: green

void win(){
  p = 0;
 while(p < setplayeramount){
  if( abs(opinion[p][0] - winningX) <= 100 && abs(opinion[p][1] - winningY) <= 100)
  {
    win = 1;
  
  }
   p++;
 }
}

void setwinnerpoint(){
  winningX = (players[1][0] + players[2][0] + players[3][0] + players[0][0]) / 4; 
  winningY = (players[1][1] + players[2][1] + players[3][1] + players[0][1]) / 4;
}

void winningpoint(){
  fill(50,255,50); 
  ellipse(winningX, winningY, 100, 100); 
}



//voting-start: blue 

void setopinion(){
 while(p < setplayeramount){ 
   opinion[p][0] = players[p][0];
   opinion[p][1] = players[p][1];
   fill(50, 50, 255);
   ellipse(opinion[p][0], opinion[p][1], opinionwith, opinionwith);
   p++;
 }
 p = 0;
 
}

void opinions(){
   while(p < setplayeramount){ 
  fill(50, 50, 255);
   ellipse(opinion[p][0], opinion[p][1], opinionwith, opinionwith);
   distance[p]=
   sqrt (sq(opinion[p][0] - winningX)+ sq((opinion[p][1])-winningY));
   p++;
 }
 p = 0;
}

//vilter
void SF(){ //start filter
q = 0;
p = 0;
r = 0;
while(q < (setplayeramount /2)){
s = min(distance);
//print(s + "       ");
while(p<setplayeramount){
 if(distance[p] == s){
  opinionvote[r][0] = opinion[p][0]; 
  opinionvote[r][1] = opinion[p][1];
  //print("opinion vote x" + opinionvote[r][0] + "y" +opinionvote[r][1]);
  distance[p] = 9999999;
  r++;
 }
 p++;
}
q++;
}
q = 0;
p = 0;
}

 
void voting(){
 p = 0;
   while(p < setplayeramount){ 
   w = random(setplayeramount/2);
   //print("this is w " + w + "        ");
   q = int(w);
   //print("this is q " + q + "        ");
   opinion[p][0] = 
   opinionvote[q][0] - (opinionvote[q][0] - players[p][0]) / 2;
   //print("this is " + p + "s opinion" + opinion[p][0]);
   opinion[p][1] = 
   opinionvote[q][1] - (opinionvote[q][1] - players[p][1]) / 2;
   //print("this is " + p + "s opinion" + opinion[p][0]);
   p++;
 }
 }
 

 
 
 
 