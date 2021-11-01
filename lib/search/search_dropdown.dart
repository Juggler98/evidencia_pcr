import 'package:flutter/material.dart';

import 'search_type.dart';


class SearchDropdown extends StatefulWidget {
  final Function changeValue;

  SearchDropdown(this.changeValue);

  @override
  _SearchDropdownState createState() => _SearchDropdownState();
}

class _SearchDropdownState extends State<SearchDropdown> {
  SearchType _searchTypeChoose = SearchType.PcrTest;

  final _searchTypesItems = [
    SearchType.PcrTest,
    SearchType.PersonTests,
    SearchType.PcrTestRange,
    SearchType.PositivePersons,
  ];

  String _getSearchStringSwitch(SearchType type) {
    switch (type) {
      case SearchType.PcrTest:
        return 'PCR test';
      case SearchType.PersonTests:
        return 'Testy pacienta';
      case SearchType.PcrTestRange:
        return 'Zoznam PCR testov';
      case SearchType.PositivePersons:
        return 'Pozitívne osoby';
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
          left: 30.0, right: 30.0, top: 8.0, bottom: 0.0),
      child: Container(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(24),
        ),
        child: DropdownButton(
          hint: Text('Vyber typ vyhľadávania'),
          dropdownColor: _isDarkMode ? Color.fromRGBO(55, 55, 55, 1) : Colors.white,
          isExpanded: true,
          underline: SizedBox(),
          value: _searchTypeChoose,
          onChanged: (newValue) {
            setState(() {
              _searchTypeChoose = newValue;
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
