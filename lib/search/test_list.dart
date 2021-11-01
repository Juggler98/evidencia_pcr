import 'package:evidencia_pcr/Application.dart';
import 'package:evidencia_pcr/models/PCRTestDate.dart';
import 'package:evidencia_pcr/pcr_testy/person_item.dart';
import 'package:evidencia_pcr/pcr_testy/test_item.dart';
import 'package:flutter/material.dart';

import 'search_type.dart';

class TestList extends StatelessWidget {
  final List<PCRTestDate> tests;

  final SearchType searchType;

  TestList(this.tests, this.searchType);

  @override
  Widget build(BuildContext context) {
    if (tests == null || tests.length == 0) {
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
    return Container(
      child: ListView.builder(
          itemCount: tests.length,
          itemBuilder: (ctx, index) {
            if (searchType == SearchType.PositivePersons) {
              return PersonItem(tests[index].data);
            }
            return TestItem(tests[index].data);
          }),
    );
  }
}
