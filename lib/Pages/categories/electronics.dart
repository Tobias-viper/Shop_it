import 'package:flutter/material.dart';
import 'package:shop_it/Widgets/grid_view.dart';

class Electronics extends StatelessWidget {
  Electronics({Key? key}):super(key: key);
  //index is 2 for supermarket this is essential for the scroll details
  @override
  Widget build(BuildContext context) {
    return dynamicGrid(indexOfcat:2,);
  }
}