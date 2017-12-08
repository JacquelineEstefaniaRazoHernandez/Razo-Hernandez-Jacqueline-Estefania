PImage[]imagen= new PImage[8];
PImage cuadro;
PImage pantalla;
PImage pantalla2;
PImage pantalla3;
int pantallaJuego;
ArrayList <Figura> figuras;
ArrayList <cuadrado> cartas;
int []  indices= new int [8];
float lado = 25;
float altura = sqrt(sq(lado) - sq(lado/2f));
float apotema = lado/ 2*tan(PI/6f);
float radio = altura - apotema;
float delta = 0;
boolean primerClick = true;
int primerIndice;
int segundoIndice;
int z=0;
void setup()
{
size(600,600,P3D);
pantalla= loadImage("patronusp.png");
pantalla2= loadImage("patronus2.png");
pantalla3= loadImage("patronus3.png");
 imagen[0]= loadImage ("harry1.png");
 imagen[1]= loadImage ("ron1.png");
 imagen[2]= loadImage ("hermione1.png");
 imagen[3]= loadImage ("l1.png");
 imagen[4]= loadImage ("s1.png");
 imagen[5]= loadImage ("fred1.png");
 imagen[6]= loadImage ("george1.png");
 imagen[7]= loadImage ("ginny1.png");
 cuadro= loadImage("cuadro.png");
 int indice=0;
pantallaJuego=1;
 for(int k=0;k<8; k++){
   indices[k]=-1;
 }
 
 cartas=new ArrayList<cuadrado>();
for(int k=0;k<2; k++){
for(int i=0; i<4; i++){
  for(int j=0; j<2;j++){
  cartas.add(new cuadrado(100+100*i,100+100*j+200*k,100,cuadro,indice++));
  }
}
 indice=0;
}

 
figuras = new ArrayList<Figura>();
for (float j = radio; j<=height; j+= altura){
int paso = (round((j - radio)/altura));
float offset =0;
if (paso%2 == 0){
offset = lado/2f;
}
for (float i =-offset; i<=width; i+= lado){
figuras.add(new Triangulo(i,j,lado,0));
}
for (float i =lado/2f-offset; i<=width; i+= lado){
figuras.add(new Triangulo(i,j-apotema,lado,PI));
}
}

}
void draw()
{
//delta += 0.01; 
background(255);
noStroke();
int indice =0;
fill(0);
  int i;
  for( i=0; i<8;i++){
    if(indices[i]==-1)break;
  }
    if(i==8)pantallaJuego=3;
  
  
 switch(pantallaJuego){
  
   case 1:
     textSize(20);
    fill(#62E3D3);
  image(pantalla,0,0);
    text("presiona aqui\n para comenzar ",100,200);
   break;
  case 2:

  textSize(20);
    fill(#62E3D3);
  image(pantalla2,0,0);
   text("presiona aqui\n para comenzar ",350,350);

  break;
  case 3:
    
   textSize(20);
    fill(#62E3D3);
  image(pantalla3,0,0);
 

  break;
  case 4:
  
for (Figura f: figuras)
f.display();

for(int k=0;k<2; k++){
for( i=0; i<4; i++){
  for(int j=0; j<2;j++){
    if(!estaenelArreglo(indice)){
     
    image(imagen[indice],100+100*i,100+100*j+200*k,100,100);
    }
    indice ++;
}
}
 indice=0;
}

for(cuadrado c: cartas){
  c.display();
}



  break;


  }
  
}



void mousePressed(){
 
  
  switch(pantallaJuego){
    case 1:
  if( mouseX<200 && mouseX >99)
    if (mouseY>100 && mouseY <200)
    pantallaJuego = 2;
  break;
  case 2:
  if( mouseX<500 && mouseX >300)
    if (mouseY>300 && mouseY <500)
    pantallaJuego = 4;
   break;
   
  
   
  case 4:
  for(cuadrado c: cartas){
   if( c.monitos()){
   c.siestaActivo=false;
   if(primerClick){
     primerIndice=c.indice;
     primerClick=false;
     
   }
   else{
     segundoIndice=c.indice;
     primerClick=true;
     if(primerIndice == segundoIndice){
       indices[z++]= primerIndice;
       
     }
     else{
       cartas.get(primerIndice).siestaActivo = true;
       cartas.get(primerIndice+8).siestaActivo = true;
       cartas.get(segundoIndice).siestaActivo = true;
       cartas.get(segundoIndice+8).siestaActivo =true;
       
     }
     
   }
   }
  }
  break;
  
  
  
}
}


boolean estaenelArreglo(int indice){
  for(int i=0;i<8;i++){
    if(indice == indices[i])
    return true;
  }
  return false;
}

interface Figura
{
float perimetro ();
float area ();
void display();
}
class Triangulo implements Figura
{
float x,y,l,rc,ri,a,a1,deltax,deltay,h,b,rota;
boolean active;
Triangulo (float x_,float y_,float l_, float rota_)
{
x=x_;
y=y_;
l=l_;
rc=sqrt(3*l*l)/4;//  -Aqui
b=l;
a1=2*PI/3.0;//Aqui
rota = rota_;
active = true;
}
float perimetro ()
{
return l*3;
}
float area ()
{
return ((l*l)*(sqrt(3)))/4;
}
void display()
{
  if(active){
fill (random(255));
pushMatrix();
translate(x,y);
rotate(HALF_PI - PI/3 + rota);
beginShape();
for(float a = 0;a<=TWO_PI;a+=a1)//aqui
{
deltax=cos(a)*rc;
deltay=sin(a)*rc;
vertex(deltax,deltay);
}
endShape(CLOSE);
popMatrix();
}
}

}
class cuadrado{
  float lado;
  int x;
  int y;
  PImage carta;
  boolean siestaActivo;
  int indice;
  
  cuadrado(int _x, int _y,float _lado,PImage _carta, int _indice){
    x=_x;
    y=_y;
    lado=_lado;
    carta= _carta;
    indice= _indice;
    
    siestaActivo = true;
  }
  
  void display(){
    if(siestaActivo)
    image(carta,x,y,lado,lado);
  }
  boolean monitos(){
    if(mouseX< x+lado && mouseX> x)
    if(mouseY> y && mouseY< y+lado)
      return true;
     return false ;
  }
}
void reset(){
  for(int k=0;k<8; k++){
   indices[k]=-1;
 }
 for( cuadrado c: cartas)
 c.siestaActivo=true;
 pantallaJuego=1;
}