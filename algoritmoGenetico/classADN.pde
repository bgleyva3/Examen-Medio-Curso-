class DNA {

  // Secuencia genética
  char[] genes;
  
  float fitness;
  
  // Constructor (Crea un ADN random)
  DNA(int num) {
    genes = new char[num];
    for (int i = 0; i < genes.length; i++) {
      genes[i] = (char) random(32,126);  // Elige de un rango de letras
    }
  }
  
  // Convierte el arreglo de letras a un vector
  String getPhrase() {
    return new String(genes);
  }
  
  // Calcula la similitud del vector de ADN
  void fitness (String target) {
     int score = 0;
     for (int i = 0; i < genes.length; i++) {
        if (genes[i] == target.charAt(i)) {
          score++;
        }
     }
     
     
     fitness = (float)score / (float)target.length();
  }
  
  // Combinar
  DNA crossover(DNA partner) {
    // Nuevo hijo
    DNA child = new DNA(genes.length);
    
    int midpoint = int(random(genes.length)); // Selecciona el punto medio
    
    // Mitad de uno, mitad del otro
    for (int i = 0; i < genes.length; i++) {
      if (i > midpoint) child.genes[i] = genes[i];
      else              child.genes[i] = partner.genes[i];
    }
    return child;
  }
  
  // Basado en la probabilidad de mutación, selecciona una letra random
  void mutate(float mutationRate) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < mutationRate) {
        genes[i] = (char) random(32,128);
      }
    }
  }
}
