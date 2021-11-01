import 'UzemnaJednotka.dart';

class OkresPocetPozitivnych extends UzemnaJednotka {
  int pocetPozitivnych;

  OkresPocetPozitivnych(int kod, String nazov) : super(kod, nazov);

  int compareTo(UzemnaJednotka u) {
    OkresPocetPozitivnych okresPocetPozitivnych = u;
    if (pocetPozitivnych.compareTo(okresPocetPozitivnych.pocetPozitivnych) ==
        0) {
      return this.getKod().compareTo(u.getKod());
    }
    return pocetPozitivnych.compareTo(okresPocetPozitivnych.pocetPozitivnych);
  }

  int getPocetPozitivnych() {
    return pocetPozitivnych;
  }

  void setPocetPozitivnych(int pocetPozitivnych) {
    this.pocetPozitivnych = pocetPozitivnych;
  }
}
