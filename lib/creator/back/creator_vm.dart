import 'package:creator/creator/back/item.dart';
import 'package:creator/creator/back/items_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart' as cube;

class CreatorVM extends ChangeNotifier {
  late List<Item> selectedItems;
  late List<Image>? images;

  late ItemType selectedItemType;
  late cube.Scene mainScene;

  late Item _selectedChain = Item(
      type: ItemType.hair,
      fileName: 'assets/elements/chain/11788_Necklace_l2.obj',
      object:
          cube.Object(fileName: 'assets/elements/chain/11788_Necklace_l2.obj'),
      scale: 5,
      imageName: 'assets/elements/chain2.png');

  Item get selectedChain => _selectedChain;

  set selectedChain(Item selectedChain) {
    _selectedChain = selectedChain;
  }

  late Item selectedElement;
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
      mainScene.world.remove(selectedElement.object);
      mainScene.update();

      Item scaledObj = createItemBasedOnPrevious(index);

      selectedElement = scaledObj;

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

  void setItemType(ItemType newEnum) {
    selectedItemType = newEnum;

    notifyListeners();
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
  }
}
