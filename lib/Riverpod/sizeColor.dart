import 'package:riverpod/riverpod.dart';
import 'package:shop_it/utils/color.dart';
import 'package:flutter/material.dart';

class S_a extends StateNotifier<List<Color>>{
  S_a(super.state);
  void update(int f){
    List<Color> initial = [...state];
    for(int i =0;i<initial.length;i++){
      (i==f)? initial[f]=color.deepOrangeAccent : initial[i]=color.white;
    }
    state=initial;
  }

  
}