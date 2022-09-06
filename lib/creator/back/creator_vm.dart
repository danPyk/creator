import 'dart:io';

import 'package:creator/creator/back/item.dart';
import 'package:creator/creator/back/items_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart' as cube;
import 'package:path_provider/path_provider.dart';

class CreatorVM extends ChangeNotifier {
  late List<Item> selectedItems;
  late List<Image>? images;

  late cube.Scene mainScene;
 ///used tyo manipulate right radio widget
  ItemType selectedGroupOfObjects = ItemType.head;
  List<String> selectedGroupOfObjectsLabels = ["Head", "Hair", "Addons"];

  Item selectedHair = hairsItems.first;
  Item selectedAddon = addonItems.first;
  Item selectedHead = headsItems.first;

  ///used to set new element in place of previous
  late Item previousSelectedElement = headsItems.first;

  Item createItem(int index) {
     cube.Object object = cube.Object();

     ///construct new ItemType.head with proper scale and previous position
    if (selectedItems[index].type == ItemType.head ||  selectedItems[index].type == ItemType.hair) {
      object = cube.Object(
          fileName: selectedItems[index].fileName,
          scale: selectedItems[index].object.scale * selectedItems[index].scale,
          position: selectedItems[index].object.position,
          rotation: previousSelectedElement.object.rotation);
    }

    if (selectedItems[index].type == ItemType.addons  ) {
      object = cube.Object(
          fileName: selectedItems[index].fileName,
          scale: selectedItems[index].object.scale * selectedItems[index].scale,
          position: selectedItems[index].object.position,
          rotation: selectedItems[index].object.rotation);
    }

    return Item(
        type: selectedItems[index].type,
        fileName: selectedItems[index].fileName,
        object: object,
        scale: selectedItems[index].scale,
        imageName: selectedItems[index].imageName);
  }

  void buildScene(int index) {
    if (selectedItems[index].type == ItemType.hair) {
      mainScene.world.remove(selectedHair.object);
      Item scaledObj = createItem(index);
      selectedHair = scaledObj;

      mainScene.world.add(scaledObj.object);

      mainScene.update();
    }
    if (selectedItems[index].type == ItemType.head) {
      mainScene.world.remove(selectedHead.object);
      mainScene.update();

      Item scaledObj = createItem(index);

      selectedHead = scaledObj;

      mainScene.world.add(scaledObj.object);

      mainScene.update();
    }
    if (selectedItems[index].type == ItemType.addons) {
      mainScene.world.remove(selectedAddon.object);
      mainScene.update();

      Item scaledObj = createItem(index);

      selectedAddon = scaledObj;

      mainScene.world.add(scaledObj.object);

      mainScene.update();
    }
  }

  void extractImages() {
    List<Image>? list =
        selectedItems.map((e) => Image.asset(e.imageName)).toList();
    images = list;
  }

  void updateElementsList(ItemType? selectQueryType) {
    if (selectQueryType == ItemType.hair) {
      selectedItems = hairsItems;
    }

    if (selectQueryType == ItemType.addons) {
      selectedItems = addonItems;
    }

    if (selectQueryType == ItemType.head) {
      selectedItems = headsItems;
    }
    notifyListeners();
  }

  Future<void> saveScene() async {
    final file = await _localFile;

    // Write the file


    var verticies = mainScene.world.mesh.vertices;
    cube.Object newObject = cube.Object();

    for(int i=0; i<verticies.length; i++){
      file.writeAsString('v ${verticies[0]} v ${verticies[1]} v ${verticies[2]} \n' );

    }

    print(file.readAsString());


  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter3.obj');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  void moveObjectXLeft() {
    selectedHead.object.position.setValues(selectedHead.object.position.x + 0.1,
        selectedHead.object.position.y, selectedHead.object.position.z);

    selectedHead.object.updateTransform();
    notifyListeners();
  }

  void moveObjectXRight() {
    selectedHead.object.position.setValues(selectedHead.object.position.x - 0.1,
        selectedHead.object.position.y, selectedHead.object.position.z);

    selectedHead.object.updateTransform();
    notifyListeners();
  }

  void moveObjectYLeft() {
    selectedHead.object.position.setValues(selectedHead.object.position.x,
        selectedHead.object.position.y + 0.1, selectedHead.object.position.z);

    selectedHead.object.updateTransform();
    notifyListeners();
  }

  void moveObjectYRight() {
    selectedHead.object.position.setValues(selectedHead.object.position.x,
        selectedHead.object.position.y - 0.1, selectedHead.object.position.z);

    selectedHead.object.updateTransform();
    notifyListeners();
  }

  void moveObjectZLeft() {
    selectedHead.object.position.setValues(selectedHead.object.position.x,
        selectedHead.object.position.y, selectedHead.object.position.z + 0.1);

    selectedHead.object.updateTransform();
    notifyListeners();
  }

  void moveObjectZRight() {
    selectedHead.object.position.setValues(selectedHead.object.position.x,
        selectedHead.object.position.y, selectedHead.object.position.z - 0.1);

    selectedHead.object.updateTransform();
    notifyListeners();
  }
}
