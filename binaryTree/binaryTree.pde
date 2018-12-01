//Paso 1: Crear vector
int [] x = {4, 12, 9, 23, 6, 91, 2, 54, 37, 6, 1, 5, 78, 87, 25};
Node root;
Tree bin;
int[] ordenado;

void setup() {
  root = new Node(x[0]);
  bin = new Tree(root);
  for (int i = 1; i < x.length; i++) {
    bin.addValue(x[i]);
  }
  for (int i = 0; i < x.length; i++) {
    println("id: ", bin.myNodes[i].id);
    println("par: ", bin.myNodes[i].parent);
    println("val:", bin.myNodes[i].value);
    println("izq:", bin.myNodes[i].left);
    println("der:", bin.myNodes[i].right);
    println("----------------------------");
  }
}

void draw() {
}

void ordenar(){
    
}
