import 'package:flutter/material.dart';

import '../Pages/utils/list.dart';

class dynamiclist extends StatelessWidget {
  const dynamiclist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list_dynamic.length,
      itemBuilder: (_, index) => Align(
        alignment: Alignment.topLeft,
        child: list_dynamic[index],
      ),
    );
  }
}
