import 'PCRTest.dart';

class PCRTestDate implements Comparable<PCRTestDate> {
  final PCRTest data;

  PCRTestDate(this.data);

  PCRTest getData() {
    return data;
  }

  int compareTo(PCRTestDate o) {
    if (this.data.datum.compareTo(o.data.datum) == 0) {
      return this.data.kodTestu.compareTo(o.data.kodTestu);
    } else {
      return this.data.datum.compareTo(o.data.datum);
    }
  }

  DateTime getKey() {
    return this.data.datum;
  }
}
