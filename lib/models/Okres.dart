import 'UzemnaJednotka.dart';

class Okres extends UzemnaJednotka {
  final int kodKraja;

  Okres(int kod, this.kodKraja, String nazov) : super(kod, nazov);

  int getKodKraja() {
    return kodKraja;
  }
}
