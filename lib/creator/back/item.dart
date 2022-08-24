import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart' as cube;

class Item {
   String typeName;
   String fileName;
   cube.Object object;
   double scale;
   String imageName;



  Item({required this.typeName, required this.fileName, required this.object,  required this.scale, required this.imageName});
}
