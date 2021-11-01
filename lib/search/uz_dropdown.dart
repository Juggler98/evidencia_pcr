import 'package:flutter/material.dart';

import 'uz_typ.dart';


class UzDropdown extends StatefulWidget {
  final Function changeValue;

  final UzType typ;

  UzDropdown(this.changeValue, this.typ);

  @override
  _UzDropdownState createState() => _UzDropdownState();
}

class _UzDropdownState extends State<UzDropdown> {
  //UzemneJednotkyTyp _searchTypeChoose = UzemneJednotkyTyp.All;

  final _searchTypesItems = [
    UzType.All,
    UzType.Okres,
    UzType.Kraj,
    UzType.Pracovisko,
  ];

  String _getSearchStringSwitch(UzType type) {
    switch (type) {
      case UzType.All:
        return 'Všetky územné jednotky';
      case UzType.Okres:
        return 'Okres';
      case UzType.Kraj:
        return 'Kraj';
      case UzType.Pracovisko:
        return 'Pracovisko';
      default:
        return 'Unknown';
    }
  }

  var _isDarkMode = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isDarkMode = Theme.of(context).brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 30.0, right: 30.0, top: 4.0, bottom: 0.0),
      child: Container(
        padding: const EdgeInsets.only(left: 24, right: 24),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(24),
        ),
        child: DropdownButton(
          hint: Text('Vyber typ úz. jednotky'),
          dropdownColor: _isDarkMode ? Color.fromRGBO(55, 55, 55, 1) : Colors.white,
          isExpanded: true,
          underline: SizedBox(),
          value: widget.typ,
          onChanged: (newValue) {
            setState(() {
              widget.changeValue(newValue);
            });
          },
          items: _searchTypesItems.map((valueItem) {
            return DropdownMenuItem(
              value: valueItem,
              child: Text(_getSearchStringSwitch(valueItem)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
