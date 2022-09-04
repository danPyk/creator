import 'package:creator/creator/back/item.dart';
import 'package:creator/creator/back/items_lists.dart';
import 'package:creator/creator/front/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart' as cube;

class CreatorVM extends ChangeNotifier {
  late List<Item> selectedItems;
  late List<Image>? images;

  late cube.Scene mainScene;

  ItemType selectedGroupOfObjects = ItemType.head;
  List<String> selectedGroupOfObjectsLabels = ["Head", "Hair", "Plus"];

  late Item selectedChain = Item(
      type: ItemType.hair,
      fileName: 'assets/elements/chain/11788_Necklace_l2.obj',
      object:
          cube.Object(fileName: 'assets/elements/chain/11788_Necklace_l2.obj'),
      scale: 5,
      imageName: 'assets/elements/chain2.png');

  late Item selectedItem;

  ///used to set new element in place of previous
  late Item previousSelectedElement = headsItems.first;

  ///construct new Object with proper scale and position
  Item createItemBasedOnPrevious(int index) {
    cube.Object object = cube.Object(
        fileName: selectedItems[index].fileName,
        scale: selectedItems[index].object.scale * selectedItems[index].scale,
        position: selectedItems[index].object.position,
        rotation: previousSelectedElement.object.rotation);

    return Item(
        type: selectedItems[index].type,
        fileName: selectedItems[index].fileName,
        object: object,
        scale: selectedItems[index].scale,
        imageName: selectedItems[index].imageName);
  }

  void buildScene(int index) {
    if (selectedItems[index].type != ItemType.head) {
      mainScene.world.remove(selectedChain.object);
      Item scaledObj = createItemBasedOnPrevious(index);
      selectedChain = scaledObj;

      mainScene.world.add(scaledObj.object);

      mainScene.update();
    } else {
      mainScene.world.remove(selectedItem.object);
      mainScene.update();

      Item scaledObj = createItemBasedOnPrevious(index);

      selectedItem = scaledObj;

      mainScene.world.add(scaledObj.object);

      mainScene.update();
    }
  }

  //todo make lists static
  void initImages() {
    List<Image>? list =
        selectedItems.map((e) => Image.asset(e.imageName)).toList();
    images = list;
  }

  void updateElementsList(ItemType? selectQueryType) {
    if (selectQueryType == ItemType.hair) {
      selectedItems = hairsItems;
    }

    if (selectQueryType == ItemType.plus) {
      selectedItems = plusItems;
    }

    if (selectQueryType == ItemType.head) {
      selectedItems = headsItems;
    }
    notifyListeners();
  }

  void moveObjectXLeft() {
    selectedItem.object.position.setValues(selectedItem.object.position.x + 0.5,
        selectedItem.object.position.y, selectedItem.object.position.z);

    selectedItem.object.updateTransform();
  }

  void moveObjectXRight() {
    selectedItem.object.position.setValues(selectedItem.object.position.x - 0.5,
        selectedItem.object.position.y, selectedItem.object.position.z);

    selectedItem.object.updateTransform();
  }

  void moveObjectYLeft() {
    selectedItem.object.position.setValues(selectedItem.object.position.x,
        selectedItem.object.position.y + 0.5, selectedItem.object.position.z);

    selectedItem.object.updateTransform();
  }

  void moveObjectYRight() {
    selectedItem.object.position.setValues(selectedItem.object.position.x,
        selectedItem.object.position.y - 0.5, selectedItem.object.position.z);

    selectedItem.object.updateTransform();
  }

  void moveObjectZLeft() {
    selectedItem.object.position.setValues(selectedItem.object.position.x,
        selectedItem.object.position.y, selectedItem.object.position.z + 0.5);

    selectedItem.object.updateTransform();
  }

  void moveObjectZRight() {
    selectedItem.object.position.setValues(selectedItem.object.position.x,
        selectedItem.object.position.y, selectedItem.object.position.z - 0.5);

    selectedItem.object.updateTransform();
  }

  int findElementIndexBaseOnFilename() {
    return selectedItems
        .indexWhere((element) => element.fileName == selectedItem.fileName);
  }
}
