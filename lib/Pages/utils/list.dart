import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop_it/Pages/utils/notificlass.dart';

import '../../Widgets/display_card.dart';

var random = Random();
List<display> favitembuild = [];

List<display> cartitembuild = [];

List<display> list_dynamic = List.generate(
    10,
    (index) => display(
            data: {
              index: "ld"
            },
            save: {
              "txt": 1
            }, //"txt"here is for the number of item the user wants to buy
            favorite: false,
            image: '${random.nextInt(150)}',
            text: '${random.nextInt(90)}',
            price: "${random.nextInt(170)}",
            star: random.nextInt(4)));

List<display> grid_dynamic = List.generate(
    15,
    (index) => display(
            data: {
              index: "gd"
            },
            save: {
              "txt": 1
            }, //"txt"here is for the number of item the user wants to buy
            favorite: false,
            image: '${random.nextInt(150)}',
            text: '${random.nextInt(90)}',
            price: "${random.nextInt(1700)}",
            star: random.nextInt(4)));

List<NotClass> not_gen = List.generate(
    30,
    (index) => NotClass(
        tileColor: Color.fromRGBO(158, 158, 158, 1),
        mainText: "sssssssssssssssssssssssssssssssssssssss",
        secondText: "${random.nextInt(150)}",
        thirdText: "${random.nextInt(150)}"));
