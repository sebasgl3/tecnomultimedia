//FACUNDO SEBASTIAN GONZALEZ, Legajo 93504/1, Comision 1, Lugar de Interes: Estatua Dios de la Guerra China.
PImage[] imagenes = new PImage[4];
PFont monastic;
String[] textos = {
  "Inaugurada en China una épica estatua \nde 1320 toneladas de \nsu dios de la guerra",
  "Guan Yu, fue un general chino\n de una enorme destreza marcial \n durante su época,\n y fue ascendido a dios\n de la guerra tras su muerte.",
  "Espectacular a la vista,\n toda la escultura se alza\n hasta unos 58 metros,\n y parece vigilar la ciudad\n y a sus residentes.",
  "GRACIAS POR VER!"
};
int indiceTexto = 0;
int indiceImagen = 0;
int tiempoTranscurrido = 0;
int tiempoCambio = 5000;
float velocidad = 1.5;
float yTextoFlotante = 480;  // Posición vertical inicial del texto principal


Button reiniciarButton;

void setup() {
  size(640, 480);
  background(0);

  imagenes[0] = loadImage("estatuaa.jpg");
  imagenes[1] = loadImage("estatuab.jpg");
  imagenes[2] = loadImage("estatuac.jpg");
  imagenes[3] = loadImage("estatuad.jpg");

  monastic = loadFont("monastic.vlw");

  reiniciarButton = new Button("Reiniciar", width / 2, height - 50, 100, 40);

  tiempoTranscurrido = millis();
}

void draw() {
  background(0);
  image(imagenes[indiceImagen], 0, 0);
  frameRate(60);
  println(frameRate);

  fill(0);
  noStroke();

  fill(255, 255, 25);
  textFont(monastic);
  textSize(32);
  textAlign(CENTER, CENTER);

  float x = width / 2;

  if (millis() - tiempoTranscurrido > tiempoCambio) {
    siguienteTexto();
    siguientePantalla();
    tiempoTranscurrido = millis();
    yTextoFlotante = height;
  }
   

  // Texto principal
  if (indiceTexto == 0 && indiceImagen == 0) {
   text(textos[indiceTexto], x, yTextoFlotante);
  }

  // Texto flotante
 
 fill(255,255,25);
   if(indiceTexto==1){
     text(textos[1], x, yTextoFlotante);
   }
  if(indiceTexto==2){
     text(textos[2], x, yTextoFlotante);
   }
   if(indiceTexto==3){
     text(textos[3], x, yTextoFlotante);
   }

  yTextoFlotante = yTextoFlotante - velocidad;  // Actualiza la posición vertical del texto principal hacia arriba
  println(yTextoFlotante);

 reiniciarButton.display();
}

void siguienteTexto() {
  indiceTexto = (indiceTexto + 1) % textos.length;
}

void siguientePantalla() {
  indiceImagen = (indiceImagen + 1) % imagenes.length;
}

void reiniciar() {
  indiceImagen = 0;
  indiceTexto = 0;
  tiempoTranscurrido = millis();
  yTextoFlotante = height;
}

void mousePressed() {
  if (reiniciarButton.isPressed()) {
    reiniciar();
  }
}

class Button {
  String label;
  float x, y;
  float width, height;

  Button(String label, float x, float y, float width, float height) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  void display() {
    // Botón
    stroke(255);
    fill(0);
    rectMode(CENTER);
    rect(x, y, width, height);

    // Texto del botón
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(18);
    text(label, x, y);
  }
   boolean isPressed() {
    if (mouseX > x - width / 2 && mouseX < x + width / 2 && mouseY > y - height / 2 && mouseY < y + height / 2) {
      return true;
    }
    return false;
  }
}

 
