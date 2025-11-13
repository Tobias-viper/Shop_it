import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shop_it/Riverpod/TabColorChange.dart';
import 'package:shop_it/Riverpod/checkout.dart';
import 'package:shop_it/Riverpod/setfavorite.dart';
import 'package:shop_it/Riverpod/sizeColor.dart';

import 'iconAnime.dart';

final obscureTextProvider = StateProvider<bool>((ref)=>false);//to control the rebuild of the eye icon and the obsecure text for the signUp page

final obscureTextProvide =StateProvider<bool>((ref)=>false);//to control the rebuild of the eye icon and the obsecure text for the login page


final TabProvider = StateNotifierProvider<T_a, List<Color>>((ref) => T_a());

final BottomNavig = StateProvider<int>(((ref) => 0));

final Expandtext = StateProvider.autoDispose<bool>(((ref) => true));

final SizeColorProvider = StateNotifierProvider.family<S_a, List<Color>, int>(
  (ref, value) => S_a(
    List.generate(7, (index) => Colors.white),
  ),
);

final setFavoriteProvider =
    StateNotifierProvider<SetFavorite, bool>((ref) => SetFavorite());

final startIconAnime =
    StateNotifierProvider.family.autoDispose<IconAnime, bool, bool>(
  (ref, value) {
    return IconAnime(value);
  },
);

final currentCartNumberProvider = StateProvider<int>((ref) => 0);

final cartCallerTextProvider = StateProvider.autoDispose<String>(
  (ref) {
    return "Add to Cart";
  },
); //this is for changing the text for the add and remove from cart

final cartPageController = StateProvider<int>((ref) =>
    0); //contols opening and closing of the cartpage as well as changing the icon

final ItemsToProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
}); //to increase the quantity a user wants to buy

final removeItemsFromProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
}); //to reduce the quantity a user wants to buy

final rebuildRemovedNotificationProvider =
    StateProvider.autoDispose<int>((ref) {
  return 0;
}); //to rebuild whenever a notification is removed

final checkOutProvider = StateNotifierProvider<checkOut,int>(
  (ref){
    
    return checkOut();
  },
);

final updateSwitchProvider =StateProvider<bool>((ref) =>true);//switch to change background color

final seeBalanceProvider =StateProvider<bool>((ref)=>true);//to hide and open balance




