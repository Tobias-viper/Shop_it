import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class detailDynamicList extends StatelessWidget {
  const detailDynamicList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (_, index) => Align(
          alignment:Alignment.topLeft,
          child: Container(
            width:250.w,
            height:200.h,
            margin:EdgeInsets.only(right:10.r),
            color:Colors.white,
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  width:250.w,
                  height:200.h,
                  margin:EdgeInsets.only(top:3.r,bottom:3.r,left:3.r,right:3.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      image: DecorationImage(
                        image:AssetImage('assets/pic.png'),
                        fit: BoxFit.cover
                )
              ),
            )
              ),
          ),
        )    
    );
  }
}
