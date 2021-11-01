import 'package:evidencia_pcr/search/uz_typ.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberTextField extends StatefulWidget {
  final Function changeText;
  final String placeholder;
  final int value;

  NumberTextField(this.changeText, this.placeholder, this.value);

  @override
  _NumberTextFieldState createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.value != null)
      _controller = TextEditingController()..text = widget.value.toString();
    else
      _controller = TextEditingController()..text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30.0, right: 30.0, top: 4.0, bottom: 0.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
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
