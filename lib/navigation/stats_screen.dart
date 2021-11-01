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

class StatsScreen extends StatefulWidget {

  StatsScreen();

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen>
    with AutomaticKeepAliveClientMixin<StatsScreen> {

  var _uzJednotkaType = UzType.Kraj;

  var _pocetDni = 0;

  DateTime _startDate;
  DateTime _endDate;

  List<UzemnaJednotka> _uzList = [];

  final app = new Application();

  @override
  bool get wantKeepAlive => true;


  void _setUzJednotka(UzType type) {
    setState(() {
      _uzJednotkaType = type;
      _uzList = [];
    });
  }

  void _setEndDate(DateTime date) {
    setState(() {
      _endDate =
          DateTime(
              date.year,
              date.month,
              date.day,
              23,
              59,
              59,
              999,
              999);
    });
  }

  void _setList(List<UzemnaJednotka> list) {
    setState(() {
      _uzList = list;
    });
  }

  void _setDayNumber(int x) {
    setState(() {
      _pocetDni = x;
    });
  }

  void _search() {
    final testData1 =
    PCRTest(
        '',
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        _startDate);
    final testData2 =
    PCRTest(
        '',
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        _endDate);
    print(_startDate.toString());
    print(_endDate.toString());
    final test1 = PCRTestDate(testData1);
    final test2 = PCRTestDate(testData2);
    final uzemneJednotky = new TTTree<num, UzemnaJednotka>();
    if (_uzJednotkaType == UzType.Okres) {
      for (int okresCode in app.getOkresCodes()) {
        Okres okres = app.getOkres(okresCode);
        final okresPocetPozitivnych = new OkresPocetPozitivnych(
            okres.getKod(), okres.getNazov());
        okresPocetPozitivnych.setPocetPozitivnych(
            okres.getPozitivneTesty().getIntervalData(test1, test2).length);
        uzemneJednotky.add(okresPocetPozitivnych);
      }
    } else if (_uzJednotkaType == UzType.Kraj) {
      for (int krajeCodes in app.getKrajCodes()) {
        Kraj kraj = app.getKraj(krajeCodes);
        KrajPocetPozitivnych krajPocetPozitivnych = new KrajPocetPozitivnych(
            kraj.getKod(), kraj.getNazov());
        krajPocetPozitivnych.setPocetPozitivnych(
            kraj.getPozitivneTesty().getIntervalData(test1, test2).length);
        uzemneJednotky.add(krajPocetPozitivnych);
      }
    }
    final temp = uzemneJednotky.getInOrderData();
    List<UzemnaJednotka> temp2 = [];
    for (int i = temp.length - 1; i >= 0; i--) {
      temp2.add(temp[i]);
    }
    _setList(temp2);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Column(
      children: [
        StatsDropdown(_setUzJednotka, _uzJednotkaType),
        SizedBox(height: 4),
        NumberTextField(_setDayNumber, 'Max počet dní od testu'),
        DatePicker('k dátumu', _setEndDate, _endDate),
        SizedBox(height: 2),
        ElevatedButton(
          onPressed: _endDate == null || _pocetDni == null
              ? null
              : () {
            _startDate = _endDate.subtract(Duration(days: _pocetDni));
            _startDate =
                DateTime(_startDate.year, _startDate.month, _startDate.day);
            print(_pocetDni);
            _search();
          },
          child: Text('Zoraď'),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
            ),
            //backgroundColor: MaterialStateProperty.all(Colors.brown),
          ),
        ),
        SizedBox(height: 2),
        Expanded(
          child: StatsList(_uzList, _uzJednotkaType),
        ),
      ],
    );
  }
}
