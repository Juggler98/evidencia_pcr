import 'package:flutter/material.dart';

class StringTextField extends StatelessWidget {
  final Function changeText;
  final String placeholder;
  final TextEditingController controller;

  StringTextField(this.changeText, this.placeholder, this.controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30.0, right: 30.0, top: 8.0, bottom: 4.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: false,
              enableSuggestions: false,
              autofocus: false,
              decoration: InputDecoration(
                labelText: placeholder,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              onChanged: (value) {
                changeText(value.isEmpty ? null : value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
