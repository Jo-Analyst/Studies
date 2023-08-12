import 'package:flutter/material.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fab Menu circular"),
      ),
      body: const Center(child: Text("Fab Menu"),),
      // floatingActionButtonLocation:  FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FabCircularMenuPlus(
        ringColor: Colors.transparent,
        // ringDiameter: 120,
        ringWidth: 50,
        ringDiameterLimitFactor: 1,
        // alignment: Alignment.bottomCenter,
        fabOpenIcon: const Icon(Icons.add),
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home, size: 40,),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings, size: 40,),
          ),
        ],
      ),
    );
  }
}
