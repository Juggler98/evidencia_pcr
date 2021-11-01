import 'package:evidencia_pcr/search/uz_typ.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberTextField extends StatefulWidget {
  final Function changeText;
  final String placeholder;

  NumberTextField(this.changeText, this.placeholder);

  @override
  _NumberTextFieldState createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30.0, right: 30.0, top: 4.0, bottom: 0.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              keyboardType: TextInputType.number,
              autocorrect: false,
              enableSuggestions: false,
              autofocus: false,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                labelText: widget.placeholder,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  final i = int.parse(value);
                  widget.changeText(i);
                } else {
                  widget.changeText(null);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
