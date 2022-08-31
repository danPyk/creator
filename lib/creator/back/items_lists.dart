
import 'package:flutter_cube/flutter_cube.dart' as cube;

import 'item.dart';


List<Item> plusItems = [
  Item.immutable(
      type: ItemType.plus,
      fileName: 'assets/elements/chain/11788_Necklace_l2.obj',
      object: cube.Object(
          fileName: 'assets/elements/chain/11788_Necklace_l2.obj'),
      scale: 12,
      imageName: 'assets/elements/chain2.png'),
];

 List<Item> pendantItems = [
   Item.immutable(
      type: ItemType.pendant,
      fileName: 'assets/elements/pendants/15527_WineGlassPendant_Penguin_v1.obj',
      object: cube.Object(
          fileName: 'assets/elements/pendants/15527_WineGlassPendant_Penguin_v1.obj'),
      scale: 6,
      imageName: 'assets/elements/pendants/pendant_key_bump.jpg'),
   Item.immutable(
      type: ItemType.pendant,
      fileName: 'assets/elements/pendants/11797_Pendant_v1_l2.obj',
      object: cube.Object(
          fileName: 'assets/elements/pendants/11797_Pendant_v1_l2.obj'),
      scale: 5,
      imageName: 'assets/elements/pendants/sample.png'),
];

List<Item> chainItems = [
  Item.immutable(
      type: ItemType.chain,
      fileName: 'assets/elements/chain/11788_Necklace_l2.obj',
      object: cube.Object(
          fileName: 'assets/elements/chain/11788_Necklace_l2.obj'),
      scale: 8,
      imageName: 'assets/elements/chain2.png'),
  Item.immutable(
      type: ItemType.chain,
      fileName: 'assets/elements/chain/11776_Necklace_v1_L3.obj',
      object: cube.Object(
          fileName: 'assets/elements/chain/11776_Necklace_v1_L3.obj'),
      scale: 3,
      imageName: 'assets/elements/chain2.png'),
];
