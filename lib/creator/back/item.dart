import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart' as cube;


enum ItemType { chain, plus, pendant }


class Item {
   ItemType type;
   String fileName;
   cube.Object object;
   double scale;
   String imageName;



  Item({required this.type, required this.fileName, required this.object,  required this.scale, required this.imageName});
}
