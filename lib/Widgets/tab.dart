import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_it/Widgets/tabs.dart';
import 'package:shop_it/utils/color.dart';
import '../Riverpod/TabColorChange.dart';
import '../Riverpod/provide.dart';

class Tab_ extends ConsumerStatefulWidget {
  const Tab_({Key? key}) : super(key: key);

  @override
  ConsumerState<Tab_> createState() => _TabState();
}

class _TabState extends ConsumerState<Tab_> {
  @override
  Widget build(BuildContext context) {
    final m =ref.watch(TabProvider);
    return SingleChildScrollView(
      scrollDirection:Axis.horizontal,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Ta_b(
              text: "All",
              c_olor: ref.read(TabProvider),
              num_ta: 0,
              onTap: () {
                ref.read(TabProvider.notifier).update(0);
              },
            ),
            SizedBox(width:10.w,),
            Ta_b(
              
              text: "Supermarket",
              c_olor: ref.read(TabProvider),
              num_ta: 1,
              onTap: () {
                ref.read(TabProvider.notifier).update(1);
              },
              icon: Icons.shopify_sharp,
            ),
            SizedBox(width:10.w,),
            Ta_b(
              
              text: "Fashion",
              c_olor: ref.read(TabProvider),
              num_ta: 2,
              onTap: () {
                ref.read(TabProvider.notifier).update(2);
              },
              icon: Icons.face,
            ),
            SizedBox(width:10.w,),
            Ta_b(
              
              text: "Electronics",
              c_olor: ref.read(TabProvider),
              num_ta: 3,
              onTap: () {
                ref.read(TabProvider.notifier).update(3);
              },
              icon: Icons.home_max,
            )
          ]),
    );
  }
}
