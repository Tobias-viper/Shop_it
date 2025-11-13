import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:shop_it/Pages/details/detail_body.dart';
import 'package:shop_it/Riverpod/provide.dart';
import '../../Widgets/bar.dart';
import '../../utils/color.dart';

class detailPage extends StatelessWidget {
  detailPage({
    Key? key,
    required this.save,
    required this.data,
    required this.image,
    required this.text,
    required this.price,
    required this.star,
  }) : super(key: key);
  String image;
  String text;
  String price;
  int star;
  Map<int, String> data;
  Map save;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, child) => Scaffold(
        appBar: bar(
          Icons.arrow_back_ios,
          context,
          () {
            Navigator.of(context)
                .pop(ref.read(setFavoriteProvider.notifier).state);
          },
        ),
        backgroundColor: color.transparent,
        body: detailBody(
          save: save,
          image: image,
          text: text,
          price: price,
          star: star,
          data: data,
        ),
      ),
    );
  }
}
