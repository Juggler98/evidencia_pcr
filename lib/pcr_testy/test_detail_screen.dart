import 'package:evidencia_pcr/application.dart';
import 'package:evidencia_pcr/models/Osoba.dart';
import 'package:evidencia_pcr/models/PCRTest.dart';
import 'package:evidencia_pcr/widgets/person_widget.dart';
import 'package:evidencia_pcr/pcr_testy/test_item.dart';
import 'package:evidencia_pcr/widgets/test_widget.dart';
import 'package:flutter/material.dart';

class TestDetailScreen extends StatelessWidget {
  final PCRTest test;

  TestDetailScreen(this.test);

  void removePerson(BuildContext context) {
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
                  final osoba = Application().removeOsoba(test.osoba.rodCislo);
                  if (osoba != null) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Osoba bola vymazaná'),
                      ),
                    );
                    Navigator.of(context).pop(true);
                  } else {
                    _showScaffold(context, 'Osoba nebola vymazaná');
                  }
                  Navigator.of(context).pop(true);
                },
              ),
              TextButton(
                child: Text("Zrušiť"),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
    return null;
  }

  void removeTest(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Určite?'),
            content: Text('Určite chceš vymazať test?'),
            actions: [
              TextButton(
                child: Text("Vymazať"),
                onPressed: () {
                  final tempTest = Application().removePCRTest(test.kodTestu, true);
                  if (tempTest != null) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Test bol vymazaný'),
                      ),
                    );
                    Navigator.of(context).pop(true);
                  } else {
                    _showScaffold(context, 'Test nebol vymazaný');
                  }
                  Navigator.of(context).pop(true);
                },
              ),
              TextButton(
                child: Text("Zrušiť"),
                onPressed: () {
                  Navigator.of(context).pop(true);
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Detaily testu'),
        ),
        body: Column(
          children: [
            SizedBox(height: 8),
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              child: ListTile(
                leading: null,
                title: TestWidget(test),
                trailing: MediaQuery.of(context).size.width > 500
                    ? FlatButton.icon(
                        onPressed: () {
                          removeTest(context);
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text('Vymaž test'),
                        color: Colors.black54,
                        //textColor: Theme.of(context).errorColor,
                      )
                    : IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.black54,
                        onPressed: () {
                          removeTest(context);
                        },
                      ),
              ),
            ),
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              child: ListTile(
                leading: null,
                title: PersonWidget(test.osoba),
                trailing: MediaQuery.of(context).size.width > 500
                    ? FlatButton.icon(
                        onPressed: () {
                          removePerson(context);
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
                          removePerson(context);
                        },
                      ),
              ),
            ),
          ],
        ));
  }
}
