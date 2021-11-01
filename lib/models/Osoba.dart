
import 'PCRTestDate.dart';
import 'twoThreeTree/TTTree.dart';

class Osoba implements Comparable<Osoba> {
  final String meno;
  final String priezvisko;
  final DateTime datumNarodenia;
  final String rodCislo;
  final testy = TTTree<DateTime, PCRTestDate>();

  Osoba(this.meno, this.priezvisko, this.datumNarodenia, this.rodCislo);

  TTTree<DateTime, PCRTestDate> getTesty() {
    return testy;
  }

  int compareTo(Osoba o) {
    return rodCislo.compareTo(o.rodCislo);
  }

  String getMeno() {
    return meno;
  }

  String getPriezvisko() {
    return priezvisko;
  }

  DateTime getDatumNarodenia() {
    return datumNarodenia;
  }

  String getRodCislo() {
    return rodCislo;
  }
}
