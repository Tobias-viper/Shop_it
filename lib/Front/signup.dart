import 'package:flutter/material.dart';
import 'package:shop_it/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_it/Riverpod/provide.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Container(
          height: height,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
                  height: 450.h,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 30.sp),
                      ),
                      TextField(
                        style: TextStyle(color: color.white),
                        cursorColor: color.deepOrangeAccent,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          floatingLabelStyle: TextStyle(color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: color.deepOrangeAccent),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: color.deepOrangeAccent),
                          ),
                          labelText: "Email",
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: color.deepOrangeAccent),
                          ),
                        ),
                      ),
                      TextField(
                        style: TextStyle(color: color.white),
                        cursorColor: color.deepOrangeAccent,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          floatingLabelStyle: TextStyle(color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: color.deepOrangeAccent),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: color.deepOrangeAccent),
                          ),
                          labelText: "Username",
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: color.deepOrangeAccent),
                          ),
                        ),
                      ),
                      Consumer(
                        builder: (context, ref, c) {
                          final open = ref.watch(obscureTextProvider);
                          return TextField(
                            obscureText: open,
                            style: TextStyle(color: color.white),
                            cursorColor: color.deepOrangeAccent,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              floatingLabelStyle:
                                  TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: color.deepOrangeAccent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: color.deepOrangeAccent),
                              ),
                              labelText: "Password",
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: color.deepOrangeAccent, width: 10.w),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  ref.read(obscureTextProvider.notifier).state =
                                      !open;
                                },
                                child: (!open)
                                    ? Icon(
                                        Icons.visibility,
                                        color: color.white,
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        color: color.white,
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GestureDetector(
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
                                colors: [
                                  Colors.yellowAccent,
                                  color.deepOrangeAccent
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Have an account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: ()=>Navigator.pushNamed(context, "/logIn"),
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                color: color.deepOrangeAccent,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: SafeArea(
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                    height: 200.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello",
                            style: TextStyle(
                                fontSize: 30.sp, color: Colors.blueAccent)),
                        Text("Let's get started!",
                            style: TextStyle(fontSize: 30.sp))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
