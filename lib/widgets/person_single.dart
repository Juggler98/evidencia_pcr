import 'package:evidencia_pcr/application.dart';
import 'package:evidencia_pcr/models/Osoba.dart';
import 'package:evidencia_pcr/models/PCRTest.dart';
import 'package:evidencia_pcr/widgets/person_widget.dart';
import 'package:evidencia_pcr/pcr_testy/test_item.dart';
import 'package:flutter/material.dart';

import '../search/search_type.dart';

class PersonSingle extends StatelessWidget {
  final Osoba _osoba;
  final Function clearData;

  PersonSingle(this._osoba, this.clearData);


  void remove(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Určite?'),
            content: Text('Určite chceš vymazať osobu aj s jej testami?'),
            actions: [
              TextButton(
                child: Text("Vymazať"),
                onPressed: () {
                  final osoba = Application().removeOsoba(_osoba.rodCislo);
                  if (osoba != null) {
                    _showScaffold(context, 'Osoba bola vymazaná');
                    clearData();
                  } else {
                    _showScaffold(context, 'Osoba nebola vymazaná');
                  }
                  Navigator.pop(ctx);
                },
              ),
              TextButton(
                child: Text("Zrušiť"),
                onPressed: () {
                  Navigator.pop(ctx);
                },
              ),
            ],
          );
        });
    return null;
  }

  void _showScaffold(BuildContext context, String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Theme.of(context).errorColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_osoba == null) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              'Žiadne výsledky',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      );
    }
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      child: ListTile(
        leading: null,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PersonWidget(_osoba),
            SizedBox(height: 3),
          ],
        ),
        trailing: MediaQuery.of(context).size.width > 500
            ? FlatButton.icon(
                onPressed: () {
                  remove(context);
                },
                icon: const Icon(Icons.delete),
                label: const Text('Vymaž osobu'),
                color: Colors.black54,
                //textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.black54,
                onPressed: () {
                  remove(context);
                },
              ),
      ),
    );
  }
}
