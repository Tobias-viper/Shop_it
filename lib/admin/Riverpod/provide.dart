import 'package:riverpod/riverpod.dart';

final screenContorller = StateProvider<int>((ref)=>0);

final rebuildProductItem = StateProvider<bool>((ref)=>true);

final rebuildCheckItem = StateProvider<bool>((ref)=>false);

final rebuildGridView =StateProvider<bool>((ref)=>true);

