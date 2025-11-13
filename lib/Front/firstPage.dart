import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_it/utils/color.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      bottomNavigationBar: Container(
        height: 350.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.popAndPushNamed(context, '/signUp');
              },
              child: Container(
                child: Text(
                  "Create an account",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                height: 50.h,
                width: 250.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  gradient: LinearGradient(
                      colors: [Colors.yellowAccent, color.deepOrangeAccent],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                ),
              ),
            ),
            GestureDetector(
              onTap:()=>Navigator.popAndPushNamed(context, '/logIn'),
              child: Container(
                child: Text(
                  "Log in",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white12),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                height: 50.h,
                width: 250.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.white30),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(
                  height: 3.h,
                ),
                const Text(
                  "Or log in with",
                  style: const TextStyle(color: Colors.blueGrey),
                ),
                Divider(
                  height: 3.h,
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
      ),
    );
  }
}
