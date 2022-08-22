import 'package:creator/creator/back/elemets_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

import '../front/animated_button.dart';

enum SelectedEnum { chain, plus, pendant }

class CreatorVM extends ChangeNotifier {
  late List<AnimatedItem> selectedList = chainItems;
  late Image selectedElement;

  late SelectedEnum selectedEnum;

  Object selectedNecklace = Object(fileName: 'assets/elements/11788_Necklace_l2.obj');


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

  List<AnimatedItem> chainItems = [
    AnimatedItem(
      onPressed: () => null,
      image: Image.asset('assets/elements/chain2.png'),
    ),
    AnimatedItem(
      onPressed: () => null,
      image: Image.asset('assets/elements/chain2.png'),
    ),
    AnimatedItem(
      onPressed: () => null,
      image: Image.asset('assets/elements/chain2.png'),
    ),
    AnimatedItem(
      onPressed: () => null,
      image: Image.asset('assets/elements/chain2.png'),
    ),
    AnimatedItem(
      onPressed: () => null,
      image: Image.asset('assets/elements/chain2.png'),
    ),
    AnimatedItem(
      onPressed: () => null,
      image: Image.asset('assets/elements/chain2.png'),
    ),
    AnimatedItem(
      onPressed: () => null,
      image: Image.asset('assets/elements/chain2.png'),
    ),
    AnimatedItem(
      onPressed: () => null,
      image: Image.asset('assets/elements/chain2.png'),
    ),
  ];

  List<AnimatedItem> plusItems = [
    AnimatedItem(
        onPressed: () => null, image: Image.asset('assets/elements/plus.png')),
    AnimatedItem(
      onPressed: () => null,
      image: Image.asset('assets/elements/chain2.png'),
    ),
    AnimatedItem(
        onPressed: () => null, image: Image.asset('assets/elements/plus.png')),
    AnimatedItem(
      onPressed: () => null,
      image: Image.asset('assets/elements/chain2.png'),
    ),
    AnimatedItem(
        onPressed: () => null, image: Image.asset('assets/elements/plus.png')),
    AnimatedItem(
        onPressed: () => null, image: Image.asset('assets/elements/plus.png')),
    AnimatedItem(
      onPressed: () => null,
      image: Image.asset('assets/elements/chain2.png'),
    ),
    AnimatedItem(
        onPressed: () => null, image: Image.asset('assets/elements/plus.png')),
    AnimatedItem(
        onPressed: () => null, image: Image.asset('assets/elements/plus.png')),
    AnimatedItem(
        onPressed: () => null, image: Image.asset('assets/elements/plus.png')),
    AnimatedItem(
        onPressed: () => null, image: Image.asset('assets/elements/plus.png')),
    AnimatedItem(
        onPressed: () => null, image: Image.asset('assets/elements/plus.png')),
  ];

  List<AnimatedItem> pendantItems = [
    AnimatedItem(
        onPressed: () => null,
        image: Image.asset('assets/elements/circle.png')),
    AnimatedItem(
        onPressed: () => null,
        image: Image.asset('assets/elements/circle.png')),
    AnimatedItem(
        onPressed: () => null,
        image: Image.asset('assets/elements/circle.png')),
    AnimatedItem(
        onPressed: () => null,
        image: Image.asset('assets/elements/circle.png')),
    AnimatedItem(
        onPressed: () => null,
        image: Image.asset('assets/elements/circle.png')),
    AnimatedItem(
        onPressed: () => null,
        image: Image.asset('assets/elements/circle.png')),
    AnimatedItem(
        onPressed: () => null,
        image: Image.asset('assets/elements/circle.png')),
    AnimatedItem(
        onPressed: () => null,
        image: Image.asset('assets/elements/circle.png')),
    AnimatedItem(
        onPressed: () => null,
        image: Image.asset('assets/elements/circle.png')),
    AnimatedItem(
        onPressed: () => null,
        image: Image.asset('assets/elements/circle.png')),
  ];

  T paintItem<T>(T element) {

    T first = element; //Generic type as local variable
    print(first);
    return first;

  }
}
