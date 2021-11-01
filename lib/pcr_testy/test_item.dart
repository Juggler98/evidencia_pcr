import 'package:evidencia_pcr/Application.dart';
import 'package:evidencia_pcr/models/PCRTest.dart';
import 'package:evidencia_pcr/widgets/person_widget.dart';
import 'package:evidencia_pcr/widgets/test_widget.dart';
import 'package:evidencia_pcr/search/search_type.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/test_detail_screen.dart';

class TestItem extends StatelessWidget {
  final PCRTest test;
  final bool testFirst;
  final Function clearData;

  const TestItem(this.test, this.testFirst, this.clearData);

  Widget get getTitleTestFirst {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 4),
        TestWidget(test),
        Text(''),
        PersonWidget(test.osoba),
      ],
    );
  }

  Widget get getTitlePersonFirst {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 4),
        PersonWidget(test.osoba),
        Text(''),
        TestWidget(test),
      ],
    );
  }

  PCRTest removeTest() {
    final app = Application();
    return app.removePCRTest(test.kodTestu, true);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(
          MaterialPageRoute(
            builder: (ctx) => TestDetailScreen(test),
          ),
        )
            .then((isDeleted) {
          if (isDeleted == true) {
            print('clearData');
            clearData();
          }
        });
      },
      child: Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        child: ListTile(
          leading: null,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              testFirst ? getTitleTestFirst : getTitlePersonFirst,
              SizedBox(height: 3),
            ],
          ),
          // trailing: MediaQuery.of(context).size.width > 500
          //     ? FlatButton.icon(
          //         onPressed: () {
          //           removeTest();
          //         },
          //         icon: const Icon(Icons.delete),
          //         label: const Text('Delete'),
          //         textColor: Theme.of(context).errorColor,
          //       )
          //     : IconButton(
          //         icon: const Icon(Icons.delete),
          //         color: Colors.black54,
          //         onPressed: () {
          //           removeTest();
          //         },
          //       ),
        ),
      ),
    );
  }
}
