import 'package:creator/creator/front/radio_widget.dart';
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
      onModelReady: ((model) async {
        model.selectedList = pendantItems;
        await model.initImages();
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

                            scene.world.add(viewModel.selectedPendant.object);
                          },
                        )),
                  ),
                ),
                const Spacer(),
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                        padding: const EdgeInsets.all(50), child: RadioWidget())),
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
                        buttonLables: viewModel.selectedList
                            .map((e) => e.imageName)
                            .toList(),
                        buttonValues: viewModel.selectedList,
                        images: viewModel.selectedImages,
                        imagesWidth: 80,
                        imagesHeight: 80,
                        radioButtonValue: (value, index) {
                          viewModel.mainScene.world
                              .remove(viewModel.selectedPendant.object);
                          cube.Object scaledObj =
                              viewModel.createScaledItem(index);

                          viewModel.selectedPendant.object = scaledObj;

                          viewModel.mainScene.world.add(scaledObj);

                          viewModel.mainScene.update();
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
