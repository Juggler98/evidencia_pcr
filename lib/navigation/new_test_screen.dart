import 'package:evidencia_pcr/Application.dart';
import 'package:evidencia_pcr/models/Kraj.dart';
import 'package:evidencia_pcr/models/KrajPocetPozitivnych.dart';
import 'package:evidencia_pcr/models/Okres.dart';
import 'package:evidencia_pcr/models/OkresPocetPozitivnych.dart';
import 'package:evidencia_pcr/models/Osoba.dart';
import 'package:evidencia_pcr/models/PCRTest.dart';
import 'package:evidencia_pcr/models/PCRTestDate.dart';
import 'package:evidencia_pcr/models/UzemnaJednotka.dart';
import 'package:evidencia_pcr/models/twoThreeTree/TTTree.dart';
import 'package:evidencia_pcr/search/date_picker.dart';
import 'package:evidencia_pcr/search/number_textfield.dart';
import 'package:evidencia_pcr/search/search_dropdown.dart';
import 'package:evidencia_pcr/search/stats_dropdown.dart';
import 'package:evidencia_pcr/search/stats_list.dart';
import 'package:evidencia_pcr/search/test_single.dart';
import 'package:evidencia_pcr/search/string_textfield.dart';
import 'package:evidencia_pcr/search/search_type.dart';
import 'package:evidencia_pcr/search/test_list.dart';
import 'package:evidencia_pcr/search/uzemne_jednotky_dropdown.dart';
import 'package:evidencia_pcr/search/uz_typ.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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

  final app = new Application();

  @override
  bool get wantKeepAlive => true;


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

  void _setPositive(bool positive) {
    setState(() {
      _positive = positive;
    });
  }

  void _save() {

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          StringTextField(_setRodneCislo, 'Zadaj rodné číslo'),
          SizedBox(height: 2),
          NumberTextField(_setOkres, 'Zadaj kód okresu'),
          NumberTextField(_setPracovisko, 'Zadaj kód pracoviska'),
          StringTextField(_setPoznamka, 'Poznámka'),
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
          ElevatedButton(
            onPressed: _rodneCislo == null || _kodOkresu == null || _kodPracoviska == null
                ? null
                : () {
              if (_rodneCislo.length != 9 || _rodneCislo.length != 10) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Rodné číslo musí mať 9 alebo 10 znakov.'),
                    backgroundColor: Theme.of(context).errorColor,
                  ),
                );
              } else {
                _save();
              }
            },
            child: Text('Ulož'),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
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
