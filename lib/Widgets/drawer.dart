import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_it/Riverpod/provide.dart';
import 'package:shop_it/Widgets/proemail.dart';
import '../utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Draw extends StatelessWidget {
  Draw({required this.onTap, Key? key}) : super(key: key);
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w,right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Menu",
                        style: TextStyle(
                            color: color.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp),
                      ),
                      CircleAvatar(
                        radius: 10.r,
                        backgroundColor: Color.fromARGB(182, 250, 240, 240),
                        child: GestureDetector(
                            onTap: onTap, child: Icon(Icons.cancel)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                proemail("Ola Abijo", "afolabitobias@gmail.com"),
                ListTile(
                  title: Text(
                    "Purchase History",
                    style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.history,
                    color: color.deepOrangeAccent,
                  ),
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.settings,
                    color: color.deepOrangeAccent,
                  ),
                  childrenPadding:EdgeInsets.only(left:20.w),
                  title: Text(
                    "Settings",
                    style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //mainAxisSize: MainAxisSize.min,
                      children: [Icon(Icons.privacy_tip), Text("Privacy")],
                    ),
                    Row(
                      //mainAxisSize:MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Light Mode"),
                        Consumer(builder: (context, ref, child) {
                          final val = ref.watch(updateSwitchProvider);

                          return Switch(
                            activeTrackColor: Colors.green,
                            activeColor: Colors.white,
                            value: val,
                            onChanged: (value) {
                              ref.read(updateSwitchProvider.notifier).state = value;
                            },
                          );
                        })
                      ],
                    ),
                  ],
                ),
                ListTile(
                  title: Text(
                    "Help & Support",
                    style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.question_mark_rounded,
                    color: color.deepOrangeAccent,
                  ),
                ),
                SizedBox(height:300.h,),
                Divider(height:4.h,thickness:3.h ,),
                Container(
                  margin:EdgeInsets.only(left:15.w),
                  
                  child: Row(
                    mainAxisSize:MainAxisSize.min,
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                    Icon(Icons.arrow_left,color:color.deepOrangeAccent,),
                    Text("Log Out")
                  ],),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
