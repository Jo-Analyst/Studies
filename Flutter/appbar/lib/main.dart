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
             Tab(text: 'Home', icon: Icon(Icons.home),),
             Tab(text: 'Configuração', icon: Icon(Icons.settings),),
          ],
          controller: _tabController,
        ),
      ),
      body:  TabBarView(
        controller: _tabController,
        children: const <Widget>[
           Center(child:  Text('Home')),
           Center(child:  Text('Configuração')),
        ],
      ),
    );
  }
}