
int rightroad=580;
float leftroad=100;
float middleroad=340;

float leftyellow1=leftroad+210;
float leftyellow2=leftroad+230;
float leftyellow3=middleroad-1;

float rightyellow1=rightroad-210;
float rightyellow2=rightroad-230;
float rightyellow3=middleroad+1;

PImage logo;
PImage cactus;
PImage dash;
PImage gameover;
PImage wheel;

int playcolor;
int exitcolor;
int retrycolor;
int quitcolor;

float accerx=594;
float accery=113.51999;

float accerx2=86;
float accery2=113.51999;

float size=10;
float size2=10;

float speedy=0;
float speedx1=0;
float speedx2=0;
float sizeI=0;

int skyr=23;
int skyg=238;
int skyb=255;


int minutes;
int hours;

int points;
int timer;

float deg;


boolean gamestart=false;
boolean dead=false;
boolean exit=false;

boolean go=false;
boolean left=false;
boolean right=false;

void setup() {
  cactus =loadImage("cactus.png");
  logo =loadImage("logo.png");
  dash =loadImage("dash.png");
  gameover =loadImage("gameover.png");
  wheel =loadImage("wheel.png");
  
 
 
  size(720, 480);
}

void draw() {
  
  
  minutes =minute();
  hours =hour();


  println(timer);


  background(0);

  fill(255, 255, 255);
  image(logo, 0, 0, 720, 480);
  textSize(25);
  fill(playcolor);
  rect(305, 273, 100, 40);
  fill(exitcolor);
  rect(305, 323, 100, 40);

  fill(255, 255, 255);
  text("Play", 330, 300);
  text("Exit", 330, 350);

  textSize(15);
  fill(0);
  text("(Alpha 1.0) Schlop Shop Games, Rights not Really Reserved", 5, 475);

  if (exit) {
    exit();
  }
  if (!gamestart) {
   
    
    timer=0;
    
    if (mouseX>305 && mouseX<405 && mouseY>273 && mouseY<313) {
      playcolor=50;
      if (mousePressed) {
        gamestart=true;
      }
    } else {
      playcolor=0;
    }
    if (mouseX>305 && mouseX<405 && mouseY>323 && mouseY<363) {
      exitcolor=50;
      if (mousePressed) {
        exit=true;
      }
    } else {
      exitcolor=0;
    }
  }

  if (gamestart) {//actual game
    
    
    background(skyr, skyg, skyb);//sky

    fill(255, 174, 23);//desert
    rect(0, 120, 720, 340);

    fill(70, 70, 70);
    triangle(leftroad, 380, rightroad, 380, middleroad, 120);//actual road (hyp is  about 354, its slope is about 1.08)

    fill(255, 226, 0);
    triangle(leftyellow1, 380, leftyellow2, 380, leftyellow3, 120);
    triangle(rightyellow1, 380, rightyellow2, 380, rightyellow3, 120);


    fill(0);//dashboard
    stroke(0);


    image(cactus, accerx, accery, size, size);
    image(cactus, accerx2, accery2, size2, size2);

    image(dash, 0, 0, 720, 480);
    
    
    

    fill(0, 255, 0);//clock and point counter
    
    textSize(15);
    text(points,395,401);
    text(hours, 635, 396);
    text(":"+minutes, 655, 396);
    
    translate(173,455);//steering wheel
    rotate(deg);
    image(wheel,-125,-125,250,250);

    if (hours>5 && hours<9) {//sunrise
      skyr=253;
      skyg=94;
      skyb=83;
    }
    if (hours>8 && hours<18) {//day
      skyr=23;
      skyg=238;
      skyb=255;
    }
    if (hours>16 && hours<21) {//sunset
      skyr=253;
      skyg=94;
      skyb=83;
    }
    if (hours>19 || (hours>0 && hours<7)) {//night
      skyr=0;
      skyg=2;
      skyb=46;
    }
    

    if (middleroad<240) {//boundaries
      dead=true;
    }
    if (middleroad>480) {
      dead=true;
    }

    if (accerx>717) {
      accerx=594;
      accery=113.51999;
      size=10;
    }
    if (accerx2<-140) {
      accerx2=86;
      accery2=113.51999;
      size2=10;
    }//cactus reset


    accery+=speedy; //movement
    accerx+=speedx1;
    size+=sizeI;
    accery2+=speedy;
    accerx2+=speedx2;
    size2+=sizeI;

    
    
    

    if (go) {
      timer+=1;
      speedy+=0.0108;
      speedx1+=0.01;
      speedx2+= -0.02;
      sizeI +=0.0125;
      rightroad+=1;
      leftroad+=1;
      middleroad+=1;
      leftyellow1+=1;
      leftyellow2+=1;
      leftyellow3+=1;
      rightyellow1+=1;
      rightyellow2+=1;
      rightyellow3+=1;
      
      if (left) {
      rightroad+=1;
      leftroad+=1;
      middleroad+=1;
      leftyellow1+=1;
      leftyellow2+=1;
      leftyellow3+=1;
      rightyellow1+=1;
      rightyellow2+=1;
      rightyellow3+=1;
    }
    if (right) {
      
      leftroad+=-2;
      rightroad+=-2;
      middleroad+=-2;
      leftyellow1+=-2;
      leftyellow2+=-2;
      leftyellow3+=-2;
      rightyellow1+=-2;
      rightyellow2+=-2;
      rightyellow3+=-2;
    }
    } else {
      speedy+= -0.0108;
      speedx1+= -0.01;
      speedx2+= 0.02;
      sizeI+= -0.0125;
    }

    if (speedx1>1 || speedx1==1) {
      speedy=1.08;
      speedx1=1;
      speedx2= -2;
      sizeI=1.25;
    }

    if (speedx1<0 || speedx1==0) {
      speedy=0;
      speedx1=0;
      speedx2= 0;
      sizeI=0;
    }
  }
  if (dead) {//gameover
  
    gamestart=false;
    image(gameover, 0, 0, 720, 480);
    fill(retrycolor);
    rect(600, 370, 100, 40);
    fill(quitcolor);
    rect(600, 430, 100, 40);
    textSize(25);
    fill(255, 255, 255);
    text("Retry", 617, 397);
    text("Exit", 625, 457);
    
    fill(169,0,188);
    text("Score: "+points,15,290);

    rightroad=580;
    leftroad=100;
    middleroad=340;
    leftyellow1=leftroad+210;
    leftyellow2=leftroad+230;
    leftyellow3=middleroad-1;
    rightyellow1=rightroad-210;
    rightyellow2=rightroad-230;
    rightyellow3=middleroad+1;
    speedy=0;
    speedx1=0;
    speedx2= 0;
    sizeI=0;

    gamestart=false;

    if (mouseX>600 && mouseX<700 && mouseY>370 && mouseY<410) {
      retrycolor=50; 
      if (mousePressed) {
        dead=false; 
        points=0;
        gamestart=true;
      }
    } else {
      retrycolor=0;
    }
    if (mouseX>600 && mouseX<700 && mouseY>430 && mouseY<470) {
      quitcolor=50;
      if (mousePressed) {
        exit=true;
      }
    } else {
      quitcolor=0;
    }
  }
  
  if(timer==214560 || timer > 214560){//doesnt update scoreboard
      points+=1;
      timer=0;
    }
    
}

void keyPressed() {
  if (keyCode==65) {
    left=true;
   deg=-.3;
  }//left

  if (keyCode==68) {
    right=true;
    deg=.3;
    
  }//right

  if (keyCode==32) {
    go=true;
  }
  //accerlate
}

void keyReleased() {
  if (keyCode==32) {
    go=false;
    
  }
  if (keyCode==65) {
    left=false;
    deg=0;
    
  }//left release

  if (keyCode==68) {
    right=false;
    deg=0;
   
  }//right release
}
