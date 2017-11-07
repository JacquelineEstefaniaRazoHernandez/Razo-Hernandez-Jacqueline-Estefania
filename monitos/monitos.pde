//import ddf.minim.*;
PFont f;
int lastChange;
int fase;  // 0= inicio,1=seleccion de monitos, 2= pelea, 3= finde juego
int Cjugador1;
int Cjugador2;
int dx=6;
int isMoving=0;
int isReturning=0;
int y=50;
float delta;
int i;
float delta1;
String vida1, vida2;
PImage portada;
PImage perdedor;
PImage ganador;

PImage fondo1;
PImage fondo2unicornio;
PImage fondo2;
PImage fondo2occamy;
PImage fondo3;
PImage fondo3Newt;
PImage fondo4;
PImage fondo4tina;
PImage fondo5;
PImage fondo5niffler;
PImage fondo6;
PImage fondo6demiguise;
int fondo;

//Minim cadena ;
//AudioPlayer cancion;




Carta jugador1, jugador2;

Carta newtS, newt, tina,unicornio,niffler,occamy,demiguise;
void setup()
{
  size(800,530);
  portada=loadImage("portada.png");
  fase =0;
 // f= createFont("HARRYP_.TTF",48,true);
  f= createFont("HarryP",48,true);
  newt = new Carta(width/2 -90, height/2 - 70,0 );
  newtS= new Carta(20,0,0);
  tina = new Carta(240,0,1);
  unicornio =  new Carta(460,0,2);
  niffler = new Carta(20,300,3);
  occamy = new Carta(240,300,4);
  demiguise = new Carta(460,300,5);
  
  perdedor=loadImage("perdedor.png");
  ganador=loadImage("ganador.png");
  fondo1=loadImage("fondo1.png");
  fondo2unicornio=loadImage("fondo2unicornio.png");
  fondo2=loadImage("fondo2.png");
  fondo2occamy=loadImage("fondo2occamy.png");
  fondo3=loadImage("fondo3.png");
  fondo3Newt=loadImage("fondo3Newt.png");
  fondo4=loadImage("fondo4.png");
 fondo4tina=loadImage("fondo4tina.png");
 fondo5=loadImage("fondo5.png");
 fondo5niffler=loadImage("fondo5niffler.png");
 fondo6=loadImage("fondo6.png");
 fondo6=loadImage("fondo6demiguise.png");
 
 //cadena =new Minim(this); cancion=cadena.loadFile("song.mp3");
 
 
  }
  

