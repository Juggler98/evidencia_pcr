class TestClass implements Comparable<TestClass> {
  final int kluc;

  TestClass(this.kluc);

  int compareTo(TestClass o) {
    return this.kluc.compareTo(o.kluc);
  }

  int getKey() {
    return this.kluc;
  }
}
