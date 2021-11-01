import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final String title;
  final Function pickDate;
  final DateTime date;

  DatePicker(this.title, this.pickDate, this.date);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      widget.pickDate(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(
        widget.date == null
            ? widget.title
            : DateFormat.yMd(Localizations.localeOf(context).toString())
                .format(widget.date),
        style: TextStyle(fontSize: 16),
      ),
      icon: Icon(
        Icons.date_range,
        size: 22,
      ),
      onPressed: _datePicker,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        //backgroundColor: MaterialStateProperty.all(Colors.grey),
      ),
    );
  }
}
