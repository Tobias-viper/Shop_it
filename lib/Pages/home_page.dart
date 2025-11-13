import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_it/Pages/categories/electronics.dart';
import 'package:shop_it/Pages/categories/fashion.dart';
import 'package:shop_it/Pages/categories/supermarket.dart';
import 'package:shop_it/Pages/utils/scroll_details.dart';
import 'package:shop_it/Riverpod/provide.dart';
import 'package:shop_it/Widgets/animated_banner.dart';
import 'package:shop_it/Widgets/row_widget.dart';
import '../Widgets/tab.dart';
import 'categories/all.dart';
import 'package:shop_it/utils/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _screen = [All(), Market(), Fashion(), Electronics()];
  ScrollController? _controller;
  double? save;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    _controller = ScrollController(initialScrollOffset: home_pagePos);
    _controller!.addListener(() {
      save = _controller!.offset;
      
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (save != null) {
      home_pagePos = save!;
    }
    
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        controller:_controller,
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            AnimatedBanner(),
            SizedBox(
              height: 8.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.w, right: 20.w),
              height: 80.h,
              alignment: Alignment.topLeft,
              color: Colors.white,
              child: Column(children: [
                SizedBox(
                  height: 10.h,
                ),
                row(cat: "Categories"),
                SizedBox(
                  height: 10.h,
                ),
                Tab_()
              ]),
            ),
            SizedBox(height: 8.h),
            Container(
              height: 474.h,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Consumer(
                  builder: (_, ref, child) {
                    final List<Color> check = ref.watch(TabProvider);
                    return _screen[check.indexOf(color.deepOrangeAccent)];
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
