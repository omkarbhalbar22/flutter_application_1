import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';

import '../utiles/widgets/drawer.dart';
import '../utiles/widgets/item_widgets.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});
  final int days = 1;
  final name = "Omkar";

  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catolog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummylist.length,
          itemBuilder: (context, index) {
            return ItemWidgets(
              item: dummylist[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
