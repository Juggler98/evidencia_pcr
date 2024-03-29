import 'package:evidencia_pcr/models/Osoba.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class PersonWidget extends StatelessWidget {
  final Osoba osoba;

  const PersonWidget(this.osoba);

  final _fontSize = 14.0;

  @override
  Widget build(BuildContext context) {
    if (osoba == null) {
      return SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Meno: ' + osoba.meno.toString(),
          style: TextStyle(fontSize: _fontSize),
        ),
        Text(
          'Priezvisko: ' + osoba.priezvisko.toString(),
          style: TextStyle(fontSize: _fontSize),
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: osoba.rodCislo.toString()));
            Fluttertoast.showToast(
              msg: 'Skopírované',
            );
          },
          child: Text(
            'Rodné číslo: ' + osoba.rodCislo.toString(),
            style: TextStyle(fontSize: _fontSize),
          ),
        ),
        Text(
          'Dátum narodenia: ' +
              DateFormat.yMd(Localizations.localeOf(context).toString())
                  .format(osoba.getDatumNarodenia()),
          style: TextStyle(fontSize: _fontSize),
        ),
      ],
    );
  }
}
