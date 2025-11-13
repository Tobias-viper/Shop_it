import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/color.dart';
import '../Widgets/bar.dart';
import 'utils/list.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.transparent,
      body: (favitembuild.length == 0)
          ? Center(
              child: Container(
                child: Column(
                  children: [
                    SvgPicture.asset('assets/fav.svg',height:400.h,),
                    Text("Add to your favorite list")
                  ],
                ),
              ),
            )
          : GridView.builder(
              padding: EdgeInsets.only(left: 11.w, right: 12.w, top: 10.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18.w,
                  mainAxisSpacing: 10.h,
                  mainAxisExtent: 200.h),
              itemCount: favitembuild.length,
              itemBuilder: (_, index) {
                return Align(
                    alignment: Alignment.topLeft, child: favitembuild[index]);
              },
            ),
    );
  }
}
