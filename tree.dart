import 'dart:io';

class Node<T> {
  T nodeValue;
  Node<T>? left, right;

  Node(this.nodeValue);
}

class BinaryTree<T> {
  Node<T>? root;

  BinaryTree() {
    root = null;
  }

    //Transversal Pre-Order (NLR)
   void printPreOrder(Node? node) {
    if(node != null) {
      stdout.write(('${node.nodeValue}'));
      printPreOrder(node.left);
      printPreOrder(node.right);
    }
   }
   void printPreOrdderFromRoot() {
    printPreOrder(root);
   }

   //Transversal In-Order (LNR)
   void printInOrder(Node? node) {
    if(node != null) {
      printInOrder(node.left);
      stdout.write('${node.nodeValue}');
      printInOrder(node.right);
    }
   }
   void printInOrderFromRoot() {
    printInOrder(root);
   }

   //Transversal Post-Order
   void printPostOrder(Node? node) {
    if (node != null) {
      printPostOrder(node.left);
      printPostOrder(node.right);
      stdout.write('${node.nodeValue}');
    }
   }

   void printPostOrderFromRoot() {
    printPostOrder(root);
   }

   //inorder non rekursif
   void InOrderNonRekursif(Node? node) {
    if (root == null) return;

    List<Node> s = [];
    Node? curr = root;
    while (curr != null || s.isNotEmpty) {
      while (curr != null) {
        s.add(curr);
        curr = curr.left;
      }

      //pop subtree sebelah kiri
      curr = s.removeLast(); //sama dengan pop di stack.
      stdout.write('${curr.nodeValue}');
      curr = curr.right;
    }
   }
   
   //post order non rekursif
   void PostOrderNonRekursif(Node? node) {
    if (root == null) return;
    
    List<Node> s1 = [];
    List<Node> s2 = [];
   
    s1.add(root!); 

    while (s1.isNotEmpty) {
     Node current = s1.removeLast();
     s2.add(current);

     if (current.left != null) {
       s1.add(current.left!);
     }
     if (current.right != null) {
       s1.add(current.right!);
     }
   }
  
   while (s2.isNotEmpty) {
     stdout.write('${s2.removeLast().nodeValue}');
   }
 }
  
  //pre order non rekursif
  void PreOrderNonRekursif(Node? node) {
    if (root == null) return;
    
    List<Node> s = [];
    s.add(root!);
    
    while (s.isNotEmpty) {
      Node current = s.removeLast();
      stdout.write('${current.nodeValue}');
      
      if (current.right != null) {
      s.add(current.right!);
      }
      if (current.left != null) {
      s.add(current.left!);
      }
   }
 }

 //tambah data pada binary tree bds target dan menerapkan linear search
   bool tambahBerdasarkanTarget(T dataBaru, T target) {
    Node? nodeTarget = _linearSearch(root, target);
    if (nodeTarget == null) return false;

    if (nodeTarget.left == null) {
      nodeTarget.left = Node(dataBaru);
      return true;
    } else if (nodeTarget.right == null) {
      nodeTarget.right = Node(dataBaru);
     return true;
    }
     return false; // tidak ditambahkan karena child sudah penuh
    }
    
    Node? _linearSearch(Node? node, T target) {
    if (node == null) return null;

    if (node.nodeValue == target) {
       return node;
    }

    Node? foundNode = _linearSearch(node.left, target);
    if (foundNode != null) return foundNode;

    return _linearSearch(node.right, target);
 }


   //menambahkan berdasarrkan level order dengan bantuan queue
   void InsertData(T newValue) {
    Node<T> newNode = Node<T>(newValue);

    //Jika tree kosong, jadikan newNode sebagai root
    if (root == null) {
      root = newNode;
      return;
    }

    //Inisialisasi queue dan masukkan root
    List<Node<T>> queue = [];
    queue.add(root!);

    //Loop selama queue tidak kosong 
    while (queue.isNotEmpty) {
      //ambil node pertama dari queue(current)
      Node<T> current = queue.removeAt(0);

      //Periksa anak kiri current
      if (current.left == null) {
        current.left = newNode; //menempatkan node baru di kiri
        return;
      } else {
        queue.add(current.left!); //tambahkan anak kiri ke queue 
    }

    //periksa anak kanan current 
    if (current.right == null) {
      current.right = newNode; // menempatkan node baru di kanan
      return;
    } else {
      queue.add(current.right!); //tambahkan anak kanan ke queue
    }
   }
  }
}
void main() {
  BinaryTree BTree = BinaryTree();

  BTree.root = Node(3);
  BTree.root!.left = Node(1);
  BTree.root!.left!.right = Node(4);
  BTree.root!.right = Node(2);
  BTree.root!.left!.left = Node(5);

  print('- Pre Order Transversal: ');
  BTree.printPreOrdderFromRoot();

  print('\n- In Order Transversal: ');
  BTree.printInOrderFromRoot();

  print('\n- Post Order Transversal: ');
  BTree.printPostOrderFromRoot();

  print('\n- In Order Non-Rekursif: ');
  BTree.InOrderNonRekursif(BTree.root);

  print('\n- Post-Order Non Rekursif: ');
  BTree.PostOrderNonRekursif(BTree.root);

  print('\n- Pre-Order Non Rekursif: ');
  BTree.PreOrderNonRekursif(BTree.root);
  
  print('\n- insert by target(Pre Order): ');
  BTree.tambahBerdasarkanTarget(9, 5);
  BTree.PreOrderNonRekursif(BTree.root);

  print('\n- insert by target(In Order): ');
  BTree.tambahBerdasarkanTarget(10, 5);
  BTree.InOrderNonRekursif(BTree.root);

  BTree.InsertData(6);
  BTree.InsertData(7);
  BTree.InsertData(8);
  print('\n- In Order Transversal setelah Level Order: ');
  BTree.printInOrderFromRoot();
  print('\n- Post Order Transversal setelah Level Order: ');
  BTree.printPostOrderFromRoot();
  print('\n- Pre Order Transversal setelah Level Order: ');
  BTree.printPreOrdderFromRoot();
}
