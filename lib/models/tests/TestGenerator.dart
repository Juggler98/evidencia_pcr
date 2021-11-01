import 'dart:math';

import 'package:evidencia_pcr/models/twoThreeTree/TTTree.dart';

import 'TestClass.dart';

class TestGenerator {
  void runTests() {
    int testCount = 1;
    Random random = new Random();
    Random random1 = new Random();
    for (int j = 0; j < testCount; j++) {
      print(
          "--------------------------NEW-TEST-------------------------------------");
      int operationCount = 10000;
      int addCount = 0;
      int removeCount = 0;
      int addNotPossible = 0;
      int removeNotPossible = 0;
      //random.setSeed(3);
      //random1.setSeed(2);
      List<int> testArrayList = [];
      final testTree = new TTTree<num, TestClass>();

      bool goRandom = true;

      final testNumbers = [];
      if (!goRandom) {
        for (int i = 0; i < testNumbers.length; i++) {
          testNumbers[i] = new TestClass(i);
        }
      }

      int addPercentage = 99;
      //int removePercentage = 100 - addPercentage;
      int randomNumberBound = 100;
      if (goRandom) {
        for (int i = 0; i < operationCount; i++) {
          if (i % 10000 == 0) {
            print(i.toString() + " operation");
          }
          TestClass testClass =
              new TestClass(random.nextInt(randomNumberBound));
          int randomOperation = random1.nextInt(100);
          if (randomOperation < addPercentage) {
            print("ADD: " + testClass.getKey().toString());
            addCount++;
            bool treeNotAdd = testTree.add(testClass);
            if (!treeNotAdd) {
              addNotPossible++;
            }
            bool arrayListNotAdd = !testArrayList.contains(testClass.getKey());
            if (arrayListNotAdd) {
              testArrayList.add(testClass.getKey());
            }
            if (treeNotAdd && !arrayListNotAdd) {
              print(testClass.getKey());
              print("-------Test-Problem------");
            }
          } else {
            if (testTree.getSize() > 0) {
              removeCount++;
              int keyToDelete =
                  testArrayList[random.nextInt(testArrayList.length)];
              print("Remove: " + keyToDelete.toString());
              final pom = TestClass(keyToDelete);
              if (testTree.remove(pom) == null) {
                removeNotPossible++;
              }
              if (testArrayList.contains(keyToDelete))
                testArrayList.remove(keyToDelete);
            } else {
              print("Empty tree");
            }
          }
        }

        print("---------NUMBERS-IN-ARRAYLIST----------");
        for (int i in testArrayList) {
          print(i);
        }
      }

//            System.out.println("-----------PREORDER------------");
//            testTree.preorder((TTTreeNode<Integer, models.tests.TestClass>) testTree.getRoot());
//
//            testTree.add(testNumbers[0]);
//            System.out.println("----------TREE-------------");
//            testTree.preorder((TTTreeNode<Integer, models.tests.TestClass>) testTree.getRoot());
//
//            testTree.remove(3);
//            System.out.println("----------TREE-------------");
//            testTree.preorder((TTTreeNode<Integer, models.tests.TestClass>) testTree.getRoot());
//
//            testTree.remove(8);
//            models.tests.TestClass t = new models.tests.TestClass(3);
//            testTree.add(t);
//
//            System.out.println(((TTTreeNode<?, ?>) testTree.getRoot()).hasParent());
//
//            System.out.println("-------After-change-------");
//
//            testTree.preorder((TTTreeNode<Integer, models.tests.TestClass>) testTree.getRoot());

      print("-----------PREORDER------------");
      testTree.preorder(testTree.getRoot());

      print("-----------INORDER------------");
      testTree.inOrderRecursive(testTree.getRoot());

      print("---------LEAF-DEEP----------");
      testTree.deepOfLeaf(testTree.getRoot());

      print('');
      print("addCount: " + addCount.toString());
      print("notAdded: " + addNotPossible.toString());
      print("removeCount: " + removeCount.toString());
      print("notRemove: " + removeNotPossible.toString());
      print('');
      print("Tree size: " + testTree.getSize().toString());
      print("ArrayList size " + testArrayList.length.toString());
      print("Tree height: " + testTree.getHeight());

      print("Inorder vsetky hodnoty:");
      List<TestClass> hodnoty = testTree.getInOrderData();
      for (TestClass testClass in hodnoty) {
        print(testClass.getKey());
      }
      print("Inorder interval:");
      final pom1 = TestClass(50);
      final pom2 = TestClass(55);
      List<TestClass> hodnotyInterval = testTree.getIntervalData(pom1, pom2);
      for (TestClass testClass in hodnotyInterval) {
        print(testClass.getKey());
      }
    }
  }
}
