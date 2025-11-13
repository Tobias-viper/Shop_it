import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_it/Pages/details/detail_page.dart';
import 'package:shop_it/Riverpod/provide.dart';
import '../utils/color.dart';

class display extends StatelessWidget {
  display(
      {Key? key,
      required this.data,
      required this.favorite,
      required this.image,
      required this.text,
      required this.price,
      required this.star,
      required this.save})
      : super(key: key);

  String image;
  String text;
  String price;
  int star;
  Map save; //this is used to save further info about this specific class

  bool favorite;
  Map<int, String>
      data; //this is to let us know where this class is been called from int rep the index and
  //string represents the screen calling this class display

  Future<void> toDetailPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => detailPage(
              save: save,
              data: data,
              image: image,
              text: text,
              price: price,
              star: star),
          maintainState: false),
    );
    favorite = result; //update our favorite
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return GestureDetector(
          onTap: () {
            ref.read(setFavoriteProvider.notifier).state = favorite;
            //initialize
            toDetailPage(context);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r), color: Colors.white),
            width: 150.r,
            height: 200.h,
            margin: EdgeInsets.only(left: 10.w),
            padding: EdgeInsets.only(
              bottom: 3.r,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      width: 150.r,
                      height: 120.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.r),
                              bottomRight: Radius.circular(20.r)),
                          color: Colors.blueAccent)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) {
                      if (index <= star) {
                        return Icon(
                          Icons.star_border_outlined,
                          color: color.yellow,
                        );
                      } else {
                        return Icon(Icons.star_border_outlined);
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "\$${price}",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
