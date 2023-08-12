import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/inc_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Provider",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink[500],
      ),
      body: Center(
        child: Consumer<IncController>(
          builder: (context, value, child) {
            return Text(value.number.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<IncController>(context, listen: false).incNumber();
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
