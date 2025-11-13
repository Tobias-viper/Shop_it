import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_it/utils/color.dart';

Widget call_cart_Check(String text, VoidCallback onTap) {
  return Row(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          child: Container(
            height: 50.r,
            width: 50.r,
            alignment: Alignment.center,
            child: Icon(Icons.phone, color: color.deepOrangeAccent),
            decoration: BoxDecoration(
                border: Border.all(color: color.border, width: 1.r),
                borderRadius: BorderRadius.circular(5.r)),
          ),
        ),
      ),
      SizedBox(
        width: 8.w,
      ),
      Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50.r,
            width: 280.r,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart_rounded, color: Colors.white),
                SizedBox(
                  width: 3.r,
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: color.deepOrangeAccent,
                borderRadius: BorderRadius.circular(5.r)),
          ),
        ),
      ),
    ],
  );
}
