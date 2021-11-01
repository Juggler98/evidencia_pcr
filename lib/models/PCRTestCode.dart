import 'PCRTest.dart';

class PCRTestCode implements Comparable<PCRTestCode> {
  final PCRTest data;

  PCRTestCode(this.data);

  PCRTest getData() {
    return data;
  }

  int compareTo(PCRTestCode o) {
    return data.kodTestu.compareTo(o.data.kodTestu);
  }

  String getKey() {
    return this.data.kodTestu;
  }
}
