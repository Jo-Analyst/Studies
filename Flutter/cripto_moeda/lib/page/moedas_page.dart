import 'package:cripto_moeda/models/moeda.dart';
import 'package:cripto_moeda/page/moedas_detalhes_page.dart';
import 'package:cripto_moeda/repositories/favoritias_repository.dart';
import 'package:cripto_moeda/repositories/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedaRepository.tabela;
  NumberFormat real = NumberFormat.currency(locale: "pt_BR", name: "R\$");
  List<Moeda> selecionadas = [];
  late FavoritasRepository favoritas;

  limparSelecionadas() {
    setState(() {
      selecionadas.clear();
    });
  }

  appBarDinamica() {
    if (selecionadas.isEmpty) {
      return AppBar(
        title: const Text("Cripto Moeda"),
        centerTitle: true,
      );
    } else {
      return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            limparSelecionadas();
          },
        ),
        title: Text("${selecionadas.length} selecionadas"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[50],
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87),
        titleTextStyle: const TextStyle(
            color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
      );
    }
  }

  mostrarDetalhes(Moeda moeda) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MoedasDetalhesPage(moeda: moeda),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // favoritas = Provider.of<FavoritasRepository>(context);
    favoritas = context.watch<FavoritasRepository>();
    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, moeda) {
          return ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            leading: selecionadas.contains(tabela[moeda])
                ? const CircleAvatar(
                    child: Icon(Icons.check),
                  )
                : Image.asset(
                    tabela[moeda].icone,
                    width: 40,
                  ),
            title: Row(
              children: [
                Text(
                  tabela[moeda].nome,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (favoritas.lista.contains(tabela[moeda]))
                  const Icon(
                    Icons.circle,
                    color: Colors.amber,
                    size: 8,
                  )
              ],
            ),
            trailing: Text(
              real.format(tabela[moeda].preco),
            ),
            selected: selecionadas.contains(tabela[moeda]),
            selectedTileColor: Colors.indigo.shade50,
            onLongPress: () {
              setState(() {
                selecionadas.contains(tabela[moeda])
                    ? selecionadas.remove(tabela[moeda])
                    : selecionadas.add(tabela[moeda]);
              });
            },
            onTap: () => mostrarDetalhes(tabela[moeda]),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: tabela.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selecionadas.isEmpty
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                favoritas.saveAll(selecionadas);
                limparSelecionadas();
              },
              icon: const Icon(Icons.stars),
              label: const Text(
                "Favoritar",
                style: TextStyle(
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
