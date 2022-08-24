import 'package:creator/creator/back/item.dart';
import 'package:creator/creator/back/items_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart' as cube;


enum SelectedItem { chain, plus, pendant }

class CreatorVM extends ChangeNotifier {
  late List<Item> selectedList;
  late List<Image>? selectedImages;


  late SelectedItem selectedEnum;
  late cube.Scene mainScene;

  late Item selectedChain ;
  late Item selectedPendant ;

  void setPendant(Item newNecklace) {
    Item item = Item(
        typeName: newNecklace.typeName,
        fileName: newNecklace.fileName,
        object: newNecklace.object,
        scale: newNecklace.scale,
        imageName: newNecklace.imageName);
    selectedPendant = item;

    notifyListeners();
  }

  Future<void> initImages() async {
    List<Image>? list = selectedList.map((e) => Image.asset(e.imageName)).toList();
    selectedImages = list;

  }

  void setEnum(SelectedItem newEnum) {
    selectedEnum = newEnum;

    notifyListeners();
  }

  void updateElementsList(SelectedItem? selectQueryType) {
    if (selectQueryType == SelectedItem.chain) {
      selectedList = chainItems;
    }

    if (selectQueryType == SelectedItem.plus) {
      selectedList = plusItems;
    }

    if (selectQueryType == SelectedItem.pendant) {
      selectedList = pendantItems;
    }

    notifyListeners();
  }

  ///right radio btn

  Color chainColor = Colors.white;
  Color plusColor = Colors.white;
  Color pendantColor = Colors.black;


  void updateRightButton(SelectedItem? selectQueryType) {
    if (selectQueryType == SelectedItem.chain) {
      chainColor = Colors.black;
      pendantColor = Colors.white;

      plusColor = Colors.white;
    }
    if (selectQueryType == SelectedItem.plus) {
      plusColor = Colors.black;
      chainColor = Colors.white;
      pendantColor = Colors.white;
    }
    if (selectQueryType == SelectedItem.pendant) {
      pendantColor = Colors.black;
      chainColor = Colors.white;
      plusColor = Colors.white;
    }

    notifyListeners();
  }
}
