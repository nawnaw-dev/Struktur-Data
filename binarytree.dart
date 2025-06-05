import 'dart:io';

class Node<T> {
  T nodeValue;
  Node<T>? left, right;

  Node(this.nodeValue);
}

class BinaryTree<T> {
  Node? root;
  BinaryTree() {
    root = null;
  }

  void printPreOrder(Node? node) {
    if(node != null) {
      stdout.write(('${node.nodeValue} '));
      printPreOrder(node.left);
      printPreOrder(node.right);
    }
   }
   void printPreOrdderFromRoot() {
    printPreOrder(root);
   }
}

void main() {
  BinaryTree t = BinaryTree();
  t.root = Node('+');

  t.root!.left = Node('*');
  t.root!.left!.left = Node('a');
  t.root!.left!.right = Node('b');

  t.root!.right = Node('/');
  t.root!.right!.left = Node('-');
  t.root!.right!.right = Node('e');
  t.root!.right!.left!.left = Node('c');
  t.root!.right!.left!.right = Node('d');

  print("Pre Order traversal of binary tree is:");
  t.printPreOrdderFromRoot();
}
