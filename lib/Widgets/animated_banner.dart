import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Pages/utils/scroll_details.dart';

class AnimatedBanner extends StatefulWidget {
  const AnimatedBanner({Key? key}) : super(key: key);

  @override
  State<AnimatedBanner> createState() => _AnimatedBannerState();
}

class _AnimatedBannerState extends State<AnimatedBanner> {
  PageController? _control;
  double? save;
  bool stop=true;//stops timer from counting
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _control = PageController(initialPage:animated_bannerPage);
    _control!.addListener((){
        save=_control!.page;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => animate());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (save != null) {
      animated_bannerPage = save!.toInt();
    }
    stop=false;
    _control!.dispose();
  }

  animate() {
    
    Timer.periodic(
      Duration(seconds: 5),
      (_) {
        if(stop){
        if (_control!.page != 5) {
          _control!.nextPage(
              duration: Duration(seconds:3), curve: Curves.linearToEaseOut);
        }
        else{
            
            _control!.jumpToPage(0);
        }}
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(left: 15.w),
          //width: 300.w,
          height: 100.h,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _control,
            onPageChanged: (index) {},
            itemCount: 6,
            itemBuilder: (_, ind) => Align(
              alignment: Alignment.topCenter,
              child: Container(
                //margin: EdgeInsets.only(left: 15.w),
                width: 200.w,
                height: 100.h,
                color: (ind % 2 == 0) ? Colors.red : Colors.greenAccent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
