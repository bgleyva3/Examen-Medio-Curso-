class Node{
  //Atributos
  String id;
  String parent;
  String value;
  String left;
  String right;
  
  //Constructor para el nodo raíz
  Node(int x){
    id = "0";
    parent = null;
    value = str(x);
    left = null;
    right = null;
  }
  
  //Constructor para los nodos hijos
  Node(int x, int p, int i){
    id = str(i);
    parent = str(p);
    value = str(x);
    left = null;
    right = null;
  }
  
  //Métodos
}
