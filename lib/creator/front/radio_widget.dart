import 'package:creator/creator/back/creator_vm.dart';
import 'package:creator/creator/back/item.dart';
import 'package:creator/creator/front/radio_button.dart';
import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {
  final CreatorVM viewModel;

  const RadioWidget({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RadioWidgetState();
}

Color chainColor = Colors.white;
Color plusColor = Colors.white;
Color pendantColor = Colors.black;

void updateButtonColor(ItemType? selectQueryType) {
  if (selectQueryType == ItemType.hair) {
    chainColor = Colors.black;
    pendantColor = Colors.white;
    plusColor = Colors.white;
  }
  if (selectQueryType == ItemType.plus) {
    plusColor = Colors.black;
    chainColor = Colors.white;
    pendantColor = Colors.white;
  }
  if (selectQueryType == ItemType.head) {
    pendantColor = Colors.black;
    chainColor = Colors.white;
    plusColor = Colors.white;
  }
}

class RadioWidgetState extends State<RadioWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 4.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(
                20) // use instead of BorderRadius.all(Radius.circular(20))
            ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RadioButton(
                'Pendant',
                () {
                  widget.viewModel.setItemType(ItemType.head);

                  updateButtonColor(widget.viewModel.selectedItemType);
                  widget.viewModel
                      .updateElementsList(widget.viewModel.selectedItemType);
                  widget.viewModel.initImages();

                },
                color: pendantColor,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RadioButton(
                  'Chain',
                  () {
                    widget.viewModel.setItemType(ItemType.hair);
                    updateButtonColor(widget.viewModel.selectedItemType);
                    widget.viewModel
                        .updateElementsList(widget.viewModel.selectedItemType);
                    widget.viewModel.initImages();
                  },
                  color: chainColor,
                ),
              ),
              RadioButton(
                'Plus',
                () {
                  widget.viewModel.setItemType(ItemType.plus);

                  updateButtonColor(widget.viewModel.selectedItemType);
                  widget.viewModel
                      .updateElementsList(widget.viewModel.selectedItemType);
                  widget.viewModel.initImages();

                },
                color: plusColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