void draw()
{
    
 switch(fase){
   case 0: 
 image(portada,0,0);
 
      textFont(f,48);
    fill(#612F62);
    textSize(30);
    text("presiona aqui para comenzar ",400,250);
   
     
    break;
    
    case 1:
  image(portada,0,0);
    newtS.dibujar();
    tina.dibujar();
    unicornio.dibujar();
    niffler.dibujar();
    occamy.dibujar();
    demiguise.dibujar();
    
    textSize(18);
    fill(#81CDF5);
    textAlign(CENTER);
    text("SELECCIONA\nA\nTU\nJUGADOR",730,270);
    
    break;
     
    case 2:
    image(portada,0,0);
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
 
  
 
  noStroke();
if(jugador2.vida<=0){
  
  image(ganador,0,0);
  textSize(48);
    fill(#5437DB);
    textAlign(RIGHT);
    textSize(18);
    text("click aqui para jugar de nuevo",500,400);
    jugador1.personaje.dibujar();
   
 
 
  }

if ((jugador1.vida<=0)){
  
   image(perdedor,0,0);
  textSize(48);
    fill(#5437DB);
    textAlign(RIGHT);
    textSize(18);
    text("click aqui para jugar de nuevo",500,400);
    jugador2.personaje.dibujar();
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
      fondo=Cjugador1;
      
      fase = 2;
       lastChange = millis();
      fondo = (int)random(5)*2;
       
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
      
       if (millis() - lastChange > 100 && (isMoving == 1 || isMoving == 2))
      {
        if (fondo%2 == 0)
        fondo++;
        else
        fondo--;
        lastChange = millis ();
      }
      else if(isMoving == 0)
      {
        if (fondo%2 != 0)
        fondo--;
      }
      switch(fondo){
        case 0:
        fondo1.resize(800,530);
        image(fondo1,0,0);
        break;
        case 1:
        fondo2unicornio.resize(800,530);
        image(fondo2unicornio,0,0);
        
        break;
        
        case 2:
        fondo2.resize(800,530);
        image(fondo2,0,0);
        break;
        case 3:
        fondo2occamy.resize(800,530);
        image(fondo2occamy,0,0);
        break;
        
        
        case 4:
        fondo3.resize(800,530);
        image(fondo3,0,0);
        break;
        case 5:
        fondo3Newt.resize(800,530);
        image(fondo3Newt,0,0);
        break;
        
        case 6:
        fondo4.resize(800,530);
        image(fondo4,0,0);
        break;
        case 7:
        fondo4tina.resize(800,530);
        image(fondo4tina,0,0);
        break;
        
        case 8:
        fondo5.resize(800,530);
        image(fondo5,0,0);
        break;
        case 9:
        fondo5niffler.resize(800,530);
        image(fondo5niffler,0,0);
        break;
        
        case 10:
        fondo6.resize(800,530);
        image(fondo6,0,0);
        break;
        case 11:
        fondo6demiguise.resize(800,530);
        image(fondo6demiguise,0,0);
        break;   
        
      }
  

  
  }

   
   
   
   class Personajes {
public int  x;
public int  y;
public int ancho;
public int alto;
public int numPers;
PImage imagen;


Personajes(int x1, int y1,int numPers1 ){
 x=x1;
 y=y1;
 ancho=150;
 alto=250;
 numPers =numPers1;
 
 
 switch(numPers){
   case 0:
   imagen=loadImage("ne.png");
   break;
   case 1:
   imagen=loadImage("ti.png");
   break;
   case 2:
   imagen=loadImage("u1.png");
   break;
   case 3: 
   imagen=loadImage("n.png");
   break;
   case 4:
   imagen=loadImage("o.png");
   break;
   case 5: 
   imagen=loadImage("d.png");
   break;
   
 }

 
}

void dibujar(){

 image(imagen,x,y,ancho,alto);
 


}




   }

class Carta{
  PFont f;
 int  x;
 int  y;
 int ancho;
 int alto;
 int numCarta;
/* int nBolitas= 40;
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
float delta4;*/

 int vida;
 int ataque;
 int defensa;
 PImage imagen;
 
 

 Personajes personaje;
 
 Carta(int x1, int y1, int numcarta1 ){
 x=x1;
 y=y1;
 ancho=300;
 alto=150;
 numCarta= numcarta1;
 personaje= new Personajes(x1,y1,numcarta1);
 vida=5;
 
 /*for(int i=0; i<nBolitas; i++){
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
  }*/

  switch (numCarta){
    case 0:

    imagen=loadImage("necarta.png") ;
    ataque = 7;
    defensa =3 ;
    
    break;
    
    case 1:
    
    imagen=loadImage("ticarta.png");
    ataque = 5;
    defensa =2 ;
    break;
    
    case 2:
    imagen=loadImage("ncarta.png");
    ataque = 5;
    defensa =2 ;
    break;
    
    case 3:
    imagen=loadImage ("ocarta.png");
    ataque = 6;
    defensa =3 ;
    
    break;
    
    case 4:
    imagen=loadImage( "cartaun.png");
    ataque = 6;
    defensa =3 ;
    break;
    
    case 5:
    imagen=loadImage("dcarta.png");
    ataque = 6;
    defensa =2 ;
    break;
  }
  
  
}




void dibujar()
{
 image(imagen,x,y,alto,ancho );
 personaje.dibujar();
    
}
/*void matrizAleatoria(){
    for(int i=0 ; i<ancho;i+=20){
   for(int j=0 ; j<alto; j+=20){
    fill(random(80,255),random(80,235), random(80,235));
     rect(x+i,y+j,20,20);
   }
 }
 }*/


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


  /* void keyPressed(){
     if(key=='1'){
       cancion.play();
     }
     if(key=='2'){
       cancion.pause();
       cancion.rewind();
     }
   }*/
 
 
