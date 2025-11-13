import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_it/Pages/account.dart';
import 'package:shop_it/Pages/favorite.dart';
import 'package:shop_it/Pages/home_page.dart';
import 'package:shop_it/Pages/notification.dart';
import 'package:shop_it/Riverpod/provide.dart';
import 'package:shop_it/Widgets/bar.dart';
import '../Widgets/cartlogo.dart';
import '../Widgets/drawer.dart';
import '../utils/color.dart';

class Shop extends StatelessWidget {
  Shop({Key? key}) : super(key: key);

  var screen = [
    HomePage(),
    Favorite(),
    Container(
      color: Colors.red,
    ),
    NotificationPage(),
    Account()
  ];
  @override
  Widget build(BuildContext context) {
    int _index = 0;
    final globalkey = GlobalKey<ScaffoldState>();
    return Consumer(
      builder: (_, ref, child) => Scaffold(
        key: globalkey,
        appBar: bar(
          Icons.menu,
          context,
          () {
            if (globalkey.currentState!.isDrawerOpen) {
              globalkey.currentState!.closeDrawer();
            } else {
              globalkey.currentState!.openDrawer();
            }
          },
        ),
        drawer: Container(
          color: color.white,
          width: 220.w,
          child: Draw(
            onTap: () {
              globalkey.currentState!.closeDrawer();
            },
          ),
          padding: EdgeInsets.only( ),
        ),
        backgroundColor: Color.fromARGB(245, 255, 255, 255),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Container(
          child: Consumer(
            builder: (context, ref, child) => BottomNavigationBar(
                selectedItemColor: color.deepOrangeAccent,
                unselectedItemColor: color.ash,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                currentIndex: ref.watch(BottomNavig),
                onTap: (int index) {
                  ref.read(BottomNavig.notifier).state = index;
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_outline), label: "Favourite"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.qr_code_2), label: "Scan QR"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.notifications_outlined),
                      label: "Notification"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline), label: "You")
                ]),
          ),
        ),
        body: Consumer(
          builder: (_, ref, child) {
            final int bttm = ref.watch(BottomNavig);
            return screen[bttm];
          },
        ),
      ),
    );
  }
}
