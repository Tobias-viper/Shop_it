import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_it/utils/color.dart';

class Ta_b extends StatelessWidget {
  Ta_b(
      {this.onTap,
      Key? key,
      this.icon,
      required this.text,
      required this.num_ta,
      required this.c_olor})
      : super(key: key);

  IconData? icon;
  int num_ta;
  String text;
  List<Color> c_olor;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
  
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        height: 25.h,
        child:
            Row(children: [
          icon != null
              ? Center(
                  child: Icon(
                  icon,
                  size: 18.r,
                ))
              : const SizedBox(width: 0),
          SizedBox(width:2.w),
          Text(text)
        ]),
        decoration: BoxDecoration(
            color: c_olor[num_ta],
            borderRadius: BorderRadius.circular(7.r),
            border: Border.all(width: 2.r, color: (c_olor[num_ta]==color.deepOrangeAccent)? color.deepOrangeAccent:color.border)),
      ),
    );
  }
}
