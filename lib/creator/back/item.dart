import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart' as cube;


enum ItemType { chain, plus, pendant }


class Item {
   final ItemType type;
   final  String fileName;
   final cube.Object object;
   final double scale;
   final String imageName;



  const Item.immutable({required this.type, required this.fileName, required this.object,  required this.scale, required this.imageName});

   Item({required this.type, required this.fileName, required this.object,  required this.scale, required this.imageName});
}
