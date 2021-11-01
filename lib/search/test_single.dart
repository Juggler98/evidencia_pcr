import 'package:evidencia_pcr/Application.dart';
import 'package:evidencia_pcr/models/PCRTest.dart';
import 'package:evidencia_pcr/pcr_testy/test_item.dart';
import 'package:flutter/material.dart';

import 'search_type.dart';

class TestSingle extends StatelessWidget {

  final PCRTest test;

  TestSingle(this.test);

  @override
  Widget build(BuildContext context) {
    if (test == null) {
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
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (ctx, index) {
          return TestItem(test);
        });
  }
}
