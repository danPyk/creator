import 'package:creator/creator/back/item.dart';
import 'package:creator/creator/front/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart' as cube;
import 'package:stacked/stacked.dart';
import 'package:radio_grouped_buttons/radio_grouped_buttons.dart';
import 'package:flutter_cube/flutter_cube.dart';

import '../back/creator_vm.dart';
import '../back/items_lists.dart';

class Creator extends StatelessWidget {
  const Creator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreatorVM>.reactive(
      viewModelBuilder: () => CreatorVM(),
      onModelReady: ((model) {
        model.selectedItems = headsItems;
        model.initImages();
      }),
      builder: (context, viewModel, child) => SafeArea(
        child: Scaffold(
            body: Column(
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: 400,

                        //todo loading spinning
                        child: Cube(
                          onSceneCreated: (Scene scene) {
                            viewModel.mainScene = scene;

                            Item object =
                                viewModel.createItemBasedOnPrevious(0);
                            viewModel.selectedItem = object;
                            viewModel.previousSelectedElement = object;

                            loadTexture(cube.Material(),
                                'assets/elements/pendants/6.mtl');
                            scene.world.add(object.object);
                            //viewModel.mainScene.world.updateTransform();
                          },
                        )),
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 300,
                            child: CustomRadioButton(
                              buttonLables:
                                  viewModel.selectedGroupOfObjectsLabels,
                              buttonValues:
                                  viewModel.selectedGroupOfObjectsLabels,
                              radioButtonValue: (value, index) {
                                if (index == 0) {
                                  viewModel.selectedGroupOfObjects =
                                      ItemType.head;
                                }
                                if (index == 1) {
                                  viewModel.selectedGroupOfObjects =
                                      ItemType.hair;
                                }
                                if (index == 2) {
                                  viewModel.selectedGroupOfObjects =
                                      ItemType.plus;
                                }
                                viewModel.updateElementsList(
                                    viewModel.selectedGroupOfObjects);
                                viewModel.initImages();
                              },
                              enableShape: true,
                              buttonSpace: 5,
                              buttonColor: Colors.white,
                              selectedColor: Colors.black,
                              buttonWidth: 125,
                              buttonHeight: 80,
                            ),
                          ),
                        )),
                    Row(
                      children: [
                        Text('X'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => viewModel.moveObjectXLeft(),
                        ),
                        IconButton(
                          icon: const Icon(Icons.abc_outlined),
                          onPressed: () => viewModel.moveObjectXRight(),
                        ),
                      ],
                    ),      Row(
                      children: [
                        Text('Y'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => viewModel.moveObjectYLeft(),
                        ),
                        IconButton(
                          icon: const Icon(Icons.abc_outlined),
                          onPressed: () => viewModel.moveObjectYRight(),
                        ),
                      ],
                    ),      Row(
                      children: [
                        Text('Z'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => viewModel.moveObjectZLeft(),
                        ),
                        IconButton(
                          icon: const Icon(Icons.abc_outlined),
                          onPressed: () => viewModel.moveObjectZRight(),
                        ),
                      ],
                    ),
                    // IconButton( icon: Icon(Icons.abc), onPressed: ,),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: 350,
                      child: CustomRadioButton(
                        buttonLables: viewModel.selectedItems
                            .map((e) => e.imageName)
                            .toList(),
                        buttonValues: viewModel.selectedItems,
                        images: viewModel.images,
                        imagesWidth: 80,
                        imagesHeight: 80,
                        radioButtonValue: (value, index) {
                          viewModel.buildScene(index);
                        },
                        enableShape: true,
                        buttonSpace: 5,
                        buttonColor: Colors.white,
                        selectedColor: Colors.black,
                        buttonWidth: 150,
                        buttonHeight: 80,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
