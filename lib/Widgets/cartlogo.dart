import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_it/Pages/cartPage.dart';
import 'package:shop_it/utils/color.dart';
import 'package:shop_it/Riverpod/provide.dart';

class notify extends StatelessWidget {
  notify(this.icon, {Key? key, this.color}) : super(key: key);
  IconData icon;
  Color? color;
  int x = 0;
  IconData icon_1 = Icons.shopping_cart;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer(builder: (_, ref, c) {
          final int _control = ref.watch(cartPageController);
          return IconButton(
            color: color,
            onPressed: () {
              if (_control % 2 == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cartpage(),
                  ),
                );
                ref.read(cartPageController.notifier).state++;
              } else {
                Navigator.pop(context);
                ref.read(cartPageController.notifier).state--;
              }
            },
            icon: (_control % 2 == 0) ? Icon(icon) : Icon(icon_1,color:Colors.deepOrangeAccent),
          );
        }),
        Positioned(
          right: 8.w,
          top: 3.h,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 9.r,
            child: Center(
              child: Consumer(
                builder: (_, ref, c) => Text(
                  ref.watch(currentCartNumberProvider).toString(),
                  style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
