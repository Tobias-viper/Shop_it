import 'package:riverpod/riverpod.dart';

import '../Pages/utils/list.dart';

class checkOut extends StateNotifier<int>{
  checkOut():super(0);

  Subtotal(){
    var items = cartitembuild;
    int total=0;
    for (int i = 0; i < items.length; i++) {
      
      total += int.parse(items[i].price)*int.parse(items[i].save["txt"].toString());
    }
    
    state=total;
  }

}