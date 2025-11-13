import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class draw extends StatelessWidget {
  draw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          color: Colors.white,
          width: s.width * .6,
          height: s.height,
          child: Column(
            children: [
              SizedBox(
                height: s.height * .02,
              ),
              Text(
                "Panel",
                style: TextStyle(fontSize: 25.sp, color: Colors.blueAccent),
              ),
              SizedBox(
                height: s.height * .02,
              ),
              
              ExpansionTile(
                textColor:Colors.black,
                iconColor:Colors.black,
                title: Text("Products"),
                leading: Icon(Icons.propane_sharp),
                children: [
                  TextButton(onPressed: () {}, child: Text("Add Product")),
                  TextButton(onPressed: () {}, child: Text("Product list")),
                  TextButton(onPressed: () {}, child: Text("Categories")),
                ],
              ),
              SizedBox(
                height: s.height * .02,
              ),
              ExpansionTile(
                
                textColor:Colors.black,
                iconColor:Colors.black,
                title: Text("Orders"),
                leading: Icon(Icons.shopping_cart),
                children: [
                  TextButton(
                    child: Text("Completed orders"),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 15.w,
                        ),
                        Text("Pending orders"),
                        CircleAvatar(
                          radius: 15.r,
                          backgroundColor: Colors.red,
                          child: Text("2"),
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: s.height * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "Complaint",
                    style:
                        TextStyle(color:Colors.black,fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 90.w,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Text("2"),
                  )
                ],
              ),
              SizedBox(
                height: s.height * .04,
              ),
              ListTile(
                leading: Icon(Icons.history_rounded),
                title: Text("Transactions"),
                trailing: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text("2"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
