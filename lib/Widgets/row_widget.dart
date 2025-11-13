import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/color.dart';

class row extends StatelessWidget {
  row({Key? key,required this.cat}) : super(key: key);
  String cat;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          cat,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
        ),
        Text(
          "",
          style: TextStyle(color: color.deepOrangeAccent),
        )
      ],
    );
  }
}
