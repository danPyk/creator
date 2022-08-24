import 'package:creator/creator/back/creator_vm.dart';
import 'package:creator/creator/back/item.dart';
import 'package:creator/creator/front/radio_button.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

class RadioWidget extends ViewModelWidget<CreatorVM> {
   RadioWidget({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context, CreatorVM viewModel) {
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

                  viewModel.setItemType(ItemType.pendant);

                  viewModel.updateRightButton(viewModel.selectedItemType);
                  viewModel.updateElementsList(viewModel.selectedItemType);
                },
                color: viewModel.pendantColor,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RadioButton(
                  'Chain',
                  () {

                    viewModel.setItemType(ItemType.chain);
                    viewModel.updateRightButton(viewModel.selectedItemType);
                    viewModel.updateElementsList(viewModel.selectedItemType);

                  },
                  color: viewModel.chainColor,
                ),
              ),
              RadioButton(
                'Plus',
                () {

                  viewModel.setItemType(ItemType.plus);

                  viewModel.updateRightButton(viewModel.selectedItemType);
                  viewModel.updateElementsList(viewModel.selectedItemType);

                },
                color: viewModel.plusColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
