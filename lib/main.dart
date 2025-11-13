import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_it/Front/firstPage.dart';
import 'package:shop_it/Front/login.dart';
import 'package:shop_it/Front/signup.dart';
import 'package:shop_it/Pages/details/detail_page.dart';
import 'package:shop_it/admin/admin.dart';
import 'Pages/shop.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411.42857142857144, 683.4285714285714),
      builder: (context, _) => MaterialApp(
          routes: {
            '/signUp': (BuildContext context) => SignUp(),
            '/logIn': (BuildContext context) => Login()
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Admin()//Shop()
          ),
    );
  }
}
