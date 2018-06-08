// Presionar a,z o s para cambiar tamaño de triángulos/Distorsionar
// Doble Click para volver al tamaño y color normal
// Presionar "P" para Morado
// Presionar "b" para Azul
// Presionar "r" para Rojo
// Presionar "y" para Verde
// Presionar "t" para transparencia


// Hector Hurtado Ramirez

//****************DECLARACION DE OBJETOS Y VARIABLES**********//
ArrayList <Figura> figuras;
float lado = 25;
float altura = sqrt(sq(lado) - sq(lado/2f));
float apotema = lado/ 2*tan(PI/6f);
float radio = altura - apotema;
float delta = 0;

import ddf.minim.*;

Minim minim;
Minim gestor;
AudioPlayer musica_fondo;

//************ SET UP *****************//
void setup()
{
  size(600,600,P3D);
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

gestor = new Minim(this);
  musica_fondo = gestor.loadFile("star.mp3");
  musica_fondo.setGain(-5);
  musica_fondo.loop();

}


//*********** DRAW ***********//
void draw()
{
  background(255);
  noStroke();
  fill(0);
  for (Figura f: figuras){
    f.display();
  }
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
  Triangulo (float x_,float y_,float l_, float rota_)
  {
    x=x_;
    y=y_;
    l=l_;
    rc=(l*sqrt(3))/3f;
    b=l;
    a1=TWO_PI/3;
    rota = rota_;
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
    fill (random(25),random(10),random(55));
    pushMatrix();
    translate(x,y);
    rotate(HALF_PI - PI/3 + rota);
    beginShape();
           //azul
      if(key=='b'){
        
        fill(0,0,random(255));
            }
            if(key == 'a'){
             rc=(l*sqrt(random(1,8)))/random(2,8);
            }
            
            if(key == 'r'){
             fill(random(255),0,0);
            }
            if(mousePressed){
             rc=(l*sqrt(3))/3f; 
            }
            //verde
            if(key=='g'){
             
        fill(0,random(235),0);
            }
            if(key == 'z'){
             rc=(l*sqrt(random(1,8)))/random(2,8);
            }
            if(mousePressed){
             rc=(l*sqrt(3))/3f; 
            }
            //amarillo
            if(key=='y'){
             
        fill(random(255),255,0);
            }
            if(key == 'z'){
             rc=(l*sqrt(random(1,8)))/random(2,8);
            }
            if(mousePressed){
             rc=(l*sqrt(3))/3f; 
            }
            //morado
            if(key=='p'){
             
        fill(random(255),0,random(255));
            }
            if(key == 'z'){
             rc=(l*sqrt(random(1,8)))/random(2,8);
            }
            if(mousePressed){
             rc=(l*sqrt(3))/3f; 
            }
            //Transparencia
            if(key=='t'){
             
        fill(random(255),0,random(255),random(255));
            }
            if(key == 'z'){
             rc=(l*sqrt(random(1,8)))/random(2,8);
            }
            if(mousePressed){
             rc=(l*sqrt(3))/3f; 
            }
            
            
    for(float a = 0;a<TWO_PI;a+=a1)
    {
      deltax=cos(a)*rc;
      deltay=sin(a)*rc;
      vertex(deltax,deltay);
    }
    endShape(CLOSE);
    popMatrix();
  }
}