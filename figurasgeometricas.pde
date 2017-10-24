Figura Arya;
Figura Jon;
Figura Anakin;
Figura Hermione;
Figura Ron;
Figura Albus;
Figura sirius;
Figura luna;

ArrayList <Figura> Figuras;



void setup(){
  size(800,600);
  background(#75AAF2);
  
  
  Arya= new Triangulo(70,70,70,70,70);
  Jon= new Cuadrado(90);
  Anakin= new Rectangulo(150,10);
  Hermione= new Circulo(120);
  Ron= new Pentagono(90,60,50,50,50,30);
  Albus= new Hexagono(90,60,60,50,50,30);
  sirius= new Heptagono(90,60,70,50,50,30);
  luna= new Octagono(90,50,80,50,50,30);
  Figuras = new ArrayList();
  Figuras.add(Arya);
  Figuras.add(Jon);
  Figuras.add(Anakin);
  Figuras.add(Hermione);
  Figuras.add(Ron);
   Figuras.add(Albus);
   Figuras.add(sirius);
   Figuras.add(luna);
}


void draw(){

 
  println(Arya.perimetro());
  println(Arya.area());
  println(Jon.perimetro());
  println(Jon.area());
  println(Anakin.perimetro());
  println(Anakin.area());
  println(Hermione.perimetro());
  println(Hermione.area());
  println(Ron.perimetro());
  println(Ron.apotema());
  println(Ron.area());
  println(Albus.perimetro());
  println(Albus.apotema());
  println(Albus.area());
  println(sirius.perimetro());
  println(sirius.apotema());
  println(sirius.area());
  println(luna.perimetro());
  println(luna.apotema());
  println(luna.area());
  Arya.Dibujar();
  Jon.Dibujar();
  Anakin.Dibujar();
  Hermione.Dibujar();
  Ron.Dibujar();
  Albus.Dibujar();
  sirius.Dibujar();
  luna.Dibujar();
  //figuras geométricas
}
 void poligono1(int caras,int centroX,int centroY,int radio)
 {
   float angulo=360/caras;
   beginShape();
   for(int i=0; i< caras; i++)
   {
     vertex(centroX+radio*cos(radians(angulo*i)), centroY+radio*sin((radians(angulo*i))));
   }
   
   endShape(CLOSE);
 }
  
  
  interface Figura {
    float perimetro();
    float area();
     float apotema();
     void Dibujar();
     }
     
  class Triangulo implements Figura{
    float c1,c2,c3,b,h;
    
    Triangulo(float b_, float h_, float c1_, float c2_, float c3_){
      b=b_;
      h=h_;
      c1=c1_;
      c2=c2_;
      c3=c3_;
      
    }
    void Dibujar(){
      fill(#DB124E);
      noStroke();
      triangle(100,100,b,h,c1,c3);
    }
    
   
    float perimetro(){
      return c1+c2+c3;
    }
    
    float area(){
      return ((b*h)/2);
    }
    float apotema(){
    return 0;
    }
  }
  
  class Cuadrado implements Figura{
  float l;
  
  Cuadrado(float l_){
      l=l_;
  }
  
    void Dibujar(){
      fill(#900150);
      noStroke();
      rect(200,200,l,l);
    }
  
  
    float perimetro(){
      return l*4;
    }
    float area(){
    return l*l;  
    }
    float apotema(){
    return 0;
    }
  }
  
  class Rectangulo implements Figura{
  float l,a;
  
  Rectangulo(float l_, float a_){
      l=l_;
      a=a_;
  }
  
  void Dibujar(){
    fill(#6A0250);
    noStroke();
   rect(200,300,l,a);
  }
  
    float perimetro(){
      return (l*2)+(a*2);
    }
    float area(){
    return l*a;  
    }
    float apotema(){
    return 0;
    }
    }
    
    
  class Circulo implements Figura{
  float r;
  
  Circulo(int r_){
      r=r_; 
  }
  
  void Dibujar(){
     fill(#490E5A);
     noStroke();
     ellipse(350,400,r,r);
   }
  
    float perimetro(){
      return (TWO_PI*r);
    }
    float area(){
    return (PI)*(r*r);
    }
    float apotema(){
    return 0;
    }
    
  }
  
  
  
  class Pentagono implements Figura{
  float c1,c2;
  int caras, centroX, centroY, radio;
  
  Pentagono (float c1_, float c2_,int caras_,int centroX_,int centroY_,int radio_) {
      c1=c1_;
      c2=c2_;
      caras=caras_;
      centroX= centroX_;
      centroY=centroY_;
      radio=radio_;
      
  }
  
      
     void Dibujar(){

       caras=5;
       centroX=450;
       centroY=200;
       poligono1(caras,centroX,centroY,radio);
      
     }
  
  
    float perimetro(){
      return (c1*5);
    }
    float apotema(){
    return sqrt((c1*c1)-(c2*c2));
    }
    float area(){
      float perimetro =c1*5; 
     float apotema= sqrt((c1*c1)-(c2*c2));
     
    return ((perimetro*apotema)/2);
    
    
    
  }
  
  }
   class Hexagono implements Figura{
  float c1,c2;
  int caras, centroX, centroY, radio;
  Hexagono(float c1_, float c2_,int caras_,int centroX_,int centroY_,int radio_) {
      c1=c1_;
      c2=c2_;
      caras=caras_;
      centroX=centroX_;
      centroY=centroY_;
      radio=radio_;
      
      
  }
      
     void Dibujar(){
        
       caras=6;
       centroX=550;
       centroY=300;
       poligono1(caras,centroX,centroY,radio);
       
     }
  
  
    float perimetro(){
      return c1*6;
    }
    float apotema(){
    return sqrt((c1*c1)-(c2*c2));
    }
    float area(){
      float perimetro =c1*6; 
     float apotema= sqrt((c1*c1)-(c2*c2));
     
    return ((perimetro*apotema)/2);
    
    
    
  }
  
  }
  
   class Heptagono implements Figura{
  float c1,c2;
  int caras, centroX, centroY, radio;
  Heptagono(float c1_, float c2_,int centroX_,int centroY_,int radio_,int caras_) {
      c1=c1_;
      c2=c2_;
      caras=caras_;
      centroX=centroX_;
      centroY=centroY_;
      radio=radio_;
  }
   
     
        void Dibujar(){
        
      
       caras=7;
       centroX=650;
       centroY=400;
       poligono1(caras,centroX,centroY,radio);
       
     }
  
     
  
  
    float perimetro(){
      return c1*7;
    }
    float apotema(){
    return sqrt((c1*c1)-(c2*c2));
    }
    float area(){
      float perimetro =c1*7; 
     float apotema= sqrt((c1*c1)-(c2*c2));
     
    return ((perimetro*apotema)/2);
  }
  
  }
  
  class Octagono implements Figura{
  float c1,c2;
  int caras, centroX, centroY, radio;
  
  Octagono(float c1_, float c2_,int centroX_,int centroY_,int radio_,int caras_) {
      c1=c1_;
      c2=c2_;
      caras=caras_;
      centroX=centroX_;
      centroY=centroY_;
      radio=radio_;
      
  }
      
     void Dibujar(){
       
       caras=8;
       centroX=750;
       centroY=500;
       poligono1(caras,centroX,centroY,radio);
       
     }
  
  
    float perimetro(){
      return c1*8;
    }
    float apotema(){
    return sqrt((c1*c1)-(c2*c2));
    }
    
    float area(){
      float perimetro =c1*8; 
     float apotema= sqrt((c1*c1)-(c2*c2));
     
    return ((perimetro*apotema)/2);
    }
    
  }
  
    
  
 
  