import 'package:evidencia_pcr/application.dart';
import 'package:evidencia_pcr/models/PCRTest.dart';
import 'package:evidencia_pcr/models/UzemnaJednotka.dart';
import 'package:evidencia_pcr/search/search_type.dart';
import 'package:evidencia_pcr/search/uz_typ.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatItem extends StatelessWidget {
  final UzemnaJednotka uzemnaJednotka;
  final int index;
  final int positiveCount;

  const StatItem(
      {this.uzemnaJednotka, this.index, this.positiveCount});

  final _fontSize = 14.0;

  Widget get getTitle {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
           'Poradie: ' + index.toString(),
          style: TextStyle(fontSize: _fontSize, fontWeight: FontWeight.bold),
        ),
        Text(
          uzemnaJednotka.nazov != null ? 'Názov: ' + uzemnaJednotka.nazov : '',
          style: TextStyle(fontSize: _fontSize),
        ),
        Text(
          uzemnaJednotka.kod != null
              ? 'Kód: ' + uzemnaJednotka.kod.toString()
              : '',
          style: TextStyle(fontSize: _fontSize),
        ),
        Text(
          'Počet pozitívnych: ' + positiveCount.toString(),
          style: TextStyle(fontSize: _fontSize),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      child: ListTile(
        leading: null,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getTitle,
            SizedBox(height: 3),
          ],
        ),
      ),
    );
  }
}
