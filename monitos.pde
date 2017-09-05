PFont f;
int fase;  // 0= inicio,1=seleccion de monitos, 2= pelea, 3= finde juego
int Cjugador1;
int Cjugador2;
int dx=6;
int isMoving=0;
int isReturning=0;
int y=50;
float delta;
int i;
int[] x= new int [800];
float [] x1 = new float[1000] ;
float [] y1 = new float[1000];
float [] dx1 = new float[10800] ;
float [] dy1 = new float[1000];
float delta1;
String vida1, vida2;


Carta jugador1, jugador2;

Carta newtS, newt, tina,unicornio,niffler,occamy,demiguise;
void setup()
{
  size(800,600);
  fase =0;
  f= createFont("HarryP",48,true);
  newt = new Carta(width/2 -90, height/2 - 70,0 );
  newtS= new Carta(20,0,0);
  tina = new Carta(240,0,1);
  unicornio =  new Carta(460,0,2);
  niffler = new Carta(20,300,3);
  occamy = new Carta(240,300,4);
  demiguise = new Carta(460,300,5);
   for (int i=0;i<800;i++){
    x[i]=floor(random(800));
  }
  
  for(int i=0; i<1000; i++){
    x1[i] = random(1000);
    y1[i] = random(1000);
    dx1[i] = random(-1,1);
    dy1[i]=random (-1,1);
  }
  
}
void draw()
{
 switch(fase){
   case 0: 
  background(#23568B);
      textFont(f,48);
    fill(#FFFF6F);
    textAlign(CENTER);
    text("Animales Fantásticos",width/2,height/4);
    textSize(30);
    text("presiona a Newt para comenzar ",400,250);
     newt.personaje.dibujar();
    break;
    
    case 1:
    background(#85ABAF);
    newtS.dibujar();
    tina.dibujar();
    unicornio.dibujar();
    niffler.dibujar();
    occamy.dibujar();
    demiguise.dibujar();
    
    textSize(18);
    fill(#627476);
    textAlign(CENTER);
    text("SELECCIONA\nA\nTU\nJUGADOR",730,270);
    
    break;
     
    case 2:
    dibujarFondo();
    

if(isMoving == 1)
    {
      if(jugador1.personaje.x>(jugador2.x + jugador2.ancho))
      {
        jugador1.personaje.x -=dx;
      }
      else
      {
        isMoving=0;
        isReturning=1;

        jugador2.vida -= (jugador1.ataque - jugador2.defensa);
        if(jugador2.vida<=0)
           fase = 3;
      }
    }


    if(isReturning==1)
    {
      if(jugador1.personaje.x < jugador1.x)
      {
        jugador1.personaje.x += dx;
      }
      else
      {
        isReturning = 0;
        isMoving = 2;
      }
    }


    if(isMoving == 2)
    {
      if(jugador2.personaje.x + jugador2.ancho < jugador1.x)
      {
         jugador2.personaje.x +=dx;
      }
      else
      {
        isMoving=0;
        isReturning=2;

        jugador1.vida -= (jugador2.ataque - jugador1.defensa);
        if(jugador1.vida<=0)
 
          fase = 3;
          
      }
    }

fill(#FFF04B);
    textSize(48);
    vida1 = "J1: " + str(jugador1.vida);text(vida1, 500,50);
    vida2 = "J2: " + str(jugador2.vida);  text(vida2, 100,50);
    textSize(18);
    text("haz click para atacar",500,70);
          



    if(isReturning==2)
    {
      if(jugador2.personaje.x > jugador2.x)
      {
        jugador2.personaje.x -= dx;
      }
      else
      {
        isReturning = 0;
      }
    }

    jugador1.dibujar();
    jugador2.dibujar();


    break;
    
    case 3:
 dibujarFondo();
 
 delta1+=0.5;
 
  
  background(255);
  noStroke();
if(jugador2.vida<=0){
  
  textSize(48);
    fill(#5437DB);
    textAlign(RIGHT);
    text("ERES EL GANADOR!!!",700,200);
    textSize(18);
    text("click aqui para jugar de nuevo",500,400);
    jugador1.personaje.dibujar();
   
 
  for (int i =0 ; i < 1000 ; i++){
    fill(0);
    
    x1[i] +=dx1[i];
   fill(random(0,255),random(0,255),random(0,255));
  
    ellipse(x1[i] , y1[i] ,10,10);
  }
}
if ((jugador1.vida<=0)){
  
   
  textSize(48);
    fill(#5437DB);
    textAlign(RIGHT);
    text("Perdiste!!",500,200);
    textSize(18);
    text("click aqui para jugar de nuevo",500,400);
    jugador2.personaje.dibujar();
   
 
  for (int i =0 ; i < 1000 ; i++){
    fill(0);
    
    x1[i] +=dx1[i];
   fill(random(0,255),random(0,255),random(0,255));
  
    ellipse(x1[i] , y1[i] ,10,10);
  }
}
 
 
 }
}

void mouseClicked()
{
  switch(fase){
    case 0:
    if(mouseX>newt.x && mouseX < (newt.x + newt.ancho))
      if(mouseY>newt.y && mouseY < (newt.y + newt.alto))
        {
          fase=1;
        } 
      break;
      
     case 1:
     
     isMoving = random(1)< 0.5 ? 0: 2;
     
      if(newtS.dioClick()==1)
        Cjugador1=0;
      if(tina.dioClick()==1)
      Cjugador1=1;
      if(unicornio.dioClick()==1)
      Cjugador1=2;
      if(niffler.dioClick()==1)
      Cjugador1=3;
      if(occamy.dioClick()==1)
      Cjugador1=4;
      if(demiguise.dioClick()==1)
      Cjugador1=5;
      
      Cjugador2 = (int)random(5);
      
      jugador1 = new Carta(500, 200, Cjugador1);
      jugador2 = new Carta(100, 200, Cjugador2);
      
      fase = 2;
       
     break;
     
     case 2:
       if(isMoving == 0 && isReturning == 0)
       isMoving = 1;
     break;
     
     case 3:
     
       if(mouseX<500 && mouseX >300)
        if(mouseY>380&&mouseY<410)
        fase = 1;
     isMoving = 0;
     isReturning = 0;
{

}
      
  }
}

   void dibujarFondo(){
      
       
       background(255);
  noStroke();
  
   
  for (int i=0;i<800; i++){ 
  
  fill(i);
  ellipse (x[i],i,100,100);
  
  }

   } 
   
   
   class Personajes {
public int  x;
public int  y;
public int ancho;
public int alto;
public int numPers;


Personajes(int x1, int y1,int numPers1 ){
 x=x1;
 y=y1;
 ancho=200;
 alto=300;
 numPers =numPers1;
}

void dibujar(){
switch (numPers){
case 0:
dibujarNewt();
break;

case 1:
dibujarTina();
break;

case 2:
dibujarUnicornio();
break;

case 3:
dibujarNiffler();
break;

case 4:
dibujarOccamy();
break;

case 5:
dibujarDemiguise();
break;

}
}

void dibujarNewt(){
  //maleta_1
  stroke(#70492A);
  fill(#70492A);
  rect(x+40,y+90,90,40);
   //cuerpo
   stroke(#1D2730);
  fill(#1D2730);
  rect(x+70,y+110,10,30,5);
  stroke(#1D2730);
  fill(#1D2730);
  rect(x+100,y+110,10,30,5);
  stroke(#87653C);
  fill(#87653C);
  rect(x+80,y+110,20,30,5);
  
  //maleta
  stroke(#251401);
  fill(#251401);
  rect(x+40,y+130,90,20);
  stroke(#C1BD7E);
  fill(#C1BD7E);
  rect(x+120,y+140,5,3);
  stroke(#C1BD7E);
  fill(#C1BD7E);
  rect(x+50,y+140,5,3);
  stroke(#C1BD7E);
  fill(#C1BD7E);
  ellipse(x+127,y+147,5,5);
  ellipse(x+45,y+147,5,5);
  
  //cabeza
  stroke(#D4A790);
  fill(#D4A790);
  rect(x+70,y+80,40,30,10);
  
  //cabello
  stroke(#8E5B1D);
  fill(#8E5B1D);
  ellipse(x+70,y+100,5,5);
  ellipse(x+75,y+95,8,8);
  ellipse(x+80,y+90,8,8);
  ellipse(x+85,y+85,8,8); 
  ellipse(x+90,y+80,8,8);
  ellipse(x+95,y+75,8,8);
  ellipse(x+100,y+75,8,8);
  ellipse(x+100,y+70,8,8);
  ellipse(x+95,y+70,8,8);
  ellipse(x+90,y+70,8,8);
  ellipse(x+85,y+70,8,8);
  ellipse(x+80,y+70,8,8);
  ellipse(x+90,y+75,8,8);
  ellipse(x+85,y+75,8,8);
  ellipse(x+80,y+75,8,8);
  ellipse(x+75,y+75,8,8);
  ellipse(x+70,y+75,8,8);
  ellipse(x+85,y+80,8,8);
  ellipse(x+80,y+80,8,8);
  ellipse(x+75,y+80,8,8);
  ellipse(x+70,y+80,8,8);
  ellipse(x+65,y+80,8,8);
  ellipse(x+60,y+80,8,8);
  ellipse(x+80,y+85,8,8);
  ellipse(x+75,y+85,8,8);
  ellipse(x+70,y+85,8,8);
  ellipse(x+65,y+85,8,8);
  ellipse(x+80,y+90,8,8);
  ellipse(x+75,y+90,8,8);
  ellipse(x+70,y+90,8,8);
  ellipse(x+75,y+95,8,8);
  ellipse(x+70,y+100,8,8);
  ellipse(x+65,y+95,8,8);
  ellipse(x+105,y+75,8,8);
  ellipse(x+95,y+80,8,8);
  ellipse(x+90,y+80,8,8);
  ellipse(x+105,y+80,8,8);
  ellipse(x+100,y+80,8,8);
  ellipse(x+60,y+80,8,8);
  ellipse(x+110,y+85,8,8);
  ellipse(x+110,y+90,8,8);
  //ojos
  stroke(#334E38);
  fill(#334E38);
  ellipse(x+80,y+100,5,10);
  stroke(#334E38);
  fill(#334E38);
  ellipse(x+100,y+100,5,10);

}

void dibujarTina(){
  
  //TINA
   //maleta_1
   stroke(#70492A);
  fill(#70492A);
  rect(x+40,y+90,90,40);
  
   //cuerpo
   stroke(#9EA7C4);
  fill(#9EA7C4);
  rect(x+70,y+110,10,30,5);
  stroke(#9EA7C4);
  fill(#9EA7C4);
  rect(x+100,y+110,10,30,5);
  stroke(#18161A);
  fill(#18161A);
  rect(x+80,y+110,20,30,5);
  
  //maleta
  stroke(#251401);
  fill(#251401);
  rect(x+40,y+130,90,20);
  stroke(#C1BD7E);
  fill(#C1BD7E);
  rect(x+120,y+140,5,3);
  stroke(#C1BD7E);
  fill(#C1BD7E);
  rect(x+50,y+140,5,3);
  stroke(#C1BD7E);
  fill(#C1BD7E);
  ellipse(x+127,y+147,5,5);
  ellipse(x+45,y+147,5,5);
  
   //cabeza
   stroke(#C08B77);
  fill(#C08B77);
  rect(x+70,y+80,40,30,10);
  
  //ojos
  stroke(#442723);
  fill(#442723);
  ellipse(x+80,y+100,5,10);
  stroke(#442723);
  fill(#442723);
  ellipse(x+100,y+100,5,10);
  
  //cabello
  stroke(#4D3A22);
  fill(#4D3A22);
  ellipse(x+60,y+110,8,8);
  ellipse(x+65,y+110,8,8);
  ellipse(x+70,y+110,8,8);
  ellipse(x+60,y+105,8,8);
  ellipse(x+65,y+105,8,8);
  ellipse(x+70,y+105,8,8);
  ellipse(x+65,y+100,8,8);
  ellipse(x+70,y+100,8,8);
  ellipse(x+65,y+95,8,8);
  ellipse(x+70,y+95,8,8);
  ellipse(x+65,y+90,8,8);
  ellipse(x+70,y+90,8,8);
  ellipse(x+65,y+85,8,8);
  ellipse(x+70,y+85,8,8);
  ellipse(x+70,y+80,8,8);
  ellipse(x+75,y+80,8,8);
  ellipse(x+80,y+80,8,8);
  ellipse(x+85,y+80,8,8);
  ellipse(x+90,y+80,8,8);
  ellipse(x+95,y+80,8,8);
  ellipse(x+100,y+80,8,8);
  ellipse(x+105,y+80,8,8);
  ellipse(x+110,y+80,8,8);
  ellipse(x+110,y+85,8,8);
  ellipse(x+115,y+85,8,8);
  ellipse(x+110,y+90,8,8);
  ellipse(x+115,y+90,8,8);
  ellipse(x+110,y+95,8,8);
  ellipse(x+115,y+95,8,8);
  ellipse(x+110,y+100,8,8);
  ellipse(x+115,y+100,8,8);
  ellipse(x+110,y+105,8,8);
  ellipse(x+115,y+105,8,8);
  ellipse(x+120,y+105,8,8);
  ellipse(x+110,y+110,8,8);
  ellipse(x+115,y+110,8,8);
  ellipse(x+120,y+110,8,8);
}

void dibujarUnicornio(){
   //cabeza
  stroke(#FFFFFF);
  fill(#FFFFFF);
  ellipse(x+70,y+90,45,30);
   //pelo
  stroke(#3E0534);
  fill(#3E0534);
 ellipse(x+50,y+75,5,5);
  ellipse(x+60,y+75,15,15);
  ellipse(x+70,y+75,20,20);
  ellipse(x+80,y+75,20,20);
  ellipse(x+90,y+80,15,15);
  ellipse(x+90,y+85,15,15);
  ellipse(x+90,y+90,10,10);
  ellipse(x+90,y+95,5,5);
  
  //ojos
  stroke(#E54D7A);
  fill(#E54D7A);
  ellipse(x+70,y+90,5,5);
  stroke(#F98CA6);
  fill(#F98CA6);
  ellipse(x+70,y+95,10,5);
  //cuerno
  stroke(#FFDE67);
  fill(#FFDE67);
  ellipse(x+70,y+70,10,10);
  ellipse(x+65,y+65,10,10);
  ellipse(x+60,y+60,8,8);
  
  //cuerpo
  stroke(#FFFFFF);
  fill(#FFFFFF);
  arc(x+100,y+110,65,30,radians(180),radians(360));
  stroke(#CECFD4);
  fill(#CECFD4);
  arc(x+100,y+110,65,30,radians(0),radians(180));
  //patas
  ellipse(x+80,y+120,10,20);
  ellipse(x+90,y+120,10,20);
  ellipse(x+120,y+120,10,20);
  ellipse(x+130,y+120,10,20);
  //cola
  stroke(#3E0534);
  fill(#3E0534);
  ellipse(x+140,y+120,15,15);
  ellipse(x+140,y+110,15,15);
  ellipse(x+150,y+100,15,15);
  ellipse(x+150,y+110,20,20);
  ellipse(x+160,y+120,20,20);
  ellipse(x+150,y+120,20,20);
  ellipse(x+160,y+130,15,15);
  ellipse(x+160,y+135,15,15);
  ellipse(x+164,y+140,15,15);
}
void dibujarNiffler(){
    stroke(0);
  fill(0);
  rect(x+70,y+80, 60,48,5);
  rect(x+85,y+100,35,55,5);
  //cara
  stroke(#F2DCC1);
  fill(#F2DCC1);
  rect(x+80,y+90,40,28,5);
  //pico
  stroke(#FADD7C);
  fill(#FADD7C);
  rect(x+80,y+110,40,10);
 stroke(#F7D257);
  fill(#F7D257);
  rect(x+80,y+115,40,5);
  
  //ojos
  stroke(0);
  fill(0);
  ellipse(x+90,y+100,10,12);
  ellipse(x+110,y+100,10,12);
  //pies
  stroke(#F7CD98);
  fill(#F7CD98);
  rect(x+85,y+150,10,15,5);
  rect(x+110,y+150,10,15,5);
  rect(x+95,y+135,5,10);
  rect(x+105,y+135,5,10);
  stroke(#FCE31C);
  fill(#FCE31C);
  ellipse(x+103,y+140,10,10);
}
void dibujarOccamy(){
  stroke(#00BBB9);
  fill(#00BBB9);
  ellipse(x+90,y+140,20,20);
  stroke(#00BBB9);
  fill(#00BBB9);
  arc(x+100,y+140,30,30, radians(270), radians(450));
  stroke(#005665);
  fill(#005665);
  arc(x+100,y+140,30,30, radians(90), radians(270));
  stroke(#006A5F);
  fill(#006A5F);
  arc(x+110,y+150,30,30, radians(270), radians(450));
  stroke(#007C7D);
  fill(#007C7D);
  arc(x+110,y+150,30,30,radians(90), radians(270) );
  stroke(#00637C);
  fill(#00637C);
  arc(x+120,y+150,30,30,radians(270), radians(450) );
  stroke(#37DCE0);
  fill(#37DCE0);
  arc(x+120,y+150,30,30,radians(90), radians(270) );
  stroke(#8EEFE1);
  fill(#8EEFE1);
  arc(x+130,y+150,30,30,radians(270), radians(450) );
  stroke(#003E51);
  fill(#003E51);
  arc(x+130,y+150,30,30,radians(90), radians(270));
  stroke(#5F6BA4);
  fill(#5F6BA4);
  arc(x+120,y+160,15,15,radians(270), radians(450));
  stroke(#74BBD0);
  fill(#74BBD0);
  arc(x+120,y+160,15,15,radians(90), radians(270));
  
  //PICO
  fill(#FFDE6F);
  triangle(x+80,y+100,x+120,y+100,x+100,y+140);
  
  //cabeza
  stroke(#00BBB9);
  fill(#00BBB9);
  rect(x+80,y+100,40,30,7);
  //CUERNOS
   fill( #7A02D1);
   ellipse(x+120,y+100,18,18);
   ellipse(x+125,y+97,15,15);
  fill(#8600E8);
 ellipse(x+128,y+89,15,15);
   
    fill(#480090);
  ellipse(x+132,y+82,14,14);
  ellipse(x+130,y+76,12,12);
  ellipse(x+128,y+71,10,10);
  ellipse(x+126,y+67,8,8);
  ellipse(x+124,y+64,6,6);
  
    fill( #7A02D1);
   ellipse(x+80,y+100,18,18);
   ellipse(x+78,y+97,15,15);
  fill(#8600E8);
 ellipse(x+76,y+89,15,15);
 
  fill(#480090);
  ellipse(x+74,y+82,14,14);
  ellipse(x+76,y+76,12,12);
  ellipse(x+78,y+71,10,10);
  ellipse(x+80,y+67,8,8);
  ellipse(x+82,y+64,6,6);
  
  //ALAS
  triangle(x+110,y+140,x+170,y+50,x+180,y+80);
  triangle(x+85,y+140,x+10,y+60,x+10,y+100);
  
  //OJOS
  fill(0);
  ellipse(x+90,y+120,5,10);
  fill(0);
  ellipse(x+110,y+120,5,10);
}
void dibujarDemiguise(){
  stroke(#E3E0E0);
  fill(#E3E0E0);
  //patas de abajo
  ellipse(x+100,y+170,20,40);
  ellipse(x+120,y+170,20,40);
  ellipse(x+140,y+170,20,40);
  //patas 2
  stroke(#C6C6C6);
  fill(#C6C6C6);
  ellipse(x+100,y+150,20,40);
  ellipse(x+100,y+150,20,40);
  ellipse(x+120,y+150,20,40);
  ellipse(x+140,y+150,20,40);
  //patas 3
    stroke(#B2B2B2);
  fill(#B2B2B2);
  ellipse(x+130,y+130,20,40);
    stroke(#B2B2B2);
  fill(#B2B2B2);
  ellipse(x+110,y+130,20,40);
    stroke(#B2B2B2);
  fill(#B2B2B2);
  ellipse(x+90,y+130,20,40);
    stroke(#B2B2B2);
  fill(#B2B2B2);
  ellipse(x+70,y+130,20,40);
  //cabeza
  stroke(#909090);
  fill(#909090);
  ellipse(x+100,y+90,30,40);
  ellipse(x+80,y+90,30,40);
  ellipse(x+100,y+90,30,40);
  ellipse(x+120,y+90,30,40);
  ellipse(x+60,y+110,30,40);
  ellipse(x+80,y+110,30,40);
  ellipse(x+100,y+110,30,40);
  ellipse(x+120,y+110,30,40);
  stroke(#FFF0C9);
  fill(#FFF0C9);
  ellipse(x+70,y+100,30,40);
  ellipse(x+110,y+100,30,40);
  //ojos
  stroke(#FAE681);
  fill(#FAE681);
  ellipse(x+70,y+100,30,30);
  fill(#FAE681);
  ellipse(x+110,y+100,30,30);
  fill(0);
  stroke(0);
  ellipse(x+70,y+100,15,15);
  ellipse(x+110,y+100,15,15);
  
  stroke(#FFF0C9);
  fill(#FFF0C9);
  rect(x+90,y+180,25,15);
  rect(x+130,y+180,25,15);
  ellipse(x+130,y+160,15,25);
  ellipse(x+90,y+160,15,25);
}
}


class Carta{
  PFont f;
 int  x;
 int  y;
 int ancho;
 int alto;
 int numCarta;
 int nBolitas= 40;
float [] xi = new float[nBolitas] ;
float [] yi = new float[nBolitas];
float [] dx = new float[nBolitas] ;
float [] dy = new float[nBolitas];
float delta;
int caso = 0;

float [] x2 = new float[40] ;
float [] y2 = new float[40];
float [] dx2 = new float[40] ;
float [] dy2 = new float[40];
float delta1;

float [] x3 = new float[800] ;
float [] y3 = new float[800];
float [] dx3 = new float[800] ;
float [] dy3 = new float[800];
float delta3;

float [] x4 = new float[800] ;
float [] y4 = new float[800];
float [] dx4 = new float[800] ;
float [] dy4 = new float[800];
float delta4;

 int vida;
 int ataque;
 int defensa;
 
 

 Personajes personaje;
 
 Carta(int x1, int y1, int numcarta1 ){
 x=x1;
 y=y1;
 ancho=200;
 alto=300;
 numCarta= numcarta1;
 personaje= new Personajes(x1,y1,numcarta1);
 vida=5;
 
 for(int i=0; i<nBolitas; i++){
    xi[i] = x + random(ancho);
    yi[i] = y+random(alto);
    dx[i] = random(-0.5,0.5);
    dy[i]=random (-0.5,0.5);
  }

    if(caso==0){
    matrizAleatoria();
  }
  else{
    
  } 

for(int i=0; i<40; i++){
    x2[i] = x+random(ancho);
    y2[i] = y+random(alto);
    dx2[i] = random(-1,1);
    dy2[i]=random (-1,1);
  }

for(int i=0; i<40; i++){
    x3[i] = x+random(ancho);
    y3[i] = y+random(alto);
    dx3[i] = random(-1,1);
    dy3[i]=random (-1,1);
  }
  
  for(int i=0; i<40; i++){
    x4[i] = x+random(ancho);
    y4[i] = y+random(alto);
    dx4[i] = random(-1,1);
    dy4[i]=random (-1,1);
  }

}




void dibujar()
{
  switch(numCarta){
    case 0: 
    fill(#39D7F5);
    rect(x,y,ancho,alto);
     for (int i =0 ; i < nBolitas ; i++){
    fill(#BFFDFF);
    
    xi[i] +=dx[i];
    yi[i] += dy[i];
    ellipse(xi[i] , yi[i] ,5,5);
    
    if(xi[i]>=x+ancho)
      dx[i]= -dx[i];
    if(xi[i]<=x)
      dx[i] = -dx[i];
    if(yi[i]>=y+alto)
      dy[i]= -dy[i];
    if(yi[i]<=y)
      dy[i]= -dy[i];
    
  }
    fill(#8BEDFF);
    textSize(15);
  textAlign(CENTER);
    text("Newt Scamander",x+100,y+20);
    textSize(10);
    fill(#FAB41C);
    textAlign(LEFT);
    text("ATAQUE/7",x+20,y+210);
    textAlign(RIGHT);
    text("DEFENSA/3",x+180,y+210);
    fill(#195989);
    textAlign(LEFT);
    text("magizoólogo,orden de merlin,\n primera clase",x+20, y+240);
    personaje.dibujar();
    ataque=7;
    defensa=3;
    break;
    
    case 1:
    matrizAleatoria();
     fill(#4D0C7C);
     textSize(15);
  textAlign(CENTER);
    text("Tina Goldstein",x+100,y+20);
    textSize(10);
    fill(#751AB7);
    textAlign(LEFT);
    text("ATAQUE/5",x+20,y+210);
    textAlign(RIGHT);
    text("DEFENSA/2",x+180,y+210);
    textSize(11);
    fill(#500443);
    textAlign(LEFT);
    text("trabajó como aurora y \n posterioremente\n en la oficina de registro de\n varitas para magos extranjeros.",x+20,y+240);
    personaje.dibujar();
    ataque=5;
    defensa=2;
    break;
    
    case 2:
        
     fill(#E397F5);
     rect(x,y,ancho,alto);
      for (int i =0 ; i < 40 ; i++){
    fill(0);
    
    x2[i] +=dx2[i];
   fill(random(0,255),random(0,255),random(0,255));
  
    ellipse(x2[i] , y2[i] ,10,10);
    
     if(x2[i]>=ancho)
      dx2[i]= -dx2[i];
    if(x2[i]<=0)
      dx2[i] = -dx2[i];
    if(y2[i]>=alto)
      dy2[i]= -dy2[i];
    if(y2[i]<=0)
      dy2[i]= -dy2[i];
    
  }
  fill(#FF1CDA);
  textSize(15);
  textAlign(CENTER);
    text("Unicornio",x+100,y+20);
    textSize(12);
    fill(#2EFFAA);
    textAlign(LEFT);
    text("ATAQUE/6",x+20,y+210);
    textAlign(RIGHT);
    text("DEFENSA/3",x+180,y+210);
    textSize(10);
    textAlign(LEFT);
    fill(#03A060);
    text(" carácter noble, puro y muy espiritual",x+20,y+240);
    personaje.dibujar();
    ataque=6;
    defensa=3;
    break;
     
     case 3:
         fill(#8B8659);
    rect(x,y,ancho,alto);
    for (int i =0 ; i < 40 ; i++){
    fill(0);
    
    x3[i] +=dx3[i];
   fill(#FFF6A7);
  
    ellipse(x3[i] , y3[i] ,10,10);
    
    if(x3[i]>=ancho)
      dx3[i]= -dx3[i];
    if(x3[i]<=x)
      dx3[i] = -dx3[i];
    if(y3[i]>=alto)
      dy3[i]= -dy3[i];
    if(y3[i]<=y)
      dy3[i]= -dy3[i];
  }
  
    textSize(15);
     fill(#C4C15D);
  textAlign(CENTER);
    text("Niffler",x+100,y+20);
    textSize(10);
    fill(#B2AD19);
    textAlign(LEFT);
    text("ATAQUE/5",x+20,y+210);
    textAlign(RIGHT);
    text("DEFENSA/2",x+180,y+210);
    textSize(10);
    textAlign(LEFT);
    fill(#A7E312);
    text("criatura que busca tesoros\n con un hocico largo y delgado.\n Ellos se sienten muy atraídos\n hacia las cosas brillantes ",x+20,y+240);
 personaje.dibujar();
 ataque=5;
    defensa=2;
    break;
    
       case 4:
           fill(#FFD86E);
    rect(x,y,ancho,alto);
    
    
    for(int i=0;i<=200;i+=10)
  {
    fill (i,random(0,255),255);
    ellipse (x+i,y,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+10,random(0,255),255);
    ellipse (x+i,y+10,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+20,random(0,255),255);
    ellipse (x+i,y+20,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+30,random(0,255),255);
    ellipse (x+i,y+30,20,20);

 }
 for(int i=0;i<=200;i+=10)
  {
    fill (i+40,random(0,255),255);
    ellipse (x+i,y+40,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+50,random(0,255),255);
    ellipse (x+i,y+50,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+60,random(0,255),255);
    ellipse (x+i,y+60,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+70,random(0,255),255);
    ellipse (x+i,y+70,20,20);
}

 for(int i=0;i<=200;i+=10)
  {
    fill (i+80,random(0,255),255);
    ellipse (x+i,y+80,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+90,random(0,255),255);
    ellipse (x+i,y+90,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+100,random(0,255),255);
    ellipse (x+i,y+100,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+110,random(0,255),255);
    ellipse (x+i,y+110,20,20);
}

 for(int i=0;i<=200;i+=10)
  {
    fill (i+120,random(0,255),255);
    ellipse (x+i,y+120,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+130,random(0,255),255);
    ellipse (x+i,y+130,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+140,random(0,255),255);
    ellipse (x+i,y+140,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+150,random(0,255),255);
    ellipse (x+i,y+150,20,20);
}


 for(int i=0;i<=200;i+=10)
  {
    fill (i+150,random(0,255),255);
    ellipse (x+i,y+160,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+140,random(0,255),255);
    ellipse (x+i,y+170,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+130,random(0,255),255);
    ellipse (x+i,y+180,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+120,random(0,255),255);
    ellipse (x+i,y+190,20,20);
}

 for(int i=0;i<=200;i+=10)
  {
    fill (i+110,random(0,255),255);
    ellipse (x+i,y+200,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+110,random(0,255),255);
    ellipse (x+i,y+210,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+90,random(0,255),255);
    ellipse (x+i,y+220,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+80,random(0,255),255);
    ellipse (x+i,y+230,20,20);
}
 for(int i=0;i<=200;i+=10)
  {
    fill (i+70,random(0,255),255);
    ellipse (x+i,y+240,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+60,random(0,255),255);
    ellipse (x+i,y+250,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+50,random(0,255),255);
    ellipse (x+i,y+260,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+40,random(0,255),255);
    ellipse (x+i,y+270,20,20);
}
 for(int i=0;i<=200;i+=10)
  {
    fill (i+30,random(0,255),255);
    ellipse (x+i,y+280,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+20,random(0,255),255);
    ellipse (x+i,y+290,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+10,random(0,255),255);
    ellipse (x+i,y+300,20,20);

  }
    
     fill(#FFFBF7);
  textAlign(CENTER);
  textSize(15);
    text("Occamy",x+100,y+20);
    fill(0);
    textAlign(LEFT);
    textSize(10);
    text("ATAQUE/7",x+20,y+210);
    textAlign(RIGHT);
    text("DEFENSA/3",x+180,y+210);
    textSize(10);
    textAlign(LEFT);
    fill(0);
    text("cruce entre un dragón y un pájaro\ntiene la habilidad de crecer o \nencogerse para encajar en su entorno ",x+20,y+240);
    personaje.dibujar();
    ataque=6;
    defensa=3;
    break;
    
          case 5:
     noStroke();
    for(int i=0;i<=200;i+=10)
  {
    fill (i,random(0,255));
    ellipse (x+i,y,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+10,random(0,255));
    ellipse (x+i,y+10,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+20,random(0,255));
    ellipse (x+i,y+20,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+30,random(0,255));
    ellipse (x+i,y+30,20,20);

 }
 for(int i=0;i<=200;i+=10)
  {
    fill (i+40,random(0,255));
    ellipse (x+i,y+40,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+50,random(0,255));
    ellipse (x+i,y+50,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+60,random(0,255));
    ellipse (x+i,y+60,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+70,random(0,255));
    ellipse (x+i,y+70,20,20);
}

 for(int i=0;i<=200;i+=10)
  {
    fill (i+80,random(0,255));
    ellipse (x+i,y+80,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+90,random(0,255));
    ellipse (x+i,y+90,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+100,random(0,255));
    ellipse (x+i,y+100,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+110,random(0,255));
    ellipse (x+i,y+110,20,20);
}

 for(int i=0;i<=200;i+=10)
  {
    fill (i+120,random(0,255));
    ellipse (x+i,y+120,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+130,random(0,255));
    ellipse (x+i,y+130,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+140,random(0,255));
    ellipse (x+i,y+140,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+150,random(0,255));
    ellipse (x+i,y+150,20,20);
}


 for(int i=0;i<=200;i+=10)
  {
    fill (i+150,random(0,255));
    ellipse (x+i,y+160,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+140,random(0,255));
    ellipse (x+i,y+170,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+130,random(0,255));
    ellipse (x+i,y+180,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+120,random(0,255));
    ellipse (x+i,y+190,20,20);
}

 for(int i=0;i<=200;i+=10)
  {
    fill (i+110,random(0,255));
    ellipse (x+i,y+200,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+110,random(0,255));
    ellipse (x+i,y+210,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+90,random(0,255));
    ellipse (x+i,y+220,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+80,random(0,255));
    ellipse (x+i,y+230,20,20);
}
 for(int i=0;i<=200;i+=10)
  {
    fill (i+70,random(0,255));
    ellipse (x+i,y+240,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+60,random(0,255));
    ellipse (x+i,y+250,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+50,random(0,255));
    ellipse (x+i,y+260,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+40,random(0,255));
    ellipse (x+i,y+270,20,20);
}
 for(int i=0;i<=200;i+=10)
  {
    fill (i+30,random(0,255));
    ellipse (x+i,y+280,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+20,random(0,255));
    ellipse (x+i,y+290,20,20);

 }
  for(int i=0;i<=200;i+=10)
  {
    fill (i+10,random(0,255));
    ellipse (x+i,y+300,20,20);

  }
   
        
     fill(#5BEDD8);
  textAlign(CENTER);
  textSize(15);
    text("Demiguise",x+100,y+20);
    fill(#FCA517);
    textAlign(LEFT);
    textSize(10);
    text("ATAQUE/6",x+20,y+210);
    textAlign(RIGHT);
    text("DEFENSA/2",x+180,y+210);
    textAlign(LEFT);
    fill(#4BCEBE);
    text("habilidad de hacerse invisible\n tiene visiones precognitivas",x+20,y+240);
    
    personaje.dibujar();
    ataque=6;
    defensa=2;
    break;
    
    
    
  }
    
}
void matrizAleatoria(){
    for(int i=0 ; i<ancho;i+=20){
   for(int j=0 ; j<alto; j+=20){
    fill(random(80,255),random(80,235), random(80,235));
     rect(x+i,y+j,20,20);
   }
 }
 }

int dioClick()
{
  if(mouseX>x && mouseX < (x + ancho))
      if(mouseY>y && mouseY < (y + alto))
        {
          return 1;
        } 
   return 0;
}

}
 
 