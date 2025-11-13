import 'package:riverpod/riverpod.dart';

class Quantity extends StateNotifier<int>{
  Quantity(super.state);
  
  add(int val){
    if(val<100){
      val+=1;
      state=val ;
    }
    else{
      state= val;
    }
  }

  remove(int val){
    
    if(val>1){
      val-=1;
      state = val;
    }
    else{
      state = val;
    }
  }
}