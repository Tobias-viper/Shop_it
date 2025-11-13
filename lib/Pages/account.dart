import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_it/Riverpod/provide.dart';
import 'package:shop_it/utils/color.dart';
import 'package:shop_it/Widgets/proemail.dart';

class Account extends StatelessWidget {
  Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:40.h,),
        proemail("Ola Abijo", "afolabimafolasere@gmail.com"),
        SizedBox(height:10.h,),
        SizedBox(
          height: 10.h,
        ),
        Container(

          decoration: BoxDecoration(
              color: color.deepOrangeAccent,
              borderRadius: BorderRadius.circular(10.r)),
          height: 100.h,
          margin: EdgeInsets.symmetric(horizontal: 35.w),
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Balance",
                style: TextStyle(
                  color: color.white,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Consumer(builder: (_, ref, c) {
                final hide_open = ref.watch(seeBalanceProvider);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      (hide_open) ? "\$20,000" : "******",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: color.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        ref.read(seeBalanceProvider.notifier).state =
                            !hide_open;
                      },
                      icon: Icon(
                        (hide_open)
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                        color: color.white,
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
        SizedBox(height:10.h,),
        Container(

          margin: EdgeInsets.symmetric(horizontal: 25.w),
          child: ListTile(
            leading:Icon(Icons.edit_sharp,color:color.deepOrangeAccent,),
            trailing:Icon(Icons.keyboard_arrow_right),
            title: Text(
              "Edit profile",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(

          margin: EdgeInsets.symmetric(horizontal: 25.w),
          child: ListTile(
            leading:Icon(Icons.location_city,color:color.deepOrangeAccent,),
            trailing:Icon(Icons.keyboard_arrow_right),
            title: Text(

              "Shipping point",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(

          margin: EdgeInsets.symmetric(horizontal: 25.w),
          child: ListTile(
            leading:Icon(Icons.gite_rounded,color:color.deepOrangeAccent,),
            trailing:Icon(Icons.keyboard_arrow_right),
            title: Text(
              "Cards",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(

          margin: EdgeInsets.symmetric(horizontal: 25.w),
          child: ListTile(
            leading:Icon(Icons.card_giftcard,color:color.deepOrangeAccent,),
            trailing:Icon(Icons.keyboard_arrow_right),
            title: Text(
              "Rewards",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ),      
         Container(
          margin: EdgeInsets.symmetric(horizontal: 25.w),
          child: ListTile(
            onTap: (){print(1);},
            leading:Icon(Icons.fiber_smart_record_sharp,color:color.deepOrangeAccent,),
            trailing:Icon(Icons.keyboard_arrow_right),
            title: Text(
              "Coupon",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ),      
      
      ],
    );
  }
}
