import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("FAB Circular Menu"),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.yellowAccent[100],
      ),
      floatingActionButton: FabCircularMenu(
          alignment: Alignment.bottomRight,
          ringColor: Colors.blue.withAlpha(25),
          ringDiameter: 500.0,
          ringWidth: 150.0,
          fabSize: 90.0,
          fabElevation: 8.0,
          fabIconBorder: const CircleBorder(),
          children: <Widget>[
            RawMaterialButton(
              onPressed: () {
                displayMessage(context, 'Home Clicked');
              },
              elevation: 10.0,
              fillColor: Colors.green,
              padding: const EdgeInsets.all(15.0),
              shape: const CircleBorder(),
              child: const Icon(
                Icons.home,
                size: 30.0,
              ),
            ),
            RawMaterialButton(
              onPressed: () {
                displayMessage(context, 'Search Clicked');
              },
              elevation: 10.0,
              fillColor: Colors.orange,
              padding: const EdgeInsets.all(15.0),
              shape: const CircleBorder(),
              child: const Icon(
                Icons.search,
                size: 30.0,
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.purple,
              child: IconButton(
                  icon: const Icon(
                    Icons.settings,
                    size: 30,
                  ),
                  onPressed: () {
                    displayMessage(context, 'Setting Clicked');
                  }),
            ),
            IconButton(
                icon: const Icon(
                  Icons.star,
                  color: Colors.brown,
                  size: 40,
                ),
                onPressed: () {
                  displayMessage(context, 'Favorite Clicked');
                }),
          ]),
    );
  }

  void displayMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1000),
    ));
  }
}
