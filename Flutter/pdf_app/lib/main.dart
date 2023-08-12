import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF Creator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PdfScreen(),
    );
  }
}

class PdfScreen extends StatelessWidget {
  final List<Map<String, dynamic>> tableData = [
    {'Name': 'John Doe', 'Age': 30},
    {'Name': 'Jane Smith', 'Age': 25},
    // Adicione mais dados à lista conforme necessário
  ];

  PdfScreen({super.key});

  Future<void> generateAndSharePDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        orientation: pw.PageOrientation.landscape,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text(
                  'Exemplo de PDF com Tabela e Texto',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.TableHelper.fromTextArray(
                  context: context,
                  data: <List<String>>[
                    <String>['Name', 'Age'],
                    ...tableData.map(
                        (entry) => [entry['Name'], entry['Age'].toString()]),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/example.pdf");
    await file.writeAsBytes(await pdf.save());

    Share.shareFiles([file.path], text: 'Check out my PDF!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Creator')),
      body: Center(
        child: ElevatedButton(
          onPressed: generateAndSharePDF,
          child: const Text('Generate and Share PDF'),
        ),
      ),
    );
  }
}
