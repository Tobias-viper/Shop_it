import 'package:shop_it/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget proemail(String Name, String Gmail) {
  return Padding(
    padding:EdgeInsets.only(left:20.w,right: 20.w),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 20.r,
          foregroundColor: color.black,
          backgroundImage: AssetImage('assets/pic.png'),
        ),
        SizedBox(
          width: 4.w,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Name,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            Text(
              Gmail,
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    ),
  );
}
