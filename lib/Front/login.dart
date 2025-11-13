import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_it/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Riverpod/provide.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController _control_1=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: s.height,
          child: Stack(
            children: [
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
                        Text("Hi",
                            style: TextStyle(
                                fontSize: 30.sp, color: Colors.blueAccent)),
                        Text("Welcome!", style: TextStyle(fontSize: 30.sp))
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  height: 500.h,
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                  width: s.width,
                  child: Column(
                   
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Log in",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 30.sp),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        cursorColor:color.deepOrangeAccent,
                        controller:_control_1,
                        
                        style:TextStyle(color:color.white),
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
                      SizedBox(
                        height: 20.h,
                      ),
                      Consumer(
                        builder: (context, ref, c) {
                          final open = ref.watch(obscureTextProvide);
                          return TextField(
                            cursorColor:color.deepOrangeAccent,
                            obscureText: open,
                            style:TextStyle(color:color.white),
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              floatingLabelStyle: TextStyle(color: Colors.white),
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
                                  ref.read(obscureTextProvide.notifier).state =
                                      !open;
                                },
                                child: (!open)
                                    ? Icon(Icons.visibility,color:color.white,)
                                    : Icon(Icons.visibility_off,color:color.white,),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      GestureDetector(
                        child: Container(
                          child: Text(
                            "Log in",
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
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: ()=>Navigator.pushNamed(context, "/signUp"),
                            child: Text(
                              "Sign up",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
