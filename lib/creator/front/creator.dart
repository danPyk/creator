import 'package:creator/creator/front/animated_button.dart';
import 'package:creator/creator/front/radio_widget.dart';
import 'package:flutter/material.dart';
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
      builder: (context, viewModel, child) => Scaffold(
          body: Column(
        children: [
          Row(
            children:  [
            // Stack(),
            //   ModelViewer(
            //     src: 'assets/elements/scene2.gltf',
            //     alt: "A 3D model of an astronaut",
            //     ar: true,
            //     autoRotate: true,
            //     cameraControls: true,
            //   ),
              const Spacer(),
              const Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: EdgeInsets.all(50), child: RadioWidget())),
            ],
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(

                children: <Widget> [ Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  child: CustomRadioButton(
                    buttonLables: viewModel.selectedList.map((e) => e.image.toString()).toList(),
                    buttonValues: viewModel.selectedList,
                    images:   viewModel.selectedList.map((e) => e.image).toList(),
                    imagesWidth: 30,
                    imagesHeight: 30,
                    radioButtonValue: (value,index){
                      viewModel.paintItem(viewModel.selectedList[index]);

                    },
                    enableShape: true,
                    buttonSpace: 5,
                    buttonColor: Colors.white,
                    selectedColor: Colors.cyan,
                    buttonWidth: 150,
                    buttonHeight: 80,
                  ),
                ),],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
