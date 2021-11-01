import 'package:flutter/material.dart';

class StringTextField extends StatefulWidget {
  final Function changeText;
  final String placeholder;

  StringTextField(this.changeText, this.placeholder);

  @override
  _StringTextFieldState createState() => _StringTextFieldState();
}

class _StringTextFieldState extends State<StringTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30.0, right: 30.0, top: 8.0, bottom: 4.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.characters,
              autocorrect: false,
              enableSuggestions: false,
              autofocus: false,
              decoration: InputDecoration(
                labelText: widget.placeholder,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              onChanged: (value) {
                widget.changeText(value.isEmpty ? null : value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
