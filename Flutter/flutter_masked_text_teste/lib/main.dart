import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CurrencyInputForm(),
    );
  }
}

class CurrencyInputForm extends StatefulWidget {
  const CurrencyInputForm({super.key});
  @override
  State<CurrencyInputForm> createState() => _CurrencyInputFormState();
}

class _CurrencyInputFormState extends State<CurrencyInputForm> {
  final MoneyMaskedTextController _controller = MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Amount',
            prefixText: 'R\$ ',
          ),
        ),
      ),
    );
  }
}
