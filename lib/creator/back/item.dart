import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart' as cube;

class Item {
   String name;
   String fileName;
   cube.Object object;


  Item({required this.name, required this.fileName, required this.object});
}
