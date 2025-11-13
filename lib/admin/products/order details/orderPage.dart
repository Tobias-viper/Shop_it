import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderPage extends StatelessWidget {
  OrderPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (_, index) {
              return Container(
                color: Colors.red,
                height: 200.h,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date and time"),
                        DropdownButton(items:[DropdownMenuItem(child:Text("Done"))], onChanged:(p){})
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
