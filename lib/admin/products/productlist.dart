import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_it/admin/Riverpod/provide.dart';
import 'dart:math';

final ran = Random();
List<refinedcard>? kk;
int item = 10;

class ProductList extends StatelessWidget {
  ProductList({super.key});

  List<refinedcard> SearchItem = [];

  searchAlgorithm(String text) {
    SearchItem = [];
    for (int i = 0; i < kk!.length; i++) {
      if (kk![i].text.toLowerCase().contains(text.toLowerCase(), 0)) {
        SearchItem.add(kk![i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Consumer(builder: (context, ref, c) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 18.r),
              child: TextField(
                onTap: () {
                  SearchItem =[];
                  //final getState = ref.read(rebuildGridView.notifier).state;
                  ref.read(rebuildGridView.notifier).state = false;
                },
                onSubmitted: (check) {
                  if(check.length ==0){
                  //final getState = ref.read(rebuildGridView.notifier).state;
                  ref.read(rebuildGridView.notifier).state = true;
                  SearchItem =[];
                  }
                },
                onChanged: (searchText) async {
                  
                  await searchAlgorithm(searchText);
                  final getState = ref.read(rebuildCheckItem.notifier).state;
                  ref.read(rebuildCheckItem.notifier).state = !getState;
                  
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                ),
              ),
            );
          }),
          Consumer(builder: (context, ref, c) {
            final GridViewChanges = ref.watch(rebuildGridView);
            print(GridViewChanges);
            if (GridViewChanges) {
              return Consumer(
                builder: (context, ref, c) {
                  final rebuild = ref.watch(rebuildProductItem);
                  
                  kk = List.generate(
                    item,
                    (index) => refinedcard(index,
                        price: (index % 2 == 0) ? 300 : 100,
                        text: (index % 2 == 0) ? "s/s/s" : "sksk"),
                  );
                  return Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 10.h),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          mainAxisExtent: 200.h),
                      itemCount:
                          kk!.length,
                      itemBuilder: (_, index) {
                        return Align(
                            alignment: Alignment.topLeft,
                            child:  kk![index]);
                      },
                    ),
                  );
                },
              );
            }
            return Consumer(
              builder: (context, ref, c) {
                final searchChange = ref.watch(rebuildCheckItem);

                return Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        mainAxisExtent: 200.h),
                    itemCount: (SearchItem.length == 0)? 1:SearchItem.length ,
                    itemBuilder: (_, index) {
                      return Align(
                          alignment: Alignment.topLeft,
                          child: (SearchItem.length == 0)
                              ? Text("Not found")
                                  
                                
                              : SearchItem[index]);
                    },
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}

class refinedcard extends StatelessWidget {
  refinedcard(this.index, {Key? key, required this.text, required this.price})
      : super(key: key);
  String text;
  int price;
  int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.5.r,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        height: 200.h,
        width: 150.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/download.jpeg'),
                      fit: BoxFit.fill),
                ),
                width: 100.h,
                height: 100.h,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              text,
              overflow: TextOverflow.clip,
              maxLines: 1,
            ),
            SizedBox(height: 5.h),
            Text(
              price.toString(),
              overflow: TextOverflow.clip,
              maxLines: 1,
            ),
            SizedBox(height: 5.h),
            Expanded(child: EditDelete(index, context))
          ],
        ),
      ),
    );
  }

  Row EditDelete(index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          child: Container(
            width: 60.h,
            height: 30.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(
                color: Color.fromARGB(255, 209, 208, 208),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.edit,
                  color: Colors.grey,
                  size: 18.r,
                ),
                Text(
                  "Edit",
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: Container(
                    color: Colors.white,
                    height: 100.h,
                    width: 200.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Do you want to delete this item"),
                        Consumer(
                          builder: (context, ref, c) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      kk!.removeAt(index);
                                      item = kk!.length;
                                      final getState = ref
                                          .read(rebuildProductItem.notifier)
                                          .state;
                                      ref
                                          .read(rebuildProductItem.notifier)
                                          .state = !getState;

                                      Navigator.pop(context);
                                    },
                                    child: Text("Yes")),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("No"),
                                )
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Container(
            width: 67.h,
            height: 35.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(
                color: Color.fromARGB(255, 209, 208, 208),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.delete,
                  color: Colors.red,
                  //size:18.r,
                ),
                Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
