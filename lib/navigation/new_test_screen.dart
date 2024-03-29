import 'package:evidencia_pcr/Application.dart';
import 'package:evidencia_pcr/models/Osoba.dart';
import 'package:evidencia_pcr/text_fields/number_textfield.dart';
import 'package:evidencia_pcr/text_fields/string_textfield.dart';
import 'package:flutter/material.dart';

class NewTestScreen extends StatefulWidget {
  NewTestScreen();

  @override
  _NewTestScreenState createState() => _NewTestScreenState();
}

class _NewTestScreenState extends State<NewTestScreen>
    with AutomaticKeepAliveClientMixin<NewTestScreen> {
  String _rodneCislo;
  String _meno;
  String _priezvisko;
  var _kodPracoviska = 202;
  var _kodOkresu = 205;
  var _positive = false;
  String _poznamka;
  var _createNewPerson = false;
  var _controller = TextEditingController();
  var _controller2 = TextEditingController();

  final app = new Application();

  @override
  bool get wantKeepAlive => true;

  void _clearData() {
    setState(() {
      _rodneCislo = '';
      _meno = null;
      _priezvisko = null;
      _positive = false;
      _poznamka = null;
      _controller.clear();
      _controller2.clear();
    });
  }

  void _setRodneCislo(String rodCislo) {
    setState(() {
      _rodneCislo = rodCislo;
    });
  }

  void _setMeno(String meno) {
    setState(() {
      _meno = meno;
    });
  }

  void _setPriezvisko(String priezvisko) {
    setState(() {
      _priezvisko = priezvisko;
    });
  }

  void _setPracovisko(int kod) {
    setState(() {
      _kodPracoviska = kod;
    });
  }

  void _setOkres(int kod) {
    setState(() {
      _kodOkresu = kod;
    });
  }

  void _setPoznamka(String poznamka) {
    setState(() {
      _poznamka = poznamka;
    });
  }

  void _save() {
    Osoba osoba;
    if (_createNewPerson) {
      if (_meno == null || _priezvisko == null) {
        _showScaffold('Zadaj meno a priezvisko');
        return;
      }
      osoba = app.addOsoba(_meno, _priezvisko, _rodneCislo);
      if (osoba != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Osoba bola vytvorená'),
          ),
        );
        _meno = null;
        _priezvisko = null;
      }
      _createNewPerson = false;
    } else {
      osoba = app.getOsoba(_rodneCislo);
    }
    if (osoba == null) {
      _createNewPerson = true;
      return;
    }
    if (app.addPCRTest(null, _rodneCislo, _kodPracoviska, _kodOkresu,
        _kodOkresu ~/ 100, _positive, _poznamka, osoba, null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Test bol vytvoreny'),
        ),
      );
      _clearData();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Test nebol vytvoreny'),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    }
  }

  void _showScaffold(String text) {
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
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 8),
          StringTextField(_setRodneCislo, 'Zadaj rodné číslo', _controller),
          SizedBox(height: 2),
          NumberTextField(_setOkres, 'Zadaj kód okresu', _kodOkresu),
          SizedBox(height: 2),
          NumberTextField(
              _setPracovisko, 'Zadaj kód pracoviska', _kodPracoviska),
          StringTextField(_setPoznamka, 'Poznámka', _controller2),
          Padding(
            padding: const EdgeInsets.only(
                left: 30.0, right: 30.0, top: 4.0, bottom: 0.0),
            child: SwitchListTile.adaptive(
              title: Text('Positive'),
              secondary: Icon(
                Icons.account_circle_outlined,
                color: Colors.brown,
              ),
              value: _positive,
              activeColor: Colors.red,
              onChanged: (value) {
                setState(() {
                  _positive = value;
                });
              },
            ),
          ),
          if (_createNewPerson)
            Column(
              children: [
                StringTextField(_setMeno, 'Meno', null),
                SizedBox(height: 2),
                StringTextField(_setPriezvisko, 'Priezvisko', null),
                SizedBox(height: 2),
              ],
            ),
          ElevatedButton(
            onPressed: _rodneCislo == null ||
                    _kodOkresu == null ||
                    _kodPracoviska == null
                ? null
                : () {
                    if (_rodneCislo.length != 9 && _rodneCislo.length != 10) {
                      _showScaffold('Rodné číslo musí mať 9 alebo 10 znakov.');
                    } else {
                      setState(() {
                        _save();
                      });
                    }
                  },
            child: Text('Ulož'),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              ),
              //backgroundColor: MaterialStateProperty.all(Colors.brown),
            ),
          ),
          SizedBox(height: 2),
        ],
      ),
    );
  }
}
