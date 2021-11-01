import 'package:evidencia_pcr/models/PCRTestDate.dart';

import 'twoThreeTree/TTTree.dart';

abstract class UzemnaJednotka
    implements Comparable<UzemnaJednotka> {
  final int kod;
  final String nazov;

  final testy = TTTree<DateTime, PCRTestDate>();
  final pozitivneTesty = TTTree<DateTime, PCRTestDate>();

  UzemnaJednotka(this.kod, this.nazov);

  int compareTo(UzemnaJednotka u) {
    return kod.compareTo(u.kod);
  }

  getTesty() {
    return testy;
  }

  getPozitivneTesty() {
    return this.pozitivneTesty;
  }

  getKod() {
    return kod;
  }

  getNazov() {
    return nazov;
  }
}
