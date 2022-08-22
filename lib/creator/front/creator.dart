import 'package:creator/creator/front/animated_button.dart';
import 'package:creator/creator/front/radio_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:radio_grouped_buttons/radio_grouped_buttons.dart';

import '../back/creator_vm.dart';

class Creator extends StatelessWidget {
  const Creator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreatorVM>.reactive(
      viewModelBuilder: () => CreatorVM(),
      onModelReady: ((model) => model.initAssets()),
      builder: (context, viewModel, child) => SafeArea(
        child: Scaffold(
            body: Column(
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: 400,
                        child: Cube(
                          onSceneCreated: (Scene scene) {
                            scene.world.add(Object(fileName: 'assets/elements/11788_Necklace_l2.obj', scale:
                            viewModel.selectedNecklace.scale * 12,
                            ));
                          },
                        )),
                  ),
                ),
                const Spacer(),
                const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                        padding: EdgeInsets.all(50), child: RadioWidget())),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: 350,
                      child: CustomRadioButton(
                        buttonLables: viewModel.selectedList
                            .map((e) => e.image.toString())
                            .toList(),
                        buttonValues: viewModel.selectedList,
                        images:
                            viewModel.selectedList.map((e) => e.image).toList(),
                        imagesWidth: 80,
                        imagesHeight: 80,
                        radioButtonValue: (value, index) {
                          viewModel.paintItem(viewModel.selectedList[index]);
                        },
                        enableShape: true,
                        buttonSpace: 5,
                        buttonColor: Colors.white,
                        selectedColor: Colors.cyan,
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
