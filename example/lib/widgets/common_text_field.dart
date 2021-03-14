import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  CommonTextField({Key key, this.controller, this.title, this.hint}) : super(key: key);

  final TextEditingController controller;
  final String title;
  final String hint;

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 0.0),
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(hintText: widget.hint, labelText: widget.hint),
        ));
  }
}
