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

void setup() {
  size(800, 800); // use this to change window size
  backgroundset(); //make background
  setplayersup();
  drawPlayers();
  setwinnerpoint();
  drawWinningPoint();
  drawOpinions();
}

void draw() {
  if (win != 1) {
    count ++;
    win();
    backgroundset();
    drawPlayers();
    drawWinningPoint();
    opinions();
    StartFilter();
    voting();
    drawPlayers();
  } else {
    textSize(32);
    fill(0);
    text("WON", width/2, height/2);
    text(count, (width/2)+200, height/2);
  }
}

//backgroundset
void backgroundset() {

  background(255);
  fill(255, 50, 50); //red
  noStroke();
  rect(0, (height/2)-5, width, 10); // Y-axis
  rect((width/2)-5, 0, 10, height); //X-axis
}


//players; red
void setplayersup() { //give the places for the players
  while (p < setplayeramount) { 
    players[p][0] = random(0, width);  //set x value
    players[p][1] = random(0, height);  //set y value
    p++;
  }
  p = 0;
}

void drawPlayers() { //creat the visuals of the players 
  while (p < setplayeramount) { 
    fill(50, 0, 80); // red
    //ellipse(players[p][0], players[p][1], playerwith, playerwith); // !! doesnt seem to draw something
    p++;
  }
  p = 0;
}

//winning: green
void win() {
  p = 0;
  while (p < setplayeramount) {
    if ( abs(opinion[p][0] - winningX) <= 100 && abs(opinion[p][1] - winningY) <= 100)
    {
      win = 1;
    }
    p++;
  }
}

void setwinnerpoint() {
  p = 0;
  a = 0;
  q = 0;
  while (p < setplayeramount) {
    a = a + int(players[p][0]);
    q = q + int(players[p][1]);
    p ++;
  }
  if (p == setplayeramount) {
    winningX = a/setplayeramount;
    winningY = q/setplayeramount;
  }
}

void drawWinningPoint() {
  fill(50, 255, 50); // green
  ellipse(winningX, winningY, 100, 100);
}



//voting-start: blue 
void drawOpinions() { 
  while (p < setplayeramount) { 
    opinion[p][0] = players[p][0];
    opinion[p][1] = players[p][1];
    fill(50, 50, 255); // blue
    //ellipse(opinion[p][0], opinion[p][1], opinionwith, opinionwith); // !! doesnt seem to draw something
    p++;
  }
  p = 0;
}

void opinions() {
  while (p < setplayeramount) { 
    fill(50, 50, 255);
    ellipse(opinion[p][0], opinion[p][1], opinionwith, opinionwith);
    distance[p] = sqrt (sq(opinion[p][0] - winningX)+ sq((opinion[p][1])-winningY));
    p++;
  }
  p = 0;
}

//vilter
void StartFilter() { //start filter
  q = 0;
  p = 0;
  r = 0;
  while (q < (setplayeramount /2)) {
    s = min(distance);
    //print(s + "       ");
    while (p<setplayeramount) {
      if (distance[p] == s) {
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


void voting() {
  p = 0;
  while (p < setplayeramount) { 
    w = random(setplayeramount/2);
    print("this is w " + w + "    ");
    q = int(w);
    println("this is q " + q);
    opinion[p][0] = 
      opinionvote[q][0] - (opinionvote[q][0] - players[p][0]) / 2;
    //print("this is " + p + "s opinion" + opinion[p][0]);
    opinion[p][1] = 
      opinionvote[q][1] - (opinionvote[q][1] - players[p][1]) / 2;
    //print("this is " + p + "s opinion" + opinion[p][0]);
    p++;
  }
}
