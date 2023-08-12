import 'package:cripto_moeda/models/moeda.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MoedasDetalhesPage extends StatefulWidget {
  final Moeda moeda;
  const MoedasDetalhesPage({super.key, required this.moeda});

  @override
  State<MoedasDetalhesPage> createState() => _MoedasDetalhesPageState();
}

class _MoedasDetalhesPageState extends State<MoedasDetalhesPage> {
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  double quantidade = 0;
  NumberFormat real = NumberFormat.currency(locale: "pt_BR", name: "R\$");

  void comprar() {
    if (_form.currentState!.validate()) {
      // salvar a compra

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
          content: Text("Compra realizada com sucesso!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.moeda.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.moeda.icone,
                    width: 50,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    real.format(widget.moeda.preco),
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            quantidade > 0
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      alignment: Alignment.center,
                      decoration:
                          BoxDecoration(color: Colors.teal.withOpacity(.05)),
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "$quantidade ${widget.moeda.sigla}",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(bottom: 24),
                  ),
            Form(
              key: _form,
              child: TextFormField(
                controller: _valor,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Valor",
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  suffix: Text(
                    "Reais",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (valor) {
                  if (valor!.isEmpty) {
                    return "informe o valor da compra";
                  } else if (double.parse(valor) < 50) {
                    return "Compra mínima é R\$ 50,00";
                  }

                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    quantidade = value.isEmpty
                        ? 0
                        : double.parse(_valor.text) / widget.moeda.preco;
                  });
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(top: 24),
              child: ElevatedButton(
                onPressed: () {
                  comprar();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Comprar",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
