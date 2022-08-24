import 'package:creator/creator/back/item.dart';
import 'package:creator/creator/back/items_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart' as cube;

class CreatorVM extends ChangeNotifier {
  late List<Item> selectedList;
  late List<Image>? selectedImages;

  late ItemType selectedItemType;
  late cube.Scene mainScene;

  late Item selectedChain;

  Item selectedPendant = Item(
      type: ItemType.chain,
      fileName: 'assets/elements/pendants/11797_Pendant_v1_l2.obj',
      object: cube.Object(
          fileName: 'assets/elements/pendants/11797_Pendant_v1_l2.obj'),
      scale: 5,
      imageName: 'assets/elements/chain2.png');

  cube.Object createScaledItem(int index) {
    ///construct new Object with proper scale
    return cube.Object(
        fileName: selectedList[index].fileName,
        scale: selectedList[index].object.scale * selectedList[index].scale);
  }

  Future<void> initImages() async {
    List<Image>? list =
        selectedList.map((e) => Image.asset(e.imageName)).toList();
    selectedImages = list;
  }

  void setItemType(ItemType newEnum) {
    selectedItemType = newEnum;

    notifyListeners();
  }

  void updateElementsList(ItemType? selectQueryType) {
    if (selectQueryType == ItemType.chain) {
      selectedList = chainItems;
    }

    if (selectQueryType == ItemType.plus) {
      selectedList = plusItems;
    }

    if (selectQueryType == ItemType.pendant) {
      selectedList = pendantItems;
    }

    notifyListeners();
  }

  ///right radio btn

  Color chainColor = Colors.white;
  Color plusColor = Colors.white;
  Color pendantColor = Colors.black;

  void updateRightButton(ItemType? selectQueryType) {
    if (selectQueryType == ItemType.chain) {
      chainColor = Colors.black;
      pendantColor = Colors.white;

      plusColor = Colors.white;
    }
    if (selectQueryType == ItemType.plus) {
      plusColor = Colors.black;
      chainColor = Colors.white;
      pendantColor = Colors.white;
    }
    if (selectQueryType == ItemType.pendant) {
      pendantColor = Colors.black;
      chainColor = Colors.white;
      plusColor = Colors.white;
    }

    notifyListeners();
  }
}
