import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_it/Pages/utils/list.dart';
import 'package:shop_it/Riverpod/provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 500.h,
        //color:Colors.red,
        child: Consumer(builder: (_, ref, c) {
          final check =ref.watch(rebuildRemovedNotificationProvider);
          return ListView.separated(
              separatorBuilder: (_, ind) => Container(
                    height: 5.h,
                    color: Colors.white,
                  ),
              itemBuilder: (_, ind) => ListTile(
                    tileColor: not_gen[ind].tileColor,
                    isThreeLine: true,
                    title: Text(
                      not_gen[ind].mainText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(not_gen[ind].secondText,
                            maxLines: 1, overflow: TextOverflow.ellipsis),
                        Text(not_gen[ind].thirdText,
                            maxLines: 1, overflow: TextOverflow.ellipsis)
                      ],
                    ),
                    onTap:(){
                      //open a new page  change color to white 
                      not_gen[ind].tileColor=Colors.white;
                      ref.read(rebuildRemovedNotificationProvider.notifier).state--;
                    },
                    leading: Icon(Icons.abc_outlined),
                    trailing: IconButton(
                        onPressed: () {
                          not_gen.removeWhere((element) =>
                              element.hashCode == not_gen[ind].hashCode);
                          ref.read(rebuildRemovedNotificationProvider.notifier).state++;
                        },
                        icon: Icon(Icons.cancel_outlined)),
                  ),
              itemCount: not_gen.length);
        }),
      ),
    );
  }
}
