import 'package:flutter/material.dart';
import 'package:shop_it/Widgets/grid_view.dart';

class Fashion extends StatelessWidget {
  const Fashion({super.key});
  //index is 1 for supermarket this is essential for the scroll details
  @override
  Widget build(BuildContext context) {
    return dynamicGrid(indexOfcat: 1,);
  }
}