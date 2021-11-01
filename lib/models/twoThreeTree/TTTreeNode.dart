class TTTreeNode<K extends Comparable<K>, T extends Comparable<T>> {
  TTTreeNode<K, T> parent;
  TTTreeNode<K, T> leftSon;
  TTTreeNode<K, T> middleSon;
  TTTreeNode<K, T> rightSon;

  T dataL;
  T dataR;

  TTTreeNode(T data) {
    dataL = data;
  }

  bool isThreeNode() {
    return hasDataR();
  }

  void vypis() {
    if (hasMiddleSon()) {
      print("hasMIDDLESon");
    }
    if (hasRightSon()) {
      print("hasRIGHTSon");
    }
    if (hasLeftSon()) {
      print("hasLEFTSon");
    }
    if (isThreeNode()) {
      print("3 NODE");
      //print("L: " + dataL.getKey().toString());
      //print("R: " + dataR.getKey().toString());
    } else {
      print("2 NODE");
      //print("L: " + dataL.getKey().toString());
    }
    print("");
    //if (dataL.getKey() == null || dataL == null) {
    //print("-------------Error-------keyL-or-dataL---------");
    //}
  }

  bool isLeaf() {
    return !hasMiddleSon() && !hasRightSon() && !hasLeftSon();
  }

  void setMiddleSon(TTTreeNode<K, T> middleSon) {
    this.middleSon = middleSon;
  }

  void setDataL(T dataL) {
    this.dataL = dataL;
  }

  void setDataR(T dataR) {
    this.dataR = dataR;
  }

  TTTreeNode<K, T> getMiddleSon() {
    return middleSon;
  }

  T getDataL() {
    return dataL;
  }

  T getDataR() {
    return dataR;
  }

  void setParent(TTTreeNode<K, T> parent) {
    this.parent = parent;
  }

  void setLeftSon(TTTreeNode<K, T> leftSon) {
    this.leftSon = leftSon;
  }

  void setRightSon(TTTreeNode<K, T> rightSon) {
    this.rightSon = rightSon;
  }

  TTTreeNode<K, T> getParent() {
    return parent;
  }

  TTTreeNode<K, T> getLeftSon() {
    return leftSon;
  }

  TTTreeNode<K, T> getRightSon() {
    return rightSon;
  }

  bool hasLeftSon() {
    return this.leftSon != null;
  }

  bool hasRightSon() {
    return this.rightSon != null;
  }

  bool hasParent() {
    return this.parent != null;
  }

  bool hasMiddleSon() {
    return this.middleSon != null;
  }

  bool hasDataL() {
    return this.dataL != null;
  }

  bool hasDataR() {
    return this.dataR != null;
  }
}
