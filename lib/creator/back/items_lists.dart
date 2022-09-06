import 'package:flutter_cube/flutter_cube.dart' as cube;

import 'item.dart';

List<Item> addonItems = [
  Item(
      type: ItemType.addons,
      fileName: 'assets/elements/addons/Clock_obj.obj',
      object: cube.Object(
          fileName: 'assets/elements/addons/Clock_obj.obj',
          position: cube.Vector3(-0.7, 2.3, -1.8), //-0.9, -0.4, -0.3
          rotation: cube.Vector3(0, 85, 0)),
      scale: 1,
      imageName: 'assets/elements/addons/Uhr_ohne_Zeiger.jpg'),
];

List<Item> headsItems = [
  Item(
    type: ItemType.head,
    fileName: 'assets/elements/heads/Maxobj.obj',
    object: cube.Object(
        fileName: 'assets/elements/heads/Maxobj.obj',
        position: cube.Vector3(-0.9, -0.4, -0.3), //-0.9, -0.4, -0.3
        rotation: cube.Vector3(-5.0, 175.0, 0.0)),
    scale: 7,
    imageName: 'assets/elements/heads/max_skin.jpg',
  ),
  Item(
    type: ItemType.head,
    fileName: "assets/elements/heads/PEEEWWWWWWDDDDSSSS.obj",
    object: cube.Object(
        fileName: "assets/elements/heads/PEEEWWWWWWDDDDSSSS.obj",
        position: cube.Vector3(-0.9, 1.1, 0.1)),
    scale: 4,
    imageName: 'assets/elements/heads/kt_facebuilder_texture.png',
  ),
];

List<Item> hairsItems = [

  Item(
    type: ItemType.hair,
    fileName: 'assets/elements/hairs/7.obj',
    object: cube.Object(
        fileName: 'assets/elements/hairs/7.obj',
        position: cube.Vector3(-0.9, 1.5, 0)),
    scale: 4,
    imageName: 'assets/elements/hairs/pendant_key_bump.jpg',
  ),
  Item(
    type: ItemType.hair,
    fileName: 'assets/elements/hairs/8.obj',
    object: cube.Object(
        fileName: 'assets/elements/hairs/8.obj',
        position: cube.Vector3(-0.9, 1.5, 0)),
    scale: 5,
    imageName: 'assets/elements/hairs/pendant_key_bump.jpg',
  ),

  Item(
    type: ItemType.hair,
    fileName: 'assets/elements/hairs/6.obj',
    object: cube.Object(
        fileName: 'assets/elements/hairs/6.obj',
        position: cube.Vector3(-0.9, 1.5, 0)),
    scale: 4,
    imageName: 'assets/elements/hairs/pendant_key_bump.jpg',
  ),

];
