import 'package:flutter/material.dart';
import '../utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_it/Widgets/cartlogo.dart';

PreferredSizeWidget? bar(
    IconData icon, BuildContext context, VoidCallback onTap) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      color: color.black,
      icon: Icon(icon),
      onPressed: () {
        if (icon == Icons.menu) {
          onTap();
        } else {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          onTap();
        }
      },
    ),
    centerTitle: true,
    title: Text("ShopIt",
        style: TextStyle(
            color: color.black, fontSize: 18.sp, fontWeight: FontWeight.w700)),
    actions: [
      Row(
        mainAxisSize: MainAxisSize.max,
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.only(right: 20.w),
            width: 10.w,
            child: IconButton(
                color: color.black,
                onPressed: () {},
                icon: Icon(Icons.search_outlined)),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: notify(
              Icons.shopping_cart_outlined,
              color: color.black,
            ),
          )
        ],
      ),
    ],
  );
}
