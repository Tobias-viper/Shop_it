import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_it/admin/Riverpod/provide.dart';
import 'package:shop_it/admin/draw.dart';
import 'package:shop_it/admin/products/order%20details/orderPage.dart';
import 'package:shop_it/admin/products/productlist.dart';

class Admin extends StatelessWidget {
  Admin({Key? key}) : super(key: key);

  List screens = [];

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Shopit Admin",
          style: TextStyle(color: Colors.blueAccent),
        ),
        backgroundColor: Color.fromARGB(77, 249, 244, 244),
        centerTitle: true,
        leading: IconButton(
          color: Colors.blueAccent,
          icon: Icon(Icons.menu_open_sharp),
          onPressed: () {
            if (key.currentState!.isDrawerOpen) {
              key.currentState!.closeDrawer();
            } else {
              key.currentState!.openDrawer();
            }
          },
        ),
      ),
      drawer: draw(),
      body: Consumer(
        builder: (context, ref, child) {
          final currentScreen = ref.watch(screenContorller);
          return OrderPage();//ProductList();
        },
      ),
    );
  }
}
