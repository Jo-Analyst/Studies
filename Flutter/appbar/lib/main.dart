import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() =>  _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
 late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =  TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  const Text('Meu App'),
        bottom:  TabBar(
          tabs: const <Tab>[
             Tab(text: 'Página 1'),
             Tab(text: 'Página 2'),
          ],
          controller: _tabController,
        ),
      ),
      body:  TabBarView(
        controller: _tabController,
        children: const <Widget>[
           Center(child:  Text('Página 1')),
           Center(child:  Text('Página 2')),
        ],
      ),
    );
  }
}