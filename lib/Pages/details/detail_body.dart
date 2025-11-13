import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_it/Pages/details/list_view.dart';
import 'package:shop_it/Pages/utils/list.dart';
import 'package:shop_it/Riverpod/provide.dart';
import 'package:shop_it/Widgets/call_cart_check.dart';
import 'package:shop_it/utils/color.dart';

import '../../Widgets/display_card.dart';

class detailBody extends StatelessWidget {
  detailBody(
      {Key? key,
      required this.save,
      required this.data,
      required this.image,
      required this.text,
      required this.price,
      required this.star})
      : super(key: key);

  String image;
  String text;
  Map<int, String> data;
  String price;
  Map save;
  int star;
  bool kkk = true;
  String h =
      "dlllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll";

  Widget _Text(String t, VoidCallback onTap, bool hidden) {
    if (t.length > 150.h) {
      //30.h is just a guessed height you can use more or less
      int? line = 2;
      var text = t.substring(1, t.length - 50);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (hidden)
              ? Text(
                  text,
                  maxLines: line,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                )
              : Text(t,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp)),
          GestureDetector(
              onTap: onTap,
              child: Text((hidden) ? "See more" : "See less",
                  style: TextStyle(color: color.deepOrangeAccent)))
        ],
      );
    } else {
      return Text(t,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp));
    }
  }

  @override
  Widget build(BuildContext context) {
    var hh = MediaQuery.of(context).size;

    return Container(
      height: hh.height,
      child: Stack(
        children: [
          Container(
            height: hh.height - 140.h,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 8.h), //*
              child: Column(
                children: [
                  Container(
                    height: 210.h,
                    //color:Colors.amber,
                    child: detailDynamicList(),
                    margin: EdgeInsets.only(
                      left: 18.w,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Compart(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Free Delivery",
                              ),
                              Consumer(builder: (context, ref, child) {
                                bool fav_state = ref
                                    .read(setFavoriteProvider.notifier)
                                    .state;
                                bool start =
                                    ref.watch(startIconAnime(fav_state));

                                return (!start)
                                    ? GestureDetector(
                                        onTap: () {
                                          ref
                                              .read(
                                                  setFavoriteProvider.notifier)
                                              .state = !fav_state;
                                          ref
                                              .read(startIconAnime(fav_state)
                                                  .notifier)
                                              .state = !fav_state;

                                          //change favorite to false or true in the db

                                          //favorite = !start; //this for the local db
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content:
                                                  Text('Added to favorite'),
                                              backgroundColor:
                                                  color.deepOrangeAccent,
                                            ),
                                          );
                                          if (data.values.toList()[0] == "ld") {
                                            favitembuild.add(list_dynamic[
                                                int.parse(data.keys
                                                    .toList()[0]
                                                    .toString())]);
                                          } else if (data.values.toList()[0] ==
                                              "gd") {
                                            favitembuild.add(grid_dynamic[
                                                int.parse(data.keys
                                                    .toList()[0]
                                                    .toString())]);
                                          }
                                        },
                                        child: Icon(
                                          Icons.favorite_border_outlined,
                                          color: color.border,
                                        ))
                                    : GestureDetector(
                                        onTap: () {
                                          ref
                                              .read(
                                                  setFavoriteProvider.notifier)
                                              .state = !fav_state;
                                          ref
                                              .read(startIconAnime(fav_state)
                                                  .notifier)
                                              .state = !fav_state;

                                          //add or remove from favorite in the db

                                          //favorite = !start;//this for the local db*/

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'Removed from favorite'),
                                                  backgroundColor:
                                                      color.deepOrangeAccent));
                                          if (data.values.toList()[0] == "ld") {
                                            favitembuild.removeWhere(
                                                (element) =>
                                                    list_dynamic[int.parse(data
                                                            .keys
                                                            .toList()[0]
                                                            .toString())]
                                                        .hashCode ==
                                                    element.hashCode);
                                          } else if (data.values.toList()[0] ==
                                              "gd") {
                                            favitembuild.removeWhere(
                                                (element) =>
                                                    grid_dynamic[int.parse(data
                                                            .keys
                                                            .toList()[0]
                                                            .toString())]
                                                        .hashCode ==
                                                    element.hashCode);
                                          }
                                        },
                                        child: Icon(
                                          Icons.favorite,
                                          color: color.deepOrangeAccent,
                                        ));
                              } //you have to state favorite in the database for each display_card
                                  ),
                            ]),
                        Text("Description Comes here",
                            style: TextStyle(
                                fontSize: 17.sp, fontWeight: FontWeight.w500)),
                        Row(
                          children: List.generate(5, (index) {
                            if (index <= star) {
                              return Icon(
                                Icons.star_border_outlined,
                                color: color.yellow,
                                size: 10.sp,
                              );
                            } else {
                              return Icon(
                                Icons.star_border_outlined,
                                size: 10.sp,
                              );
                            }
                          }),
                        ),
                        Text(
                          price,
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Compart(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Description",
                            style: TextStyle(
                              fontSize: 17.sp,
                            )),
                        SizedBox(
                          height: 8.h,
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                                child: Padding(
                          padding: EdgeInsets.only(right: 30.w),
                          child: Consumer(builder: (_, ref, ch) {
                            final textState = ref.watch(Expandtext);
                            return _Text(h, () {
                              ref.read(Expandtext.notifier).state = !textState;
                            }, textState);
                          }),
                        ))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Compart(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h, right: 10.w),
                      child: Column(children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your size",
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.w800),
                            ),
                            Text("Size guide"),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              7, //must corresponds with
                              (index) => Consumer(builder: (_, ref, child) {
                                final List<Color> c_p =
                                    ref.watch(SizeColorProvider(7));

                                return GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(SizeColorProvider(7).notifier)
                                        .update(index); //must corresponds
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(right: 10.w),
                                    width: 30.r,
                                    height: 30.r,
                                    decoration: BoxDecoration(
                                        color: c_p[index],
                                        border: Border.all(
                                            width: 3,
                                            color: c_p[index] !=
                                                    color.deepOrangeAccent
                                                ? color.border
                                                : color.deepOrangeAccent)),
                                    child: Center(
                                      child: Text(
                                        "${39 + index}",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ]),
                    ), //this is where you check for categories
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Consumer(
              builder: (_, ref, child) {
                final check = ref.watch(currentCartNumberProvider);
                String bttnText;
                if (save.containsKey("bttnText")) {
                  bttnText = save["bttnText"];
                } else {
                  bttnText = ref
                      .read(cartCallerTextProvider.notifier)
                      .state; //this is the text to the button
                }

                return Container(
                  height: 60.h,
                  alignment: Alignment.topLeft,
                  width: hh.width,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 40.w, right: 10.w, top: 10.h),
                  child: call_cart_Check(
                    bttnText,
                    () {
                      if (bttnText[0].toLowerCase() == "a") {
                        //Add to cart
                        ref.read(currentCartNumberProvider.notifier).state += 1;
                        ref.read(cartCallerTextProvider.notifier).state =
                            "Remove from cart";
                        save["bttnText"] = "Remove from cart";
                        if (data.values.toList()[0] == "ld") {
                          cartitembuild.add(list_dynamic[
                              int.parse(data.keys.toList()[0].toString())]);
                        } else if (data.values.toList()[0] == "gd") {
                          cartitembuild.add(grid_dynamic[
                              int.parse(data.keys.toList()[0].toString())]);
                        }
                        ref.read(checkOutProvider.notifier).Subtotal();
                      } else {
                        //remove from cart
                        ref.read(currentCartNumberProvider.notifier).state -= 1;
                        ref.read(cartCallerTextProvider.notifier).state =
                            "Add to Cart";
                        save["bttnText"] = "Add to Cart";
                        if (data.values.toList()[0] == "ld") {
                          cartitembuild.removeWhere((element) =>
                              list_dynamic[int.parse(
                                      data.keys.toList()[0].toString())]
                                  .hashCode ==
                              element.hashCode);
                        } else if (data.values.toList()[0] == "gd") {
                          cartitembuild.removeWhere((element) =>
                              grid_dynamic[int.parse(
                                      data.keys.toList()[0].toString())]
                                  .hashCode ==
                              element.hashCode);
                        }
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget Compart({Widget? child}) {
  return Container(
      child: child,
      alignment: Alignment.topLeft,
      height: 100.h,
      padding: EdgeInsets.only(left: 18.w, top: 3.h, bottom: 3.h, right: 18.w),
      color: Colors.white);
}
