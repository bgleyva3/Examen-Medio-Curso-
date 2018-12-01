class Population {

  float mutationRate;           // Tasa de mutación
  DNA[] population;             // Arreglo que tiene la población actual
  ArrayList<DNA> matingPool;    // Lista de arreglo que usaremos para nuestro entorno evolutivo
  String target;                // frase objetivo
  int generations;              // Numero de generaciones
  boolean finished;             // Terminamos de evolucionar
  int perfectScore;

//Constructor
  Population(String p, float m, int num) {
    target = p;
    mutationRate = m;
    population = new DNA[num];
    for (int i = 0; i < population.length; i++) {
      population[i] = new DNA(target.length());
    }
    calcFitness();
    matingPool = new ArrayList<DNA>();
    finished = false;
    generations = 0;
    
    perfectScore = 1;
  }

  // Llena nuestra matriz de coincidencias con un valor de cada miembro de la población
  void calcFitness() {
    for (int i = 0; i < population.length; i++) {
      population[i].fitness(target);
    }
  }

  // Crear entorno evolutivo
  void naturalSelection() {
    // Limpiar lista de matrices
    matingPool.clear();

    float maxFitness = 0;
    for (int i = 0; i < population.length; i++) {
      if (population[i].fitness > maxFitness) {
        maxFitness = population[i].fitness;
      }
    }

    // Basado en la coincidencia, cada miembro será agregado al entorno evolutivo cierta cantidad de veces
    // Una coincidencia más elevada = más entradas al entorno evolutivo = más probable de ser elegido como padre
    // Una menor coincidencia = menos entradas al entorno evolutivo = menos probable de ser elegido como padre
    for (int i = 0; i < population.length; i++) {
      
      float fitness = map(population[i].fitness,0,maxFitness,0,1);
      int n = int(fitness * 100);  // Multiplicador aleatoriamente, también podemos usar el método monte carlo
      for (int j = 0; j < n; j++) {              // y tomar dos numeros aleatorios
        matingPool.add(population[i]);
      }
    }
  }

  // Crear nueva generación
  void generate() {
    // Llenar la población con hijos del entorno evolutivo 
    for (int i = 0; i < population.length; i++) {
      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));
      DNA partnerA = matingPool.get(a);
      DNA partnerB = matingPool.get(b);
      DNA child = partnerA.crossover(partnerB);
      child.mutate(mutationRate);
      population[i] = child;
    }
    generations++;
  }


  // Seleccionar al miembro más ´´adaptado´´ de la población
  String getBest() {
    float worldrecord = 0.0;
    int index = 0;
    for (int i = 0; i < population.length; i++) {
      if (population[i].fitness > worldrecord) {
        index = i;
        worldrecord = population[i].fitness;
      }
    }
    
    if (worldrecord == perfectScore ) finished = true;
    return population[index].getPhrase();
  }

  boolean finished() {
    return finished;
  }

  int getGenerations() {
    return generations;
  }

  // Calcular el promedio de coincidencia de la población
  float getAverageFitness() {
    float total = 0;
    for (int i = 0; i < population.length; i++) {
      total += population[i].fitness;
    }
    return total / (population.length);
  }

  String allPhrases() {
    String everything = "";
    
    int displayLimit = min(population.length,50);
    
    
    for (int i = 0; i < displayLimit; i++) {
      everything += population[i].getPhrase() + "\n";
    }
    return everything;
  }
}
