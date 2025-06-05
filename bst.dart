class STNode<T> {
    T nodeValue;
    STNode<T>? left, right, parent;

    STNode (this.nodeValue, [this.parent]) {
        left = null;
        right = null;
    }
}

class BSTree<T extends Comparable> {
    STNode<T>? root;
    int treesize = 0;

    BinarySearchTree() {
      root = null;
    }

    STNode<T>? getRoot() {
  return root;
}

void InOrderDisplay(STNode<T>? node) {
  if (node != null) {
    InOrderDisplay(node.left);
    print('${node.nodeValue} ');
    InOrderDisplay(node.right);
  }
}
 T? first() {
  if (root == null ) return null;

  STNode<T>? current = root;
  while (current!.left != null) {
    current = current.left;
  }
  return current.nodeValue;
 }

 bool add(T item) {
  STNode<T>? t = root, parent;
  int orderValue = 0;

  while (t != null) {
   parent = t;
   orderValue = item.compareTo(t.nodeValue);

   if (orderValue == 0) {
   return false;
   } else if (orderValue < 0) {
   t = t.left;
   } else {
   t = t.right;
   }
 }

  STNode<T> newNode = STNode(item, parent);
   if (parent == null) {
      root = newNode;
   } else if (orderValue < 0) {
     parent.left = newNode;
   } else {
      parent.right = newNode;
   }
    treesize++;
    return true;
   }
}
void main() {
   BSTree<dynamic> bst = BSTree();
    bst.add(10);
    bst.add(20);
    bst.add(30);
    bst.add(40);

    bst.InOrderDisplay(bst.getRoot());
    print('nilai terkecil dari node: ${bst.first()}');
}
