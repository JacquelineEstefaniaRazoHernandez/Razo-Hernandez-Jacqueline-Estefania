int caso = 5;
int c1 = 5;
int c2 = 5;
matrizAleatoria matriz;

void setup(){
size(400,400);
background(#B6E5F7);
matriz = new matrizAleatoria(caso =5);

}
void draw(){

if ((mouseX >= 50 & mouseX <= 150) & (mouseY >= 50 & mouseY <= 150)) {
c1= 10;
}
else {
c1= 5;
}
if ((mouseX >= 200 & mouseX <= 300) & (mouseY >= 50 & mouseY <= 150)) {
c2= 10;
}
else {
c2= 5;
}

matriz.AnakinMatriz (c1,100,50,50);

matriz.AnakinMatriz (c2,100,200,50);
println(mouseX);
}

class matrizAleatoria{
  int caso ;
int c1;
int c2;



matrizAleatoria( int caso_){
 caso = caso_;

}

void AnakinMatriz(int t, int u, int x, int y){
noStroke();
for (int i = 0; i<u; i+=t){
for (int j = 0; j<u; j+=t){
fill (random(255),255,255);
ellipse (x+i,y+j,t,t);
}
}
}
}