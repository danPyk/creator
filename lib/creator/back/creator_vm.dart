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
      type: ItemType.chain,
      fileName: 'assets/elements/chain/11788_Necklace_l2.obj',
      object:
          cube.Object(fileName: 'assets/elements/chain/11788_Necklace_l2.obj'),
      scale: 5,
      imageName: 'assets/elements/chain2.png');

  Item get selectedChain => _selectedChain;

  set selectedChain(Item selectedChain) {
    _selectedChain = selectedChain;
  }

  late Item _selectedPendant = Item(
      type: ItemType.pendant,
      fileName: 'assets/elements/pendants/11797_Pendant_v1_l2.obj',
      object: cube.Object(
          fileName: 'assets/elements/pendants/11797_Pendant_v1_l2.obj'),
      scale: 5,
      imageName: 'assets/elements/chain2.png');

  Item get selectedPendant => _selectedPendant;

  set selectedPendant(Item selectedPendant) {
    _selectedPendant = selectedPendant;
  }

  ///construct new Object with proper scale and position
  Item createItemBasedOnPrevious(int index) {
    cube.Object object = cube.Object(
        fileName: selectedItems[index].fileName,
        scale: selectedItems[index].object.scale * selectedItems[index].scale,
        position: selectedItems[index].object.position);

    return Item(
        type: selectedItems[index].type,
        fileName: selectedItems[index].fileName,
        object: object,
        scale: selectedItems[index].scale,
        imageName: selectedItems[index].imageName);
  }

  void buildScene(int index) {
    if (selectedItems[index].type != ItemType.pendant) {
      mainScene.world.remove(selectedChain.object);
      Item scaledObj = createItemBasedOnPrevious(index);
      selectedChain = scaledObj;

      mainScene.world.add(scaledObj.object);

      mainScene.update();
    } else {
      mainScene.world.remove(selectedPendant.object);
      Item scaledObj = createItemBasedOnPrevious(index);

      selectedPendant = scaledObj;

      mainScene.world.add(scaledObj.object);

      mainScene.update();
    }
  }

  //make lists static
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
    if (selectQueryType == ItemType.chain) {
      selectedItems = chainItems;
    }

    if (selectQueryType == ItemType.plus) {
      selectedItems = plusItems;
    }

    if (selectQueryType == ItemType.pendant) {
      selectedItems = pendantItems;
    }
  }
}
