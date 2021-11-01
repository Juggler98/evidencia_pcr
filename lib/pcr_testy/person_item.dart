import 'package:evidencia_pcr/Application.dart';
import 'package:evidencia_pcr/models/PCRTest.dart';
import 'package:evidencia_pcr/search/search_type.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonItem extends StatelessWidget {
  final PCRTest test;

  const PersonItem(this.test);

  final _fontSize = 14.0;

  Widget get getTitle {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Meno: ' + test.osoba.meno.toString(),
          style: TextStyle(fontSize: _fontSize),
        ),
        Text(
          'Priezvisko: ' + test.osoba.priezvisko.toString(),
          style: TextStyle(fontSize: _fontSize),
        ),
        Text(
          'Rodné číslo: ' + test.rodCisloPacienta.toString(),
          style: TextStyle(fontSize: _fontSize),
        ),
        Text(''),
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
          test.kodKraja != null ? 'Kraj: ' + test.kodKraja.toString() : '',
          style: TextStyle(fontSize: _fontSize),
        ),
        Text(
          test.kodOkresu != null ? 'Okres: ' + test.kodOkresu.toString() : '',
          style: TextStyle(fontSize: _fontSize),
        ),
        Text(
          test.kodPracoviska != null
              ? 'Pracovisko: ' + test.kodPracoviska.toString()
              : '',
          style: TextStyle(fontSize: _fontSize),
        ),
      ],
    );
  }

  PCRTest removeTest() {
    final app = Application();
    return app.removePCRTest(test.kodTestu, true);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (ctx) => TestDetailScreen(),
        //   ),
        // );
      },
      child: Card(
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
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${DateFormat.yMd(Localizations.localeOf(context).toString()).format(test.datum)} ${DateFormat.jm(Localizations.localeOf(context).toString()).format(test.datum)}',
                style: TextStyle(fontSize: _fontSize),
              ),

              //SizedBox(height: 6),
            ],
          ),
          trailing: MediaQuery.of(context).size.width > 500
              ? FlatButton.icon(
                  onPressed: () {
                    removeTest();
                  },
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                  textColor: Theme.of(context).errorColor,
                )
              : IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.black54,
                  onPressed: () {
                    removeTest();
                  },
                ),
        ),
      ),
    );
  }
}
