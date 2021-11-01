import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberTextField extends StatelessWidget {
  final Function changeText;
  final String placeholder;
  final int value;

  NumberTextField(this.changeText, this.placeholder, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30.0, right: 30.0, top: 4.0, bottom: 0.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              initialValue: value == null ? '' : value.toString(),
              keyboardType: TextInputType.number,
              autocorrect: false,
              enableSuggestions: false,
              autofocus: false,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                labelText: placeholder,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  final i = int.parse(value);
                  changeText(i);
                } else {
                  changeText(null);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
