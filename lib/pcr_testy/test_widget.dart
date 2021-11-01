import 'package:evidencia_pcr/Application.dart';
import 'package:evidencia_pcr/models/Osoba.dart';
import 'package:evidencia_pcr/models/PCRTest.dart';
import 'package:evidencia_pcr/search/search_type.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestWidget extends StatelessWidget {
  final PCRTest test;

  TestWidget(this.test);

  final _fontSize = 14.0;

  final app = new Application();

  @override
  Widget build(BuildContext context) {
    final okres = app.getOkres(test.kodOkresu);
    final kraj = app.getKraj(test.kodKraja);
    final pracovisko = app.getPracovisko(test.kodPracoviska);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kód testu: ' + test.kodTestu.toString(),
          style: TextStyle(fontSize: _fontSize),
        ),
        Row(
          children: [
            Text(
              'Výsledok: ',
              style: TextStyle(fontSize: _fontSize),
            ),
            Text(
              test.vysledok != null
                  ? (test.vysledok ? 'Pozitívny' : 'Negatívny')
                  : '',
              style: TextStyle(
                  fontSize: _fontSize,
                  color: test.vysledok ? Colors.red : Colors.green),
            ),
          ],
        ),
        Text(
          'Kraj: ' + kraj.nazov + ' (' + test.kodKraja.toString() + ')',
          style: TextStyle(fontSize: _fontSize),
        ),
        Text(
          'Okres: ' + okres.nazov + ' (' + test.kodOkresu.toString() + ')',
          style: TextStyle(fontSize: _fontSize),
        ),
        Text(
          'Pracovisko: ' +
              pracovisko.nazov +
              ' (' +
              test.kodPracoviska.toString() +
              ')',
          style: TextStyle(fontSize: _fontSize),
        ),
        if (test.poznamka != null)
          Text(
            'Poznámka: ' + test.poznamka,
            style: TextStyle(fontSize: _fontSize),
          ),
        Text(
          'Dátum testu: ${DateFormat.yMd(Localizations.localeOf(context).toString()).format(test.datum)} ${DateFormat.jm(Localizations.localeOf(context).toString()).format(test.datum)}',
          style: TextStyle(fontSize: _fontSize),
        )
      ],
    );
  }
}
