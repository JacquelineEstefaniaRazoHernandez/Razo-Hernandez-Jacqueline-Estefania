
void setup(){
size(600,400);
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
//Matriz 1; 
matrizAleatoria (c1,150,50,50);
//Matriz 2
matrizAleatoria (c2,150,200,50);
println(mouseX);
}
void matrizAleatoria(int t, int u, int x, int y){
noStroke();
for (int i = 0; i<u; i+=t){
for (int j = 0; j<u; j+=t){
fill (random(255),255,255);
ellipse (x+i,y+j,t,t);
}
}
}

class matrizAleatria( int c1,int c2, int caso){
  int caso = 5;
int c1 = 5;
int c2 = 5;
}