import 'UzemnaJednotka.dart';

class KrajPocetPozitivnych extends UzemnaJednotka {
  int pocetPozitivnych;

  KrajPocetPozitivnych(int kod, String nazov) : super(kod, nazov);

  int compareTo(UzemnaJednotka u) {
    KrajPocetPozitivnych krajPocetPozitivnych = u;
    if (pocetPozitivnych.compareTo(krajPocetPozitivnych.pocetPozitivnych) ==
        0) {
      return this.getKod().compareTo(u.getKod());
    }
    return pocetPozitivnych.compareTo(krajPocetPozitivnych.pocetPozitivnych);
  }

  int getPocetPozitivnych() {
    return pocetPozitivnych;
  }

  void setPocetPozitivnych(int pocetPozitivnych) {
    this.pocetPozitivnych = pocetPozitivnych;
  }
}
