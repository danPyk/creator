import 'package:flutter_cube/flutter_cube.dart' as cube;

import 'item.dart';

List<Item> plusItems = [
  Item.immutable(
      type: ItemType.plus,
      fileName: 'assets/elements/chain/11788_Necklace_l2.obj',
      object:
          cube.Object(fileName: 'assets/elements/chain/11788_Necklace_l2.obj'),
      scale: 12,
      imageName: 'assets/elements/chain2.png'),
];

List<Item> headsItems = [
  Item.immutable(
    type: ItemType.head,
    fileName: 'assets/elements/heads/Maxobj.obj',
    object: cube.Object(
      fileName: 'assets/elements/heads/Maxobj.obj',
        position: cube.Vector3(-1, -1, 0),
      rotation: cube.Vector3(0, 180, 0)
    ),
    scale: 8,
    imageName: 'assets/elements/heads/max_skin.jpg',
  ),
  Item.immutable(
    type: ItemType.head,
    fileName: "assets/elements/heads/PEEEWWWWWWDDDDSSSS.obj",
    object: cube.Object(
      fileName: "assets/elements/heads/PEEEWWWWWWDDDDSSSS.obj",
      position: cube.Vector3(-1, 0.7, 1)
    ),
    scale: 5,
    imageName: 'assets/elements/heads/kt_facebuilder_texture.png',
  ),
];

List<Item> hairsItems = [
  Item.immutable(
    type: ItemType.hair,
    fileName: 'assets/elements/pendants/6.obj',
    object: cube.Object(
      fileName: 'assets/elements/pendants/6.obj',
        position: cube.Vector3(-0.9, 1.5, 0)

    ),
    scale: 4,
    imageName: 'assets/elements/pendants/pendant_key_bump.jpg',
  ),
  Item.immutable(
    type: ItemType.hair,
    fileName: 'assets/elements/pendants/7.obj',
    object: cube.Object(
      fileName: 'assets/elements/pendants/7.obj',
        position: cube.Vector3(-0.9, 1.5, 0)

    ),
    scale: 4,
    imageName: 'assets/elements/pendants/pendant_key_bump.jpg',
  ),
  Item.immutable(
    type: ItemType.hair,
    fileName: 'assets/elements/pendants/8.obj',
    object: cube.Object(
      fileName: 'assets/elements/pendants/8.obj',
        position: cube.Vector3(-0.9, 1.5, 0)

    ),
    scale: 5,
    imageName: 'assets/elements/pendants/pendant_key_bump.jpg',
  ),
  Item.immutable(
    type: ItemType.hair,
    fileName: 'assets/elements/pendants/9.obj',
    object: cube.Object(
      fileName: 'assets/elements/pendants/9.obj',
        position: cube.Vector3(-0.9, 1.5, 0)

    ),
    scale: 5,
    imageName: 'assets/elements/pendants/pendant_key_bump.jpg',
  ),
];
