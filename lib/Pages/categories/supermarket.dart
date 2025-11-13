import 'package:flutter/material.dart';
import 'package:shop_it/Widgets/grid_view.dart';

class Market extends StatelessWidget {
  Market({super.key});
  //index is 0 for supermarket this is essential for the scroll details 
  @override
  Widget build(BuildContext context) {
    return dynamicGrid(indexOfcat: 0,);
  }
}