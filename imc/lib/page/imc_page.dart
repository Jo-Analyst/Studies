import 'package:flutter/material.dart';
import 'package:imc/components/text_form_field.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text("IMC"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormFieldComponent(
                labelText: "Sua massa corporal",
                onChanged: (value) {},
                msgError: const [
                  "Informe sua massa corporal!",
                  "Valor inválido!"
                ],
              ),
              TextFormFieldComponent(
                labelText: "Sua altura",
                onChanged: (value) {},
                msgError: const ["Informe sua altura", "Valor inválido"],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (globalKey.currentState!.validate()) {}
                  },
                  child: const Text("Calcular IMC"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
