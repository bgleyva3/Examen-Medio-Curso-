
PFont f;
String objetivo;
int popmax;
float razonCambio;
Population population;

void setup() {
 //size(440, 200);
  //f = createFont("Courier", 32, true);
  objetivo = "1582672  1588536";
  popmax = 150;
  razonCambio = 0.01;

  // Crear población con una frase objetivo, razon de cambio y población maxima
  population = new Population(objetivo, razonCambio, popmax);
}

void draw() {
  // Generar entorno evolutivo
  population.naturalSelection();
  //Crear siguiente generación
  population.generate();
  // Calcular similitud
  population.calcFitness();
  displayInfo();

  // Si se encuentra la frase, detente
  if (population.finished()) {
   
    noLoop();
  }
}

void displayInfo() {
 // background(100);
  // Mostrar los valores
 String answer = population.getBest();


 println("matricula ", answer);
  
}
