import 'Osoba.dart';

class PCRTest {
  DateTime datum;
  final String rodCisloPacienta;
  final String kodTestu;
  final int kodPracoviska;
  final int kodOkresu;
  final int kodKraja;
  bool vysledok;
  String poznamka;
  final Osoba osoba;

  PCRTest(
      this.kodTestu,
      this.rodCisloPacienta,
      this.kodPracoviska,
      this.kodOkresu,
      this.kodKraja,
      this.vysledok,
      this.poznamka,
      this.osoba,
      paDatum) {
    if (paDatum == null) {
      this.datum = DateTime.now();
    } else {
      this.datum = paDatum;
    }
  }

  Osoba getOsoba() {
    return osoba;
  }

  DateTime getDatum() {
    return datum;
  }

  String getRodCisloPacienta() {
    return rodCisloPacienta;
  }

  String getKodTestu() {
    return kodTestu;
  }

  int getKodPracoviska() {
    return kodPracoviska;
  }

  int getKodOkresu() {
    return kodOkresu;
  }

  int getKodKraja() {
    return kodKraja;
  }

  bool isVysledok() {
    return vysledok;
  }

  String getPoznamka() {
    return poznamka;
  }

  void setVysledok(bool vysledok) {
    this.vysledok = vysledok;
  }

  void setPoznamka(String poznamka) {
    this.poznamka = poznamka;
  }
}
