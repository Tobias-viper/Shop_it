import 'package:riverpod/riverpod.dart';
import 'package:shop_it/utils/color.dart';
import 'package:flutter/material.dart';

class T_a extends StateNotifier<List<Color>>{
  T_a():super([color.deepOrangeAccent,color.white,color.white,color.white]);

  void update(int f){
    List<Color> initial = [...state];
    for(int i =0;i<4;i++){
      (i==f)? initial[f]=color.deepOrangeAccent : initial[i]=color.white;
    }
    state=initial;
  }
}

