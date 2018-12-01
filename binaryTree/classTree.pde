class Tree {
  //Atributos
  Node [] myNodes;

  //Constructor
  Tree(Node root) {
    myNodes = new Node[1];
    myNodes[0] = root;
  }

  //Métodos
  //Compara nuevo valor con el valor del nodo padre para ir a izq o der
  String chooseSide(int id, int val) {
    String side;
    if (val >= int(myNodes[id].value)) {
      side = "left";
    } else {
      side = "right";
    }
    return side;
  }
  
  //Devuelve verdadero si left del nodo(id) está vacío
  boolean checkEmptyLeft(int id) {
    boolean res;
    if (myNodes[id].left == null) {
      res = true;
    } else {
      res = false;
    }
    return res;
  }
  
  //Devuelve verdadero si right del nodo(id) está vacío
  boolean checkEmptyRight(int id) {
    boolean res;
    if (myNodes[id].right == null) {
      res = true;
    } else {
      res = false;
    }
    return res;
  }
  
  //Añade valor de left al nodo padre
  void addLeftChild(int idParent, int idChild) {
    myNodes[idParent].left = str(idChild);
  }
  
  //Añade valor de right al nodo padre
  void addRightChild(int idParent, int idChild) {
    myNodes[idParent].right = str(idChild);
  }

  void searchNode(int val, int id) {
    String side;
    boolean found = false;
    
    //Busca hasta encontrar un nodo vacío
    //Dependiendo si el valor a agregar es menor o mayor
    while (found == false) {
      side = chooseSide(id, val);
      if (side == "left") {
        if (checkEmptyLeft(id) == true) {
          addLeftChild(id, myNodes.length);
          Node n = new Node(val, id, myNodes.length);
          myNodes = (Node []) append(myNodes, n);
          found = true;
        } else {
          id = int(myNodes[id].left);
        }
      } else {
        if (checkEmptyRight(id) == true) {
          addRightChild(id, myNodes.length);
          Node n = new Node(val, id, myNodes.length);
          myNodes = (Node []) append(myNodes, n);
          found = true;
        } else {
          id = int(myNodes[id].right);
        }
      }
    }
  }

  void addValue(int val) {
    searchNode(val, 0);
  }
}
