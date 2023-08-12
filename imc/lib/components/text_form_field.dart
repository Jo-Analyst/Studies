import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatelessWidget {
  final Function(String) onChanged;
  final String labelText;
  final List<String> msgError;
  const TextFormFieldComponent({
    required this.labelText,
    required this.onChanged,
    required this.msgError,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      key: key,
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.displayLarge!.fontSize),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 18),
      ),
      onChanged: (value) => onChanged(value),
      validator: (value) {
        if (value!.isEmpty) {
          return msgError[0];
        } else if (double.parse(value) == 0) {
          return msgError[1];
        }

        return null;
      },
    );
  }
}
