import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_it/Pages/utils/list.dart';
import 'package:shop_it/Riverpod/provide.dart';
import 'package:shop_it/Widgets/call_cart_check.dart';
import 'package:shop_it/Widgets/display_card.dart';
import 'package:shop_it/utils/color.dart';
import '../Widgets/bar.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bar(Icons.menu, context, () {}),
      bottomNavigationBar: Container(
        color: color.white,
        height: 150.h,
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h),
        child: (cartitembuild.length==0)?
        Container():
        Consumer(
          builder:(_,ref,c) =>Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Subtotal"), Text("\$${ref.watch(checkOutProvider)}")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("VAT"), Text("0")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Total"), Text("\$${ref.watch(checkOutProvider)}")],
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Delivery"), Text("0")],
            ),
            Divider(
              color: color.ash,
              thickness: 3.h,
            ),
            SizedBox(
              height: 4.h,
            ),
            call_cart_Check("CHECKOUT(\$${ref.watch(checkOutProvider)})", () {})
          ]),
        ),
      ),
      body: SafeArea(
        child:(cartitembuild.length==0)? 
        Center(child: Column(
          children: [
            SvgPicture.asset("assets/empty_cart.svg",height:400.h,),
            Text("Empty Cart")
          ],
        )):
        SingleChildScrollView(
          padding: EdgeInsets.only(top: 12.h, left: 30.w, right: 30.w),
          child: Container(
            height: 420.h,
            child: ListView.separated(
              shrinkWrap:true,
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemCount: cartitembuild.length,
              itemBuilder: (_, index) {
                
                return CartCard(cartitembuild, index);
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget CartCard(List<display> cartitem, int index) {
  
  return Card(
    elevation: 5.r,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 50.h,
            width: 100.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/pic.png'), fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(4.r)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(cartitem[index].text),
              Row(
                children: List.generate(5, (ind) {
                  if (ind <= cartitem[index].star) {
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
              Text('\$${cartitem[index].price}')
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Free Delivery",
                style: TextStyle(
                    backgroundColor: color.deepOrangeAccent,
                    color: color.white),
              ),
              SizedBox(
                height: 10.h,
              ),
              Consumer(
                builder: (_, ref, c) {
                 
                 final txt=ref.watch(ItemsToProvider);
                
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          
                          int c_v=cartitem[index].save['txt'];
                          if(c_v>1){
                            ref.read(ItemsToProvider.notifier).state = c_v--;
                            cartitem[index].save['txt']=c_v;
                            ref.read(checkOutProvider.notifier).Subtotal();
                          }
                        
                          //decrease the quantity to buy
                        },
                        child: Container(
                          color: color.deepOrangeAccent,
                          width: 15.r,
                          height: 15.r,
                          padding: EdgeInsets.only(bottom: 5.h),
                          alignment: Alignment.center,
                          child: Text(
                            "-",
                            style:
                                TextStyle(fontSize: 15.sp, color: color.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(cartitem[index].save['txt'].toString()),
                      SizedBox(
                        width: 4.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          int c_v=cartitem[index].save['txt'];
                          if(c_v<101){
                          ref.read(ItemsToProvider.notifier).state =c_v++;
                          cartitem[index].save['txt']=c_v;
                          ref.read(checkOutProvider.notifier).Subtotal();
                          }
                          //increase the quantity to buy
                        
                        },
                        child: Container(
                          width: 15.r,
                          height: 15.r,
                          color: color.deepOrangeAccent,
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(bottom: 3.h),
                          child: Text(
                            "+",
                            style:
                                TextStyle(fontSize: 15.sp, color: color.white),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
          color: color.white, borderRadius: BorderRadius.circular(4.r)),
      height: 70.h,
    ),
  );
}
