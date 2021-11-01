import 'package:evidencia_pcr/Application.dart';
import 'package:evidencia_pcr/text_fields/number_textfield.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GeneratorScreen extends StatelessWidget {
  GeneratorScreen();

  var _pocetludi = 100;
  var _pocetTestov = 100;

  void _setPocetLudi(int pocetLudi) {
    _pocetludi = pocetLudi;
  }

  void _setPocetTestov(int pocetTestov) {
    _pocetTestov = pocetTestov;
  }

  void generate() {
    final app = Application();
    app.addRandomPersons(_pocetludi);
    app.addRandomPCRTest(_pocetTestov);
    print(_pocetludi);
    print(_pocetTestov);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Generátor dát'),
        ),
        body: Column(
          children: [
            SizedBox(height: 16),
            NumberTextField(_setPocetLudi, 'Zadaj počet ľudí', _pocetludi),
            SizedBox(height: 4),
            NumberTextField(
                _setPocetTestov, 'Zadaj počet testov', _pocetTestov),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _pocetludi == null || _pocetTestov == null
                  ? null
                  : () {
                      generate();
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Dáta boli vygenerované'),
                        ),
                      );
                    },
              child: Text('Generuj'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                ),
                //backgroundColor: MaterialStateProperty.all(Colors.brown),
              ),
            ),
          ],
        ));
  }
}
