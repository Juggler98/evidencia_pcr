import 'package:evidencia_pcr/Application.dart';
import 'package:evidencia_pcr/navigation/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'models/tests/TestGenerator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final app = Application();
    app.addRandomPersons(1000);
    app.addRandomPCRTest(1000);
    return MaterialApp(
      title: 'Evidencia PCR testov',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      localizationsDelegates: [
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('sk', 'SK')],
      localeResolutionCallback: (locale, supportedLocales) {
        return supportedLocales.first;
      },
      home: TabsScreen(),
    );
  }
}

class TestPage extends StatefulWidget {
  TestPage();

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  void _runTests() {
    // Kedze neviem pristup pri generickom type T ku key, tak sa nevypisuju hodnoty klucov.
    TestGenerator().runTests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Structure tests'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _runTests,
        tooltip: 'Run tests',
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
