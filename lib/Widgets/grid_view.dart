import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_it/Pages/utils/list.dart';
import 'package:shop_it/Pages/utils/scroll_details.dart';


class dynamicGrid extends StatefulWidget {
  dynamicGrid({Key? key, required this.indexOfcat}) : super(key: key);
  int? indexOfcat;
  @override
  State<dynamicGrid> createState() => _dynamicGridState();
}

class _dynamicGridState extends State<dynamicGrid> {
  ScrollController? _control;
  double? _lastoffset;
  @override
  void initState() {
    super.initState();
    _control = ScrollController(initialScrollOffset:categoriesScrollPos[widget.indexOfcat!]);
    _control!.addListener(
      () {
        _lastoffset=_control!.offset;
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if(_lastoffset != null){
    categoriesScrollPos[widget.indexOfcat!]=_lastoffset!;
    }
    _control!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _control,
      padding: EdgeInsets.only(left: 25.w),
      itemCount: grid_dynamic.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 200.h,
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 12.h),
      itemBuilder: (_, index) => Align(
        alignment: Alignment.topLeft,
        child: grid_dynamic[index],
      ),
    );
  }
}
