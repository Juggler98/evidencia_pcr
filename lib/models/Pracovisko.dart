import 'UzemnaJednotka.dart';

class Pracovisko extends UzemnaJednotka {
  final int kodKraja;

  Pracovisko(int kod, this.kodKraja, String nazov) : super(kod, nazov);

  int getKodKraja() {
    return kodKraja;
  }
}
