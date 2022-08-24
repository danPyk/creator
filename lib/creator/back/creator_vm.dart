import 'package:creator/creator/back/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart' as cube;

import '../front/animated_button.dart';

enum SelectedEnum { chain, plus, pendant }

class CreatorVM extends ChangeNotifier {
  late List<AnimatedItem> selectedList  ;
  late Image selectedElement;

  late VoidCallback voidCallback ;

  late SelectedEnum selectedEnum;
  late cube.Scene mainScene ;

  Item selectedNecklace = Item(name: 'neklace', fileName: 'assets/elements/11788_Necklace_l2.obj', object: cube.Object(fileName: 'assets/elements/11788_Necklace_l2.obj'));
  late List<AnimatedItem> chainItems;
  void setNecklace(Item newNecklace) {
    Item item = Item(name: newNecklace.name, fileName: newNecklace.fileName, object: newNecklace.object);
    selectedNecklace = item;


    notifyListeners();
  }

  Color chainColor = Colors.white;
  Color plusColor = Colors.white;
  Color pendantColor = Colors.black;

  Future<List<Image>> initAssets() async {
     List<Image> list = selectedList.map((e) => e.image).toList();

    return list;
  }

  void setEnum(SelectedEnum newEnum) {
    selectedEnum = newEnum;

    notifyListeners();
  }

  void updateElementsList(SelectedEnum? selectQueryType) {
    if (selectQueryType == SelectedEnum.chain) {
      selectedList = chainItems;
    }

    if (selectQueryType == SelectedEnum.plus) {
      selectedList = plusItems;
    }

    if (selectQueryType == SelectedEnum.pendant) {
      selectedList = pendantItems;
    }

    notifyListeners();
  }

  void updateRightButton(SelectedEnum? selectQueryType) {
    if (selectQueryType == SelectedEnum.chain) {
      chainColor = Colors.black;
      pendantColor = Colors.white;

      plusColor = Colors.white;
    }
    if (selectQueryType == SelectedEnum.plus) {
      plusColor = Colors.black;
      chainColor = Colors.white;
      pendantColor = Colors.white;
    }
    if (selectQueryType == SelectedEnum.pendant) {
      pendantColor = Colors.black;
      chainColor = Colors.white;
      plusColor = Colors.white;
    }

    notifyListeners();
  }

  List<AnimatedItem> initChains() {
     chainItems = [

      AnimatedItem(
        onPressed: () => null,

        image: Image.asset('assets/elements/chain2.png'),
        item: Item(name: 'neklace', fileName: 'assets/elements/11788_Necklace_l2.obj', object: cube.Object(fileName: 'assets/elements/11788_Necklace_l2.obj'))
,      ),
       AnimatedItem(
         onPressed: () => null,

         image: Image.asset('assets/elements/11776.png'),
         item: Item(name: 'neklace', fileName: 'assets/elements/11788_Necklace_l2.obj', object: cube.Object(fileName: 'assets/elements/11776_Necklace_v1_L3.obj')),
       ),
    ];
     return chainItems;
  }

  List<AnimatedItem> plusItems = [
    AnimatedItem(
      onPressed: () => null,
      image: Image.asset('assets/elements/11776.png'),
      item: Item(name: 'neklace', fileName: 'assets/elements/11788_Necklace_l2.obj', object: cube.Object(fileName: 'assets/elements/11788_Necklace_l2.obj'))
    ),
  ];

  List<AnimatedItem> pendantItems = [
    AnimatedItem(
      onPressed: () => null,
      image: Image.asset('assets/elements/11776.png'),
      item: Item(name: 'neklace', fileName: 'assets/elements/11788_Necklace_l2.obj', object: cube.Object(fileName: 'assets/elements/11788_Necklace_l2.obj'))
    ),
  ];


}
