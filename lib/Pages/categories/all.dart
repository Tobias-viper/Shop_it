import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_it/Widgets/display_card.dart';
import 'package:shop_it/Widgets/list_view.dart';

import '../../Widgets/row_widget.dart';

class All extends StatelessWidget {
  const All({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          child: row(cat: "New Arrival"),
          margin: EdgeInsets.only(right: 20.w),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          //alignment: Alignment.topLeft,
          height: 200.h,
          
          child: Align(
            alignment: Alignment.topLeft,
            child:dynamiclist(),
          ),
        ),
        SizedBox(height:10.h,),
        Container(
          child: row(cat: "Most Popular"),
          margin: EdgeInsets.only(right: 20.w),

        ),
        SizedBox(height:10.h,),
        Container(
          //alignment: Alignment.topLeft,
          height: 200.h,
          child: Align(
            alignment: Alignment.topLeft,
            child:dynamiclist(),
          ),
        ),
      
      ]);
  }
}
