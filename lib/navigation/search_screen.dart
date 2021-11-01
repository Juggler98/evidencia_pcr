import 'package:evidencia_pcr/Application.dart';
import 'package:evidencia_pcr/models/Osoba.dart';
import 'package:evidencia_pcr/models/PCRTest.dart';
import 'package:evidencia_pcr/models/PCRTestDate.dart';
import 'package:evidencia_pcr/models/UzemnaJednotka.dart';
import 'package:evidencia_pcr/search/date_picker.dart';
import 'package:evidencia_pcr/search/number_textfield.dart';
import 'package:evidencia_pcr/search/search_dropdown.dart';
import 'package:evidencia_pcr/search/test_single.dart';
import 'package:evidencia_pcr/search/string_textfield.dart';
import 'package:evidencia_pcr/search/search_type.dart';
import 'package:evidencia_pcr/search/test_list.dart';
import 'package:evidencia_pcr/search/uzemne_jednotky_dropdown.dart';
import 'package:evidencia_pcr/search/uz_typ.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {

  SearchScreen();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin<SearchScreen> {
  var _enteredText = '-';

  var _searchType = SearchType.PcrTest;
  var _uzJednotkaType = UzType.All;

  var _onlyPositive = false;

  var _kodUzJednotky = 0;

  var _pocetDni;

  DateTime _startDate;
  DateTime _endDate;

  List<PCRTestDate> _testList = [];

  List<PCRTestDate> _personTest = [];

  final app = new Application();

  @override
  bool get wantKeepAlive => true;

  void _setSearchType(SearchType type) {
    setState(() {
      _searchType = type;
      //if (type == SearchType.PositivePersons) {
      _startDate = null;
      _endDate = null;
      //}
      _testList = [];
    });
  }

  void _setUzJednotka(UzType type) {
    setState(() {
      _uzJednotkaType = type;
      _testList = [];
    });
  }

  void _setEnteredCode(String value) {
    setState(() {
      _enteredText = value;
      if (_searchType == SearchType.PersonTests) {
        final osoba = app.getOsoba(_enteredText);
        if (osoba != null) {
          _personTest = osoba.getTesty().getInOrderData();
          _showDataCount(_personTest.length);
        } else {
          _personTest = [];
        }
      }
    });
  }

  void _setKodUzJednotky(int value) {
    setState(() {
      _kodUzJednotky = value;
    });
  }

  void _setStartDate(DateTime date) {
    setState(() {
      _startDate = date;
    });
  }

  void _setEndDate(DateTime date) {
    setState(() {
      _endDate =
          DateTime(date.year, date.month, date.day, 23, 59, 59, 999, 999);
    });
  }

  void _setList(List<PCRTestDate> list) {
    setState(() {
      _testList = list;
    });
    _showDataCount(list.length);
  }

  void _setDayNumber(int x) {
    setState(() {
      _pocetDni = x;
    });
  }

  void _showDataCount(int count) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Počet dát: ' + count.toString()),
      ),
    );
  }

  void _search() {
    if (_searchType == SearchType.PcrTestRange ||
        _searchType == SearchType.PositivePersons) {
      final testData1 =
          PCRTest('', null, null, null, null, null, null, null, _startDate);
      final testData2 =
          PCRTest('', null, null, null, null, null, null, null, _endDate);
      print(_startDate.toString());
      print(_endDate.toString());
      final test1 = PCRTestDate(testData1);
      final test2 = PCRTestDate(testData2);
      UzemnaJednotka uzemnaJednotka;
      switch (_uzJednotkaType) {
        case UzType.All:
          if (_onlyPositive) {
            _setList(app.getPcrTreePositive().getIntervalData(test1, test2));
            return;
          }
          _setList(app.getPcrTreeDate().getIntervalData(test1, test2));
          return;
        case UzType.Okres:
          uzemnaJednotka = app.getOkres(_kodUzJednotky);
          break;
        case UzType.Kraj:
          uzemnaJednotka = app.getKraj(_kodUzJednotky);
          break;
        case UzType.Pracovisko:
          uzemnaJednotka = app.getPracovisko(_kodUzJednotky);
          break;
      }
      if (uzemnaJednotka != null) {
        if (_onlyPositive) {
          _setList(
              uzemnaJednotka.getPozitivneTesty().getIntervalData(test1, test2));
          return;
        }
        _setList(uzemnaJednotka.getTesty().getIntervalData(test1, test2));
        return;
      } else {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Územná jednotka neexistuje.'),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
      }
    }
  }

  String get getNumberTextFieldText {
    switch (_uzJednotkaType) {
      case UzType.All:
        return '';
        break;
      case UzType.Okres:
        return 'Zadaj kód okresu';
        break;
      case UzType.Kraj:
        return 'Zadaj kód kraju';
        break;
      case UzType.Pracovisko:
        return 'Zadaj kód pracoviska';
        break;
    }
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
        Container(
          child: SearchDropdown(_setSearchType),
        ),
        if (_searchType == SearchType.PcrTest)
          StringTextField(_setEnteredCode, 'Zadaj kód testu'),
        if (_searchType == SearchType.PersonTests)
          StringTextField(_setEnteredCode, 'Zadaj rodné číslo'),
        if (_searchType == SearchType.PcrTestRange)
          Column(
            children: [
              UzemneJednotkyDropdown(_setUzJednotka, _uzJednotkaType),
              if (_searchType == SearchType.PcrTestRange &&
                  _uzJednotkaType != UzType.All)
                NumberTextField(_setKodUzJednotky, getNumberTextFieldText),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 4.0, bottom: 0.0),
                child: SwitchListTile.adaptive(
                  title: Text('Iba pozitívne'),
                  secondary: Icon(
                    Icons.list_alt,
                    color: Colors.brown,
                  ),
                  value: _onlyPositive,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      _onlyPositive = value;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DatePicker('Vyber začiatok', _setStartDate, _startDate),
                  SizedBox(width: 4),
                  DatePicker('Vyber koniec', _setEndDate, _endDate),
                ],
              ),
              SizedBox(height: 2),
              ElevatedButton(
                onPressed: _startDate == null || _endDate == null
                    ? null
                    : () {
                        _search();
                      },
                child: Text('Hľadaj'),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  //backgroundColor: MaterialStateProperty.all(Colors.brown),
                ),
              ),
            ],
          ),
        if (_searchType == SearchType.PositivePersons)
          Column(
            children: [
              UzemneJednotkyDropdown(_setUzJednotka, _uzJednotkaType),
              if (_searchType == SearchType.PositivePersons &&
                  _uzJednotkaType != UzType.All)
                NumberTextField(_setKodUzJednotky, getNumberTextFieldText),
              SizedBox(height: 4),
              NumberTextField(_setDayNumber, 'Max počet dní od testu'),
              DatePicker('k dátumu', _setEndDate, _endDate),
              SizedBox(height: 2),
              ElevatedButton(
                onPressed: _endDate == null || _pocetDni == null
                    ? null
                    : () {
                        _startDate =
                            _endDate.subtract(Duration(days: _pocetDni));
                        _startDate = DateTime(
                            _startDate.year, _startDate.month, _startDate.day);
                        print(_pocetDni);
                        _search();
                      },
                child: Text('Hľadaj'),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  //backgroundColor: MaterialStateProperty.all(Colors.brown),
                ),
              ),
            ],
          ),
        Expanded(
          child: _searchType == SearchType.PcrTest
              ? TestSingle(app.getPCRTest(_enteredText))
              : _searchType == SearchType.PersonTests
                  ? TestList(_personTest, _searchType)
                  : TestList(_testList, _searchType),
        ),
      ],
    );
  }
}
