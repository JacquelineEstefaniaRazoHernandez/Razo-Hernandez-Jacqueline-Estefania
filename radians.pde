ArrayList <particula> particulas;

void setup(){
  size (500,500);
  println("TAU: "+TAU); 
  
  
  color foo=color(0,255,0);

  
  particulas = new ArrayList<particula>(); 
 
 for(int i=0; i<100;i++){
  
  
  
  particulas.add(new particula());
 }
}
void draw(){
  background(#29E3A6);
for(particula p : particulas){
  p.display();
  p.movimiento();
  

}
 }
 void mousePressed(){
  particula foo = new particula(mouseX,mouseY);
  particulas.add(foo);
   
 }
 
class particula{
 float x,y,v,a,t;
 color c;  
 particula (float x_, float y_, float v_, float a_, float t_, color c_){
  x=x_;
  y=y_;
  v=v_;
  a=a_;
  t=t_;
  c=c_; 
  
 }
 particula (){
  x= random(500);
  y= random (500);
  v= (5);
  a= random (TWO_PI);
  t= random(1,30);
  c= color (random(0),random(0),random(255));
  
  
 }
 particula(float x_, float y_){
    x= x_;
  y= y_;
  v= (5);
  a= random (TWO_PI);
  t= random(10,30);
  c= color (random(255));
  
 }
 
  void display(){
  pushMatrix();
  translate(x,y);
  noStroke();
  fill(c);

  ellipse (0,0,t,t);
  
  popMatrix();
  
  }
  void movimiento(){
    
 

  x += v*cos(a);
 y += v*sin(a);
 
  if(x>500){
    v= -v;
    a=-a;
  }
  if(x<0){
    v=-v;
    a=-a;
    
  }
  if(y>500){
    a=-a;
    
    
  }
  if(y<0){
    a=-a;
  }
}
}