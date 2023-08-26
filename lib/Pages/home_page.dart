import 'package:flutter/material.dart';

import '../utiles/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});
  final int days = 1;
  final name = "Omkar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catolog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Hello $name, This $days at the Flutter"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
