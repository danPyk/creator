import 'package:flutter/material.dart';

import 'package:flutter_cube/flutter_cube.dart' as cube;

import 'item.dart';

int scale = 1;
//cube.Vector3 smallScale = cube.Vector3(0.1, 0.1, 0.1);

List<Item> plusItems = [
  Item(
      typeName: 'neklace',
      fileName: 'assets/elements/neckles/11788_Necklace_l2.obj',
      object: cube.Object(
          fileName: 'assets/elements/neckles/11788_Necklace_l2.obj'),
      scale: 12,
      imageName: 'assets/elements/chain2.png'),
];

List<Item> pendantItems = [
  Item(
      typeName: 'pendant',
      fileName: 'assets/elements/pendants/15527_WineGlassPendant_Penguin_v1.obj',
      object: cube.Object(
          fileName: 'assets/elements/pendants/15527_WineGlassPendant_Penguin_v1.obj'),
      scale: 2,
      imageName: 'assets/elements/chain2.png'),
  Item(
      typeName: 'pendant',
      fileName: 'assets/elements/pendants/11797_Pendant_v1_l2.obj',
      object: cube.Object(
          fileName: 'assets/elements/pendants/11797_Pendant_v1_l2.obj'),
      scale: 2,
      imageName: 'assets/elements/chain2.png'),
];

List<Item> chainItems = [
  Item(
      typeName: 'pendant',
      fileName: 'assets/elements/neckles/11788_Necklace_l2.obj',
      object: cube.Object(
          fileName: 'assets/elements/neckles/11788_Necklace_l2.obj'),
      scale: 2,
      imageName: 'assets/elements/chain2.png'),
  Item(
      typeName: 'pendant',
      fileName: 'assets/elements/neckles/11776_Necklace_v1_L3.obj',
      object: cube.Object(
          fileName: 'assets/elements/neckles/11776_Necklace_v1_L3.obj'),
      scale: 2,
      imageName: 'assets/elements/chain2.png'),
];
