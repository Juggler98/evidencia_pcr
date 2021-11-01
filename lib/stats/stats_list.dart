import 'package:evidencia_pcr/application.dart';
import 'package:evidencia_pcr/models/KrajPocetPozitivnych.dart';
import 'package:evidencia_pcr/models/OkresPocetPozitivnych.dart';
import 'package:evidencia_pcr/models/PCRTestDate.dart';
import 'package:evidencia_pcr/models/UzemnaJednotka.dart';
import 'package:evidencia_pcr/pcr_testy/test_item.dart';
import 'package:evidencia_pcr/stats/stat_item.dart';
import 'package:evidencia_pcr/search/uz_typ.dart';
import 'package:flutter/material.dart';

import '../search/search_type.dart';

class StatsList extends StatelessWidget {
  final List<UzemnaJednotka> uzJednotky;

  final UzType typ;

  StatsList(this.uzJednotky, this.typ);

  @override
  Widget build(BuildContext context) {
    if (uzJednotky == null || uzJednotky.length == 0) {
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
          itemCount: uzJednotky.length,
          itemBuilder: (ctx, index) {
            if (typ == UzType.Okres) {
              final okres = uzJednotky[index] as OkresPocetPozitivnych;
              return StatItem(
                uzemnaJednotka: uzJednotky[index],
                positiveCount: okres.pocetPozitivnych,
                index: index + 1,
              );
            } else if (typ == UzType.Kraj) {
              final kraj = uzJednotky[index] as KrajPocetPozitivnych;
              return StatItem(
                uzemnaJednotka: uzJednotky[index],
                positiveCount: kraj.pocetPozitivnych,
                index: index + 1,
              );
            }
            return SizedBox();
          }),
    );
  }
}
